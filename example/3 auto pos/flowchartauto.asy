import node;

Arrow=Arrow(6);

pen edgepen=fontsize(8pt)+fontcommand("\ttfamily");
draw_t style1=FillDrawer(lightgray,black);

real xmargin=3pt;
real ymargin=3pt;

node start=roundbox("Start",xmargin=xmargin,style1);
node read=parallelogram("Read N",xmargin=xmargin,style1);
node b1=box(minipage("M=1\\ F=1",1cm), xmargin=xmargin,style1);
node b2=box("F=F*M",xmargin=xmargin,style1);
// node b12=middle(b1,b2);
node d1=diamond("Is M=N?",0,ymargin=ymargin,style1);
node b3=box("M=M+1",xmargin=xmargin,style1);
node print=parallelogram("Print F",xmargin=xmargin,style1);
node end=roundbox("End",xmargin=xmargin,style1);

real u=0.5cm;
real v=0.5cm;
start<<reldown(v)<<read<<reldown(v)<<b1<<reldown(1.5*v)<<
	b2<<reldown(v)<<d1<<reldown(v)<<print<<reldown(v)<<end;
d1<<relleft(u)<<b3;

draw(start,read,print,end,
	b1,b2,b3,d1);

	draw(start--read,edgepen,Arrow);
draw(read--b1,edgepen,Arrow);
draw(b1--b2,edgepen,Arrow);
draw(b2--d1,edgepen,Arrow);
draw("Yes",d1--print,edgepen,Arrow);
draw("No",d1--b3,edgepen,Arrow);
draw(print--end,edgepen,Arrow);

draw(b3--VH--middle(b1,b2),edgepen,Arrow);
