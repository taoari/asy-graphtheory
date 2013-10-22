import node;

// define style
defaultnodestyle=nodestyle(xmargin=3pt, ymargin=0, drawfn=FillDrawer(lightgray,black));
nodestyle ns2=nodestyle(xmargin=0, ymargin=3pt, drawfn=FillDrawer(lightgray,black));
defaultdrawstyle=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"), arrow=Arrow(6));

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
real u=0.5cm;
real v=0.5cm;
// start<<reldown(v)<<read<<reldown(v)<<b1<<reldown(1.5*v)<<
// b2<<reldown(v)<<d1<<reldown(v)<<print<<reldown(v)<<end;
// d1<<relleft(u)<<b3;

// dock
// node c1=dock(S, v, centerat=-1, start, read, b1);
// node c2=dock(S, 1.5*v, centerat=-1, c1, b2);
// node c3=dock(S, v, centerat=1, c2, d1, print, end);

// dock 
node c1=vdock(v, centerat=-3, 
    start,read,b1,new node,b2,d1,print,end);
node cc=hdock(u, centerat=1, 
    b3, c1);

// fraction dock
// node c1=vdock(v, 0.5,
    // start,read,b1,new node,b2,d1,print,end);
// node cc=hdock(u, 0.5,
    // b3, c1);
	
cc @ refresh;
cc @ deepdraw;

// draw edge
sdraw(start--read);
sdraw(read--b1);
sdraw(b1--b2);
sdraw(b2--d1);
sdraw("Yes",d1--print);
sdraw("No",d1--b3);
sdraw(print--end);
sdraw(b3--VH--middle(b1,b2));
