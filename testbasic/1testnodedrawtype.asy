import node;

pair u=(2cm,0);
pair v=(0,2cm);
Arrow=Arrow(6);

pen text=black;


node q11=circle("$q_{11}$", (0,0), None);
node q12=circle("$q_{12}$", q11.pos+u, Drawer(red));
node q13=circle("$q_{13}$", q11.pos+2u, Filler(yellow));
node q14=circle("$q_{14}$", q11.pos+3u, FillDrawer(green,black));

node q21=circle("$q_{21}$", q11.pos-v, DoubleDrawer(red));
node q22=circle("$q_{22}$", q21.pos+u, DoubleDrawer(red,blue));
node q23=circle("$q_{23}$", q21.pos+2u, Filler(yellow)+Shadower+Drawer(blue));
node q24=circle("$q_{24}$", q21.pos+3u, compose(Drawer,Shadower,Filler(green))); // order Shadower+Filler+Drawer

node q31=circle("$q_{31}$", q11.pos-2v, Shadower); // Shadower(dir,ratio,color)
node q32=circle("$q_{32}$", q31.pos+u, Shadower(3SE));
node q33=circle("$q_{33}$", q31.pos+2u, Shadower(SE,1.1));
node q34=circle("$q_{34}$", q31.pos+3u, Shadower(SE,1,yellow));

node q41=circle("$q_{41}$", q11.pos-3v, Shadower(NW)); 
node q42=circle(Label("$q_{42}$",white), q41.pos+u, FillDrawer(darkgreen,black));
node q43=circle("$q_{43}$", q41.pos+2u, RadialShader(yellow,red));
node q44=circle("$q_{44}$", q41.pos+3u, RadialShader(white,black)+Drawer(blue));

draw(q11,q12,q13,q14,
	q21,q22,q23,q24,
	q31,q32,q33,q34,
	q41,q42,q43,q44);