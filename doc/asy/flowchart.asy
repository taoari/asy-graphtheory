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

// dock position
real u=0.5cm;
real v=0.5cm;
node c1=vdock(v, centerat=-3, 
    start,read,b1,new node,b2,d1,print,end);
hdock(u, centerat=1, 
    b3, c1) @ refresh @ deepdraw;

// draw edge
draw(start--read, read--b1, b1--b2, b2--d1, (d1--print).l("Yes"), 
    (d1--b3).l("No"), print--end, b3--VH--middle(b1,b2));
