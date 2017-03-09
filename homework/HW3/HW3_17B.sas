DM 'LOG; CLEAR; OUT; CLEAR;';
OPTIONS NODATE NONUMBER;

DATA in;
DO Trt = 'PEMF1', 'PEMF2', 'PEMF3', 'Sham';
   INPUT BMD_Loss @@; OUTPUT;
END;
LINES;
5.32 4.73 7.03 4.51  6.00 5.81 4.65 7.95  5.12 5.69 6.65 4.97  7.08 3.86 5.49 3.00
5.48 4.06 6.98 7.97  6.52 6.56 4.85 2.23  4.09 8.34 7.26 3.95  6.28 3.01 5.92 5.64
7.77 6.71 5.58 9.35  5.68 6.51 7.91 6.52  8.47 1.70 4.90 4.96  4.58 5.89 4.54 6.10
4.11 6.55 8.18 7.19  5.72 5.34 5.42 4.03  5.91 5.88 6.03 2.72  6.89 7.50 7.04 9.19
6.99 3.28 5.17 5.17  4.98 5.38 7.60 5.70  9.94 7.30 7.90 5.85  6.38 5.46 7.91 6.45
;
PROC GLM DATA=in PLOTS = (ALL);
     CLASS Trt;
     MODEL BMD_Loss = Trt / SS3 SOLUTION ;
     MEANS Trt / DUNNETT ('Sham') ALPHA=.10;  
run;
 *** Estimate statements for sum(tau_i) = 0 constraint';
     ESTIMATE 'PEMF 1h/day' Trt    / DIVISOR= ;
     ESTIMATE 'PEMF 2h/day' Trt    / DIVISOR= ;    <-- Enter values
     ESTIMATE 'PEMF 3h/day' Trt    / DIVISOR= ;
     ESTIMATE 'Sham       ' Trt    / DIVISOR= ;

***  linear and quadratic contrasts (For 541 students)';
     ESTIMATE 'Linear   ' Trt    ;
     ESTIMATE 'Quadratic' Trt    ;                 <-- Enter values
TITLE 'Problem 3.6, Page 131';
RUN;
