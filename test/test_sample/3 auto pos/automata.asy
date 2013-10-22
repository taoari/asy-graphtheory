import node;

Arrow=Arrow(6);

// define pen and draw style
pen edgepen=fontsize(8pt)+fontcommand("\ttfamily");
draw_t style1=FillDrawer(darkgreen,black);
draw_t style2=Filler(darkgreen)+DoubleDrawer(black);
draw_t style3=None;

// define nodes
node q0=circle(Label("$q_0$",white), style1); 
node q1=circle(Label("$q_1$",white), style1); 
node q2=circle(Label("$q_2$",white), style2);
node q3=circle(Label("$q_3$",white), style1);
node q4=circle(Label("$q_4$",white), style1);
node q5=circle(Label("$q_5$",white), style1);
node q6=circle(Label("$q_6$",white), style2);
node q7=circle(Label("$q_7$",white), style2);
node start=circle(Label("Start",black), style3);

// calculate nodes position
real u=2cm;
start<<eright(0.6u)<<q0<<edown(u)<<q1<<eright(u)<<
q2<<eup(u)<<q3<<edir(-30,u)<<q4<<eright(u)<<
q5<<eright(u)<<q6<<eright(u)<<q7;

// draw nodes
draw(start,q0,q1,q2,q3,q4,q5,q6,q7);

// draw edges
draw(".", q0 -- q1, edgepen, Arrow);
draw("[0-9]", q1 -- q2, edgepen, Arrow);
draw(".", q3 -- q2, edgepen, Arrow);
draw("[eE]", q2 -- q4, edgepen, Arrow);
draw(Label("[0-9]", LeftSide), q0 -- q3, edgepen, Arrow);
draw(Label("[eE]", LeftSide), q3 -- q4, edgepen, Arrow);
draw(Label("[+-]", LeftSide), q4 -- q5, edgepen, Arrow);
draw(Label("[0-9]", LeftSide), q5 -- q6, edgepen, Arrow);
draw(Label("[fFlL]", LeftSide), q6 -- q7, edgepen, Arrow);
draw("[0-9]", q3 .. loop(N), edgepen, Arrow);
draw("[0-9]", q2 .. loop(S), edgepen, Arrow);
draw("[0-9]", q6 .. loop(N), edgepen, Arrow);
draw("[0-9]", q4 .. bendright .. q6, edgepen, Arrow);
draw("[fFlL]", q2 .. bendright .. q7, edgepen, Arrow);
draw("",start--q0,edgepen,Arrow);
