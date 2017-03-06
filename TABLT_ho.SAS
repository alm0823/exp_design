DM 'LOG; CLEAR; OUT; CLEAR;';
ODS LISTING;

DATA IN1; 
DO tablet='A_MS12', 'B_LP12', 'C_MS16', 'D_LP16', 'E_MS20', 'F_LP20', 'G_TL_16';
DO rep = 1 TO 10; 
   INPUT time @@; OUTPUT;
END; END;
LINES;
56.3 61.1 60.9 53.8 59.3 56.7 60.8 55.9 60.9 55.1 
57.3 61.8 60.8 63.5 60.6 58.7 56.5 54.1 64.2 60.8 
62.1 63.9 67.5 65.7 65.9 61.9 62.2 65.2 70.2 65.7 
63.6 62.0 64.4 63.1 69.5 68.6 61.8 72.1 60.7 67.1 
69.5 69.8 70.6 68.6 66.3 64.5 66.8 66.1 71.7 66.5 
70.8 74.7 72.3 73.6 73.0 67.1 75.8 72.7 70.1 68.0 
64.7 62.0 65.4 64.0 70.4 69.6 62.7 70.2 62.5 68.5
;

PROC GLM DATA=in1 PLOTS=(ALL);
     CLASS tablet;
     MODEL time = tablet / ss3 ;
     ESTIMATE '12 vs 20' ;
     ESTIMATE 'MS vs LP' ;
TITLE 'Tablet Disintegration Time -- Problem 1';

**********************************************************;
*** Find the transformation using the empirical method ***;
**********************************************************;

PROC SORT DATA=in1; BY tablet;
PROC MEANS DATA=in1 NOPRINT; BY tablet;
     VAR time; OUTPUT OUT=yset MEAN=mean STD=std;
DATA yset; SET yset;
     logstd =LOG(std);   logmean=LOG(mean);
PROC PRINT DATA=yset;
     VAR mean std logstd logmean;
TITLE 'EMPIRICAL SELECTION OF ALPHA';

PROC GLM DATA=yset;
     MODEL logstd=logmean / SS3 solution;
	 run;
TITLE 'ANOVA TO FIND EMPIRICAL SELECTION OF ALPHA';

********************************************************;
*** Find the transformation using the Box-Cox method ***;
********************************************************;

PROC TRANSREG DATA=in1;
     MODEL BOXCOX(time / LAMBDA=-2 to 2 by .05) = CLASS(tablet);
TITLE 'Find the Box-Cox Transformation using PROC TRANSREG';

RUN;
proc glm data=in1;
class tablet;
model time = tablet /ss3;
means tablet / hovtest=levene(type=abs);
run;
/*make G control*/
DATA IN11; 
DO tablet='AZ_MS12', 'B_LP12', 'C_MS16', 'D_LP16', 'E_MS20', 'F_LP20', 'AG_TL_16';
DO rep = 1 TO 10; 
   INPUT time @@; OUTPUT;
END; END;
LINES;
56.3 61.1 60.9 53.8 59.3 56.7 60.8 55.9 60.9 55.1 
57.3 61.8 60.8 63.5 60.6 58.7 56.5 54.1 64.2 60.8 
62.1 63.9 67.5 65.7 65.9 61.9 62.2 65.2 70.2 65.7 
63.6 62.0 64.4 63.1 69.5 68.6 61.8 72.1 60.7 67.1 
69.5 69.8 70.6 68.6 66.3 64.5 66.8 66.1 71.7 66.5 
70.8 74.7 72.3 73.6 73.0 67.1 75.8 72.7 70.1 68.0 
64.7 62.0 65.4 64.0 70.4 69.6 62.7 70.2 62.5 68.5
;
proc glm data=in11;
class tablet;
model time = tablet /ss3;
means tablet / DUNNETT alpha=0.05;
run;
proc glm data=in1;
class tablet;
model time = tablet;
means / diff;
/* note n = 10 balanced */
contrast 'mean(ms) - mean(lp)' tablet 1 -1 1 -1 1 -1 0;
contrast 'mean(12) - mean(20)' tablet 1 1 0 0 -1 -1 0;
contrast 'linear ms' tablet -1 0 0 0 1 0 0;
contrast 'quad ms' tablet  1 0 -2 0 1 0 0;
contrast 'linear lp' tablet 0 -1 0 0 0 1 0;
contrast 'quad lp' tablet 0 1 0 -2 0 1 0;
run;

run;
