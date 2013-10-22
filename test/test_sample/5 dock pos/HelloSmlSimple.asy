import node;

defaultdrawstyle=drawstyle(align=LeftSide, p=fontsize(8pt)+fontcommand("\ttfamily")+dashed);
drawstyle es2=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"));

node a=sbox("Programmer");
node c=sellipse("Design In UML");
node c1=sellipse("Code in asy");
node c2=sellipse("Compile asy");

real u=2cm, v=4cm;
dock(dir(-45), v, centerat=1,
    a, c, hdock(u, c1, c2)) @ refresh @ deepdraw;

sdraw(a--c, es2);
sdraw(Label("<<include>>",Rotate(c1.pos-c.pos)), c--c1);
sdraw(Label("<<include>>",Rotate(c2.pos-c.pos)), c--c2);
