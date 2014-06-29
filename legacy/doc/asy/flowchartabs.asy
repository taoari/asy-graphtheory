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
real u=3.0cm;
real v=0.9cm;
start<<edown(v)<<read<<edown(v)<<b1<<edown(v)<<
	b2<<edown(v)<<d1<<edown(v)<<print<<edown(v)<<end;
d1<<eleft(u)<<b3;

// draw node
draw(start,read,print,end, b1,b2,b3,d1);
