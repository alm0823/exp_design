DM 'LOG; CLEAR; OUT; CLEAR;';
OPTIONS NODATE NONUMBER LS=76;

TITLE 'Exam Question #2';

DATA IN;
   DO subject = 1 to 15;
   DO glass = '1\CGS', '2\TBl', '3\CBS', '7\Mug', '4\SBl', 
'5\CBN', '6\Tea';
      INPUT guess @@;  OUTPUT;
   END; END;
LINES;
8  8 12 12  6  8 12   8 12 10 16  8 10 12   14 12 12 16  8 10 12
7  8  6 10  5  6  8  14 12 10 16  8 12 10    8 12 14 16  6 10 11
10 12  8 16  6 10 8   8 10 12 20  6  7 14   12 10 12 16  6 10 10
 8  9 12 14  6 10 8   
100  80  60 120  60  80 120    260 350 200 400 180 280 350
300 200 200 400 100 200 250    190 250 200 350 100 200 280
300 200 250 500 150 250 350
;
DATA IN; SET IN;
      IF glass = '7\Mug' THEN DELETE;    
         * Remove the big mug data;
      IF guess > 50 then guess = .0338*guess; 
         guess = round(guess,.1);  
         * Convert from ml to nearest .1 ounce;

* PROC PRINT DATA=IN;

RUN;
proc glm data=in;
class glass subject;
model guess= glass subject;
random subject;
contrast 'mean(s) - mean(b)' glass 1 -1 -1 0 1 0;
run;
