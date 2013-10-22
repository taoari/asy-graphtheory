import nodesml;

defaultnodestyle=nodestyle(mag=1.4);
defaultdrawstyle=drawstyle(align=LeftSide, p=fontsize(8pt)+fontcommand("\ttfamily")+dashed, Arrow(SimpleHead));
drawstyle es2=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"));

real symsize=0.5cm;
node a=sml_actor(symsize, "Programmer", textpen=red, filler=Filler(yellow), indrawer=Drawer(green), outdrawer=DoubleDrawer(blue, white));//sbox("Programmer");
node c=sellipse("Design In UML");
node c1=sellipse("Code in asy");
node c2=sellipse("Compile asy");

real u=2cm, v=5cm;
dock(dir(-45), v, centerat=1, rel=false,
    a, c, hdock(u, c1, c2)) @ refresh @ deepdraw;

sdraw(a--c, es2);
sdraw(Label("<<include>>",Rotate(c1.pos-c.pos)), c--c1);
sdraw(Label("<<include>>",Rotate(c2.pos-c.pos)), c--c2);
