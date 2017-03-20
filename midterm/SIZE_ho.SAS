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
model yield=nitrogen / ss3 solution;
lsmeans;
run;
PROC GLMPOWER DATA = p4;
CLASS nitrogen;
MODEL yield=nitrogen;
POWER
STDDEV = 3.671833
ALPHA = 0.05 0.10
NTOTAL = .
POWER = 0.80 0.801 0.802 0.803 0.8031 0.8032 0.8033 0.8034 0.8035 0.8036 0.8037 0.8038 0.8039 0.804 0.805 0.806 0.807 0.808 0.809 0.81 0.82 0.83 0.84 0.85 0.855 0.856 0.857 0.8575 0.858 0.8585 0.859 0.8595 0.9 0.905 0.91;
TITLE 'Power Calc';
RUN;
/* PROBLEM 5*/
proc contents data =p5data;
run;
data p5data1;
set p5data1;
newdollar = input(dollars,3.0); 
run;

proc glm data=p5data1; 
title 'Graeco-Latin Square';
class rowsday colstore latin greek;
model newdollar = rowsday colstore latin greek;
means latin / tukey alpha=0.05;
/*output out=graecosq r=Residuals p=Predicted;*/
run;
/*latin=package design*/

