import node;

// define style
defaultnodestyle=nodestyle(xmargin=3pt, ymargin=0, drawfn=FillDrawer(lightgray,black));
nodestyle ns2=nodestyle(xmargin=0, ymargin=3pt, drawfn=FillDrawer(lightgray,black));
defaultdrawstyle=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"));

// define node
node start=sroundbox("Start");
node read=sparallelogram("Read N");
node b1=sbox(minipage("M=1\\ F=1",1cm));
node b2=sbox("F=F*M");
node d1=sdiamond("Is M=N?",0,ns2);
node b3=sbox("M=M+1");
node print=sparallelogram("Print F");
node end=sroundbox("End");

// calc node position
real u=0.2cm;
real v=0.2cm;
start<<reldown(v)<<read<<reldown(v)<<b1<<reldown(1.5*v)<<
	b2<<reldown(v)<<d1<<reldown(v)<<print<<reldown(v)<<end;
d1<<relleft(u)<<b3;

// draw node
draw(start,read,print,end, b1,b2,b3,d1);
