
import node;

// define node style
defaultnodestyle=nodestyle(textpen=white, 
    drawfn=FillDrawer(darkgreen,black));
nodestyle ns2=nodestyle(textpen=white, 
    drawfn=Filler(darkgreen)+DoubleDrawer(black));
nodestyle ns3=nodestyle(drawfn=None);
// define edge style
defaultdrawstyle=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"),
    arrow=Arrow(6));
drawstyle es2=drawstyle(sL=labelstyle(align=LeftSide),
    p=fontsize(8pt)+fontcommand("\ttfamily"), arrow=Arrow(6));

// define nodes
node q0=scircle("$q_0$"); 
node q1=scircle("$q_1$"); 
node q2=scircle("$q_2$",ns2);
node q3=scircle("$q_3$");
node q4=scircle("$q_4$");
node q5=scircle("$q_5$");
node q6=scircle("$q_6$",ns2);
node q7=scircle("$q_7$",ns2);
node start=scircle("Start",ns3);

// calculate nodes position
real u=2cm;
start<<eright(0.6u)<<q0<<edown(u)<<q1<<eright(u)<<
q2<<eup(u)<<q3<<edir(-30,u)<<q4<<eright(u)<<
q5<<eright(u)<<q6<<eright(u)<<q7;

// draw nodes
draw(start,q0,q1,q2,q3,q4,q5,q6,q7);

// draw edges
sdraw(".", q0 -- q1);
sdraw("[0-9]", q1 -- q2);
sdraw(".", q3 -- q2);
sdraw("[eE]", q2 -- q4);
sdraw("[0-9]", q0 -- q3, es2);
sdraw("[eE]", q3 -- q4, es2);
sdraw("[+-]", q4 -- q5, es2);
sdraw("[0-9]", q5 -- q6, es2);
sdraw("[fFlL]", q6 -- q7, es2);
sdraw("[0-9]", q3 .. loop(N));
sdraw("[0-9]", q2 .. loop(S));
sdraw("[0-9]", q6 .. loop(N));
sdraw("[0-9]", q4 .. bend .. q6);
sdraw("[fFlL]", q2 .. bend .. q7);
sdraw("",start--q0);

