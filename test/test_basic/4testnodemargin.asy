import node;

pair u=(2cm,0);
pair v=(0,2cm);
Arrow=Arrow(6);

pen edgepen=fontsize(8pt)+fontcommand("\ttfamily");

draw_t style1=FillDrawer(lightgray,black);
real xmargin=5pt;
real ymargin=8pt;


node q11=ncircle("$q_{11}$", (0,0));
node q12=ncircle("$q_{12}$", q11.pos+u, xmargin,0);
node q13=ncircle("$q_{13}$", q12.pos+u, 0, ymargin);
node q14=ncircle("$q_{14}$", q13.pos+u, xmargin);//, xmargin);
node q15=ncircle("$q_{15}$", q14.pos+u, xmargin, ymargin);
node q10=ncircle("$q_{10}$", q11.pos-u, mag=1.2);

node q21=nbox("$q_{21}$", q11.pos-v);
node q22=nbox("$q_{22}$", q21.pos+u, xmargin,0);
node q23=nbox("$q_{23}$", q22.pos+u, 0, ymargin);
node q24=nbox("$q_{24}$", q23.pos+u, xmargin);//, xmargin);
node q25=nbox("$q_{25}$", q24.pos+u, xmargin, ymargin);
node q20=nbox("$q_{20}$", q21.pos-u, mag=1.2);

node q31=nroundbox("$q_{31}$", q21.pos-v);
node q32=nroundbox("$q_{32}$", q31.pos+u, xmargin,0);
node q33=nroundbox("$q_{33}$", q32.pos+u, 0, ymargin);
node q34=nroundbox("$q_{34}$", q33.pos+u, xmargin);//, xmargin);
node q35=nroundbox("$q_{35}$", q34.pos+u, xmargin, ymargin);
node q30=nroundbox("$q_{30}$", q31.pos-u, mag=1.2);

node q41=nellipse("$q_{41}$", q31.pos-v);
node q42=nellipse("$q_{42}$", q41.pos+u, xmargin,0);
node q43=nellipse("$q_{43}$", q42.pos+u, 0, ymargin);
node q44=nellipse("$q_{44}$", q43.pos+u, xmargin);//, xmargin);
node q45=nellipse("$q_{45}$", q44.pos+u, xmargin, ymargin);
node q40=nellipse("$q_{40}$", q41.pos-u, mag=1.2);

node q51=ndiamond("$q_{51}$", q41.pos-v);
node q52=ndiamond("$q_{52}$", q51.pos+u, xmargin,0);
node q53=ndiamond("$q_{53}$", q52.pos+u, 0, ymargin);
node q54=ndiamond("$q_{54}$", q53.pos+u, xmargin);//, xmargin);
node q55=ndiamond("$q_{55}$", q54.pos+u, xmargin, ymargin);
node q50=ndiamond("$q_{50}$", q51.pos-u, mag=1.2);

node q61=nparallelogram("$q_{61}$", q51.pos-v);
node q62=nparallelogram("$q_{62}$", q61.pos+u, xmargin,0);
node q63=nparallelogram("$q_{63}$", q62.pos+u, 0, ymargin);
node q64=nparallelogram("$q_{64}$", q63.pos+u, xmargin);//, xmargin);
node q65=nparallelogram("$q_{65}$", q64.pos+u, xmargin, ymargin);
node q60=nparallelogram("$q_{60}$", q61.pos-u, mag=1.2);

draw(q10,q11,q12,q13,q14,q15,
	q20,q21,q22,q23,q24,q25,
	q30,q31,q32,q33,q34,q35,
	q40,q41,q42,q43,q44,q45,
	q50,q51,q52,q53,q54,q55,
	q60,q61,q62,q63,q64,q65);
