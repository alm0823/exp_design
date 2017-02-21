/* problem 2*/
data oneway;
do level = 1 to 4; input delta @@; output; end;
lines;
0 10 0 10
;
proc glmpower data=oneway;
class level;
model delta = level;
power
stddev = 5 6 7
alpha = 0.05
ntotal = .
power = 0.90;
run;
/* problem 4: john's code edited*/
DM 'LOG; CLEAR; OUT; CLEAR;';
OPTIONS NODATE NONUMBER;

DATA in410; INPUT nozzle velocity shape @@; CARDS;
1 11.73 .78  2 11.73 .85  3 11.73 .93  4 11.73 1.14 5 11.73 .97
1 14.37 .80  2 14.37 .85  3 14.37 .92  4 14.37 .97  5 14.37 .86
1 16.59 .81  2 16.59 .92  3 16.59 .95  4 16.59 .98  5 16.59 .78
1 20.43 .75  2 20.43 .86  3 20.43 .89  4 20.43 .88  5 20.43 .76
1 23.46 .77  2 23.46 .81  3 23.46 .89  4 23.46 .86  5 23.46 .76
1 28.74 .78  2 28.74 .83  3 28.74 .83  4 28.74 .83  5 28.74 .75
 ;

PROC GLM DATA=in410 PLOTS=(ALL);
     CLASS nozzle velocity;
     MODEL shape = nozzle velocity / SS3 SOLUTION;
     MEANS velocity;
     MEANS nozzle / BON;
     ESTIMATE 'TAU 1' nozzle 4 -1 -1 -1 -1 / DIVISOR=5;
     ESTIMATE 'TAU 2' nozzle -1 4 -1 -1 -1 / DIVISOR=5;
     ESTIMATE 'TAU 3' nozzle -1 -1 4 -1 -1 / DIVISOR=5;
     ESTIMATE 'TAU 4' nozzle -1 -1 -1 4 -1 / DIVISOR=5;
     ESTIMATE 'TAU 5' nozzle -1 -1 -1 -1 4 / DIVISOR=5;

     ESTIMATE 'BETA 1' velocity 5 -1 -1 -1 -1 -1 / DIVISOR=6;
     ESTIMATE 'BETA 2' velocity -1 5 -1 -1 -1 -1 / DIVISOR=6;
     ESTIMATE 'BETA 3' velocity -1 -1 5 -1 -1 -1 / DIVISOR=6;
     ESTIMATE 'BETA 4' velocity -1 -1 -1 5 -1 -1 / DIVISOR=6;
     ESTIMATE 'BETA 5' velocity -1 -1 -1 -1 5 -1 / DIVISOR=6;
     ESTIMATE 'BETA 6' velocity -1 -1 -1 -1 -1 5 / DIVISOR=6;

TITLE 'PROBLEM 4.10';
RUN;
