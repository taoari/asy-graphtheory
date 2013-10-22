import node;

pair u=(3cm,0);
pair v=(0,2cm);
Arrow=Arrow(6);

pen edgepen=fontsize(8pt)+fontcommand("\ttfamily");
draw_t style1=FillDrawer(gray,black);
draw_t style2=DoubleDrawer(red);
draw_t style3=Shadower+FillDrawer(yellow,black);

string long="longstring";
string high=minipage("\centering high\\ high\\ high",1cm);

node q11=ncircle(long, (0,0), factortype=0);
node q12=ncircle(long, q11.pos+u, factortype=1);
node q13=ncircle(long, q11.pos+2u, factortype=2);
node q14=ncircle(long, q11.pos+3u, factortype=3);
node q15=ncircle(long, q11.pos+4u, factortype=4);

node q21=ncircle(high, q11.pos-v);
node q22=ncircle(high, q21.pos+u, factortype=1);
node q23=ncircle(high, q21.pos+2u, factortype=2);
node q24=ncircle(high, q21.pos+3u, factortype=3);
node q25=ncircle(high, q21.pos+4u, factortype=4);

node q31=ncircle("$q_{31}$", q21.pos-v);
node q32=ncircle("$q_{32}$", q31.pos+u, style1);
node q33=ncircle("$q_{33}$", q31.pos+2u, style2);
node q34=ncircle("$q_{34}$", q31.pos+3u, style3);

node q41=nellipse("$q_{41}$", q31.pos-v); 
node q42=nellipse("$q_{42}$", q41.pos+u, style1);
node q43=nellipse("$q_{43}$", q41.pos+2u, style2);
node q44=nellipse("$q_{44}$", q41.pos+3u, style3);

node q51=nellipse(long, q41.pos-v); 
node q52=nellipse(long, q51.pos+u, factortype=1);
node q53=nellipse(high, q51.pos+2u);
node q54=nellipse(high, q51.pos+3u, factortype=1);

node q61=nbox("$q_{61}$", q51.pos-v); 
node q62=nbox("$q_{62}$", q61.pos+u, style1);
node q63=nbox("$q_{63}$", q61.pos+2u, style2);
node q64=nbox("$q_{64}$", q61.pos+3u, style3);

node q71=ndiamond("$q_{71}$", q61.pos-v); 
node q72=ndiamond("$q_{72}$", q71.pos+u, style1);
node q73=ndiamond("$q_{73}$", q71.pos+2u, style2);
node q74=ndiamond("$q_{74}$", q71.pos+3u, style3);

node q81=ndiamond(long, q71.pos-1.5v); 
node q82=ndiamond(long, q81.pos+u, factortype=1);
node q83=ndiamond(high, q81.pos+2u);
node q84=ndiamond(high, q81.pos+3u, factortype=1);

node a11=nparallelogram(long, q81.pos-1.5v);
node a12=nparallelogram(long, a11.pos+u, factortype=1);
node a13=nparallelogram(high, a11.pos+2u);
node a14=nparallelogram(high, a11.pos+3u, factortype=1);

node a21=nparallelogram("$a_{21}$", a11.pos-v);
node a22=nparallelogram("$a_{22}$", a21.pos+u, style1);
node a23=nparallelogram("$a_{23}$", a21.pos+2u, style2);
node a24=nparallelogram("$a_{24}$", a21.pos+3u, style3);

node a31=nroundbox("$a_{31}$", a21.pos-v);
node a32=nroundbox("$a_{32}$", a31.pos+u, style1);
node a33=nroundbox("$a_{33}$", a31.pos+2u, style2);
node a34=nroundbox("$a_{34}$", a31.pos+3u, style3);


draw(q11,q12,q13,q14,q15,
	q21,q22,q23,q24,q25,
	q31,q32,q33,q34,
	q41,q42,q43,q44,
	q51,q52,q53,q54,
	q61,q62,q63,q64,
	q71,q72,q73,q74,
	q81,q82,q83,q84,
	a11,a12,a13,a14,
	a21,a22,a23,a24,
	a31,a32,a33,a34);
