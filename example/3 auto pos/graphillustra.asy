import node;

Arrow=Arrow(6);

pen edgepen=fontsize(8pt)+fontcommand("\ttfamily");
draw_t style1=FillDrawer(lightgray,black);

node q0=circle(".tex",style1);
node q1=circle(".dvi",style1);
node q2=circle(".pdf",style1);
node q3=circle(".ps ",style1);

real u=5cm;
real v=3cm;
q0<<edown(v)<<q1<<eright(u)<<q3<<eup(v)<<q2;

draw(q0,q1,q2,q3);

draw("latex", q0--q1,edgepen,Arrow);
draw("pdflatex", q0--q2,edgepen,Arrow);
label("xelatex", q0--q2, LeftSide,edgepen);
draw("dvips", q1--q3,edgepen,Arrow);
draw("ps2pdf", q3--q2,edgepen,Arrow);
draw("dvipdfmx", q1--q2,edgepen,Arrow);
