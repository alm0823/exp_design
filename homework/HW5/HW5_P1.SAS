
DATA IN; INPUT ROW COL FERT $ COVER @@; LINES;
 1 1 A 61   1 2 C 59   1 3 E 49   1 4 F 53   1 5 B 50   1 6 D 59 
 2 1 D 64   2 2 E 51   2 3 B 55   2 4 A 59   2 5 C 58   2 6 F 50 
 3 1 F 55   3 2 A 63   3 3 C 59   3 4 B 55   3 5 D 62   3 6 E 47 
 4 1 C 62   4 2 B 60   4 3 D 67   4 4 E 50   4 5 F 51   4 6 A 57 
 5 1 E 53   5 2 D 69   5 3 F 59   5 4 C 60   5 5 A 61   5 6 B 51 
 6 1 B 62   6 2 F 59   6 3 A 66   6 4 D 68   6 5 E 50   6 6 C 56 
 ;
RUN;
data p51; input rowday colstore latindesign heightgreek $ dollarsales @@@@; lines;
1 1 A alpha 238		1 2 C delta 228		1 3 B gamma 158		1 4 D epsilon 188	1 5 A beta 74
2 1 D delta 149		2 2 B beta 220		2 3 A alpha 92		2 4 C gamma 169		2 5 E epsilon 282
3 1 B epsilon 222 	3 2 B epsilon 222	3 3 D beta 104		3 4 A delta 54		3 5 C alpha 213
4 1 C beta 187		4 2 C beta 187		4 3 E delta 242		4 4 B alpha	122		4 5 D gamma	90
5 1 A gamma 65		5 2 D alpha 118		5 3 C epsilon 279	5 4	E beta 278		5 5 B delta	176
;
run;
do rowday='Mon','Tues','Wed','Thurs','Fri';
do colstore='I','II','III','IV','V';
do latindesign='A','B','C','D','E';
do heightsgreek='alpha','beta','delta','gamma','epsilon';
do rep= 1 to 5;
INPUT dollarsales @@; OUTPUT;
END; END;
LINES;
238 228 158 188 74 
149 220 92 169 282 
222 295 104 54 213
187 66 242 122 90
65 118 279 278 176
;
data p5a;
do rows='Mon','Tues','Wed','Thurs','Fri';
do columns='I','II','III','IV','V';
do latindesign='A', 'B', 'C', 'D', 'E';
input heightgreek $ dollarsales @@; output;
end; end;
lines;
alpha 238		delta 228		gamma 158		epsilon 188		beta 74
delta 149		beta 220		alpha 92		gamma 169		epsilon 282
epsilon 222 	epsilon 222		beta 104		delta 54		alpha 213
beta 187		beta 187		delta 242		alpha	122		gamma	90
gamma 65		alpha 118		epsilon 279		beta 278		delta	176
;


