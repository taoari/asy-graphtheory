import node;

pair u=(2cm,0);
pair v=(0,2cm);
Arrow=Arrow(6);

pen edgepen=fontsize(8pt)+fontcommand("\ttfamily");


node q11=circle("$q_{11}$", (0,0), None);
node q12=circle("$q_{12}$", q11.pos+u, Drawer(red));
node q13=circle("$q_{13}$", q11.pos+2u, Filler(yellow));
node q14=circle("$q_{14}$", q11.pos+3u, FillDrawer(green,black));

node q21=circle("$q_{21}$", q11.pos-v, DoubleDrawer(red));
node q22=circle("$q_{22}$", q21.pos+u, DoubleDrawer(red,blue));
node q23=circle("$q_{23}$", q21.pos+2u, Filler(yellow)+Shadower+Drawer(blue));
node q24=circle("$q_{24}$", q21.pos+3u, compose(Drawer,Shadower,Filler(green))); // order Shadower+Filler+Drawer

node q31=circle("$q_{31}$", q11.pos-2.5v, Shadower); // Shadower(dir,ratio,color)
node q32=circle("$q_{32}$", q31.pos+u, Shadower(3SE));
node q33=circle("$q_{33}$", q31.pos+2u, Shadower(SE,1.1));
node q34=circle("$q_{34}$", q31.pos+3u, Shadower(SE,1,yellow));

draw(q11,q12,q13,q14,
	q21,q22,q23,q24,
	q31,q32,q33,q34);
	
draw(q11--q12);
draw(q12--q13,Arrow);
draw(Label("arrow",LeftSide),q13--q14,edgepen,Arrow);

draw(q11..bendleft..q12,Arrow);
draw(q11..bendleft..q13,Arrow);
draw(q11..bendleft..q14,Arrow);

draw(q21..bend..q22,Arrow);
draw(q21..bend(45)..q23,Arrow);
draw(q21..bend(60)..q24,Arrow);

draw(q31..loop(S),Arrow);
draw(q32..loop(S,30),Arrow);
draw(q33..loop(S,60,1),Arrow);
draw(q34..loop(S,60,2),Arrow);
// manual control
draw("manual",q11^SW{SW}..q22^NE{-NE},edgepen,Arrow);

