
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
draw(
    (q0--q1).l("."),
    (q1--q2).l("[0-9]"),
    (q3--q2).l("."),
    (q2--q4).l("[eE]"),
    (q0--q3).l("[0-9]").style("leftside"),
    (q3--q4).l("[eE]").style("leftside"),
    (q4--q5).l("[+-]").style("leftside"),
    (q5--q6).l("[0-9]").style("leftside"),
    (q6--q7).l("[fFlL]").style("leftside"),
    (q3..loop(N)).l("[0-9]"),
    (q2..loop(S)).l("[0-9]"),
    (q6..loop(N)).l("[0-9]"),
    (q4..bend..q6).l("[0-9]"),
    (q2..bend..q7).l("[fFlL]"),
    (start--q0));
