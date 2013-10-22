import node;

pair u=(3.5cm,0);
pair v=(0,1.2cm);
real dvadjust=1.5; 	// diamond vertical adjustment ratio
real sadjust=1.2;		// special adjustment ratio

Arrow=Arrow(6);
pen edgepen=fontsize(8pt)+fontcommand("\ttfamily");
draw_t style1=FillDrawer(lightgray,black);

real xmargin=3pt;
real ymargin=3pt;
real mag=1;

node start=roundbox("Start",(0,0),xmargin,style1,mag);
node read=parallelogram("Read N", start.pos-v,xmargin,style1,mag);
node b1=box(minipage("M=1\\ F=1",1cm), read.pos-v, xmargin,style1,mag);
node b2=box("F=F*M",b1.pos-sadjust*v,xmargin,style1,mag);
node d1=diamond("Is M=N?",b2.pos-dvadjust*v,0,ymargin,style1,mag);
node b3=box("M=M+1",d1.pos-u,xmargin,style1,mag);
node print=parallelogram("Print F",d1.pos-dvadjust*v,xmargin,style1,mag);
node end=roundbox("End",print.pos-v,xmargin,style1,mag);

draw(start,read,print,end, b1,b2,b3,d1);
	
draw(start--read,edgepen,Arrow);
draw(read--b1,edgepen,Arrow);
draw(b1--b2,edgepen,Arrow);
draw(b2--d1,edgepen,Arrow);
draw("Yes",d1--print,edgepen,Arrow);
draw("No",d1--b3,edgepen,Arrow);
draw(print--end,edgepen,Arrow);
draw(b3--VH--middle(b1,b2),edgepen,Arrow);
