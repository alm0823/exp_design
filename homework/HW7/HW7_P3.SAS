DATA IN; 
  DO TEMP = 300 TO 350 BY 50;
  DO OPER = 1 TO 3;
  DO CYCLE= 40 TO 60 BY 10;
  DO REP = 1 TO 4;
     INPUT SCORE @@; OUPUT;
  END; END; END; END;
LINES;
29.5 27.3 24.5 28.8   30.8 33.1 31.4 31.9   22.7 29.1 31.3 28.9 
25.7 23.4 19.3 26.3   28.4 29.3 31.6 28.4   30.3 22.7 21.9 24.7 
28.2 25.6 28.7 23.2   32.2 27.0 30.2 28.7   26.1 26.6 21.4 24.5 
32.1 37.4 34.4 32.1   36.2 40.5 39.9 36.0   28.3 28.4 26.8 25.2 
29.1 29.9 28.7 32.8   32.4 35.3 34.3 43.5   24.9 26.4 25.4 29.3 
26.4 28.4 32.6 29.9   35.4 35.9 34.3 32.0   24.7 20.9 24.0 26.4 
;
ods graphics on;
proc glm data=in;
class temp oper cycle;
model score= temp|oper|cycle / ss3 solution;
output out=diag r=resid;
lsmeans temp|oper|cycle;
estimate 'temp300' 2 0 / divisor=2;
estimate 'temp350' 0 2 / divisor=2;
estimate 'oper1' 3 0 0 / divisor=3
run;
proc univariate data=diag normal plots;
var resid;
run;
DATA p5;
 DO mat = 1 TO 3;
   DO temp = 15 70 125;
      INPUT life @@; OUTPUT;
   END; END;
 LINES;
 539 229 230
 623 479 198
 576 583 342
;
