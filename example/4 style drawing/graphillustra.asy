import node;

// define style
defaultnodestyle=nodestyle(drawfn=FillDrawer(lightgray,black));
defaultdrawstyle=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"));
drawstyle es2=drawstyle(align=LeftSide, p=fontsize(8pt)+fontcommand("\ttfamily"));

node q0=scircle(".tex");
node q1=scircle(".dvi");
node q2=scircle(".pdf");
node q3=scircle(".ps ");

real u=5cm;
real v=3cm;
q0<<edown(v)<<q1<<eright(u)<<q3<<eup(v)<<q2;

draw(q0,q1,q2,q3);

sdraw("latex", q0--q1);
sdraw("pdflatex", q0--q2);
sdraw("xelatex", q0--q2, es2);
sdraw("dvips", q1--q3);
sdraw("ps2pdf", q3--q2);
sdraw("dvipdfmx", q1--q2);
