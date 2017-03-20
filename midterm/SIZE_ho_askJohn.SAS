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
/*ask john how to make this work*/
/*http://www2.sas.com/proceedings/sugi30/263-30.pdf*/
proc means data=p4 mean;
class nitrogen;
var nitrogen;
output out=p4means mean=nitmean;
run;
proc glm data=p4;
class nitrogen;
model yield=nitrogen;
run;
/*ask john, now I can't read in my dataset that I made in r*/
PROC GLMPOWER DATA = p4means;
CLASS nitrogen;
MODEL mean=nitrogen;
POWER
STDDEV = 3.671833
ALPHA = 0.05 0.01
NTOTAL = .
POWER = 0.78 0.79 0.8 0.82 0.86 0.87 0.88 0.89 0.9 0.905 0.91 0.92 0.92 0.93 0.94 0.95;
RUN;
PROC GLMPOWER DATA = p4means;
CLASS nitrogen;
MODEL mean=nitrogen;
POWER
STDDEV = 3.671833
ALPHA = 0.05
NTOTAL = 12
POWER = .
;
RUN;

