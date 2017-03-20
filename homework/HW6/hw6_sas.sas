/*prob3*/
data bibd; input agent $ batch loss@@; cards;
A 1 24.3	B 1 23.8	C 1 21.5
A 2 21		B 2 18.8	D 2 18.2
A 3 24.1	C 3 20.1	D 3 22.2
B 4 25.2	C 4 23.5	D 4 20.5
A 5 19.8	B 5 21.8	C 5 17.2
A 6 23.8	B 6 21.7	D 6 20.8
A 7 22.9	C 7 17.3	D 7 18
B 8 21.3	C 8 20.2	D 8 19.8
;
title 'BIBD prob3 hw6';
proc glm data=bibd plots=(all);
class batch agent;
model loss=agent batch / ss3 solution;
means agent;
lsmeans agent /adj=bon solution cl;
random batch /test;
run;	
/*prob 4*/
proc glm data=daata4 plots=all;
class type temp;
model light = type temp type*temp / ss3 solution;
run;
