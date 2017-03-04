DM 'LOG; CLEAR; OUT; CLEAR;';
OPTIONS NODATE NONUMBER;

DATA p4;
 DO nitrogen = 1 TO 6;
   DO rep = 1 TO 4;
      INPUT yield @@; OUTPUT;
   END; END;
 LINES;
  32.1  33.6  41.9  35.4 
  30.1  31.5  37.1  30.8 
  25.4  27.4  33.8  31.1 
  24.1  33.0  35.6  31.4 
  26.1  31.0  33.8  31.9 
  23.2  24.8  26.7  26.7  
 ;
PROC PRINT;
RUN;
proc glm data=p4;
class nitrogen;
model yield=nitrogen;
lsmeans;
run;
PROC GLMPOWER DATA = p4;
CLASS nitrogen;
MODEL yield=nitrogen;
POWER
STDDEV = 6.848753
ALPHA = 0.05
NTOTAL = 18 24 36 48
POWER = .;
TITLE ’Power Calc’;
RUN;

/* PROBLEM 5*/
proc contents data =p5data;
run;
data p5data;
set p5data;
newdollar = input(dollars,3.0); 
run;

proc glm data=p5data; 
title 'Graeco-Latin Square';
class rowsday colstore latin greek;
model newdollar = rowsday colstore latin greek;
means rowsday colstore latin greek / adjust=tukey alpha=
/*output out=graecosq r=Residuals p=Predicted;*/
run;
/*latin=package design*/

proc glm data=latin;
     title3 'Graeco-Latin Square (Car Driver Additive Run)';
     classes car driver additv runn;
     model yy=car driver additv runn;
     means car driver additv runn;
     output out=graecosq r=Residuals p=Predicted;
     run;

