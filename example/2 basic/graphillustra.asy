import node;

pair u=(5cm,0);
pair v=(0,3cm);

Arrow=Arrow(6);

pen edgepen=fontsize(8pt)+fontcommand("\ttfamily");
draw_t style1=FillDrawer(lightgray,black);

import wt;

node q0=circle(".tex",(0,0),style1);
node q1=circle(".dvi",q0.pos-v,style1);
node q2=circle(".pdf",q0.pos+u,style1);
node q3=circle(".ps ",q1.pos+u,style1);

draw(q0,q1,q2,q3);

draw("latex", q0--q1,edgepen,Arrow);
draw("pdflatex", q0--q2,edgepen,Arrow);
label("xelatex", q0--q2, LeftSide,edgepen);
draw("dvips", q1--q3,edgepen,Arrow);
draw("ps2pdf", q3--q2,edgepen,Arrow);
draw("dvipdfmx", q1--q2,edgepen,Arrow);