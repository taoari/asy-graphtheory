import node;

// define style
defaultnodestyle=nodestyle(drawfn=FillDrawer(lightgray,black));
defaultdrawstyle=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"));

// define nodes
node q0=scircle(".tex");
node q1=scircle(".dvi");
node q2=scircle(".pdf");
node q3=scircle(".ps ");

// calc position
real u=5cm;
real v=3cm;
q0<<edown(v)<<q1<<eright(u)<<q3<<eup(v)<<q2;

// draw nodes
draw(q0,q1,q2,q3);

// draw edges
draw((q0--q1).l("latex"), 
    (q0--q2).l("pdflatex"),
    (q0--q2).l("xelatex").style("leftside"),
    (q1--q3).l("dvips"),
    (q3--q2).l("ps2pdf"),
    (q1--q2).l("dvipdfmx")
);
