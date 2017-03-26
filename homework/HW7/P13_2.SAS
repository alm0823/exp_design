
DATA IN1; 
  DO PART = 1 TO 10;
  DO INSPECTOR = 1 to 3;
  DO TEST = 1 TO 3;
     INPUT IMPEDENCE @@; OUTPUT;
  END; END; END;
LINES;
37 38 37  41 41 40  41 42 41
42 41 43  42 42 42  43 42 43
30 31 31  31 31 31  29 30 28
42 43 42  43 43 43  42 42 42
28 30 29  29 30 29  31 29 29
42 42 43  45 45 45  44 46 45
25 26 27  28 28 30  29 27 27
40 40 40  43 42 42  43 43 41
25 25 25  27 29 28  26 26 26
35 34 34  35 35 34  35 34 35
;
proc glm data=in1 plots=all;
class part inspector;
model impedence=part inspector / ss3 solution;
means part inspector;
random part inspector / test;
run;
proc varcomp data=in1 method=reml;
class part inspector;
model impedence=part inspector;
title 'variance components';
run;
