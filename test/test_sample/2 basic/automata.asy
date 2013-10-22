import node;

pair u=(2cm,0);
pair v=(0,2cm);

Arrow=Arrow(6);

// define pen and draw style
pen edgepen=fontsize(8pt)+fontcommand("\ttfamily");
draw_t style1=FillDrawer(darkgreen,black);
draw_t style2=Filler(darkgreen)+DoubleDrawer(black);
draw_t style3=None;

// define nodes
// manually calculate nodes position
node q0=circle(Label("$q_0$",white), (0,0), style1); 
node q1=circle(Label("$q_1$",white), position(q0)-v, style1); 
node q2=circle(Label("$q_2$",white), position(q1)+u, style2);
node q3=circle(Label("$q_3$",white), position(q0)+u, style1);
node q4=circle(Label("$q_4$",white), middlepos(q2,q3)+sqrt(3)/2*u, style1);
node q5=circle(Label("$q_5$",white), position(q4)+u, style1);
node q6=circle(Label("$q_6$",white), position(q5)+u, style2);
node q7=circle(Label("$q_7$",white), position(q6)+u, style2);
node start=circle(Label("Start",black), position(q0)-0.6u, style3);

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