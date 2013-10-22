import nodesml;

defaultnodestyle=nodestyle(mag=1.4);
defaultdrawstyle=drawstyle(align=LeftSide, p=fontsize(8pt)+fontcommand("\ttfamily")+dashed, Arrow(SimpleHead));
drawstyle es2=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"));

real symsize=0.5cm;
node a=sml_actor(symsize, "Programmer");
node c=sellipse("Design In UML");
node c1=sellipse("Code in asy");
node c2=sellipse("Compile asy");

real u=2cm, v=5cm;
dock(dir(-45), v, centerat=1, rel=false,
    a, c, hdock(u, c1, c2)) @ refresh @ deepdraw;

draw(
    (a--c).style(es2),
    (c--c1).l("<<include>>").style("autorot"),
    (c--c2).l("<<include>>").style("autorot")
);
