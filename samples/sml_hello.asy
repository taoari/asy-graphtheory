import nodesml;

// define style
defaultnodestyle=nodestyle(mag=1.4);
defaultdrawstyle=drawstyle(align=LeftSide, p=fontsize(8pt)+fontcommand("\ttfamily")+dashed, Arrow(SimpleHead));
drawstyle es2=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"));

// define nodes
node a=sml_actor("Programmer");
node c=nellipse("Design In UML");
node c1=nellipse("Code in asy");
node c2=nellipse("Compile asy");

// layout
real u=1cm, v=5cm;
layout(-45.0, v, a, c, nodeph);
hcenterlayout(nodeph, u, c1, c2);

// draw nodes
draw(a, c, c1, c2);

// draw edges
draw(
    (a--c).style(es2),
    (c--c1).l("<<include>>").style("autorot"),
    (c--c2).l("<<include>>").style("autorot")
);
