import node;

// define style
defaultnodestyle=nodestyle(drawfn=RadialShader(yellow,red));
defaultdrawstyle=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"),
    arrow=Arrow(6));

// define nodes
node q0=scircle("$q_0$");
node q1=scircle("$q_1$");
node q2=scircle("$q_2$");
node q3=scircle("$q_3$");
node q4=scircle("$q_4$");

// calc nodes position
real u=2cm;
real ang0=360/5, ang1=(180-ang0)/2, ang2=90-ang1, ang=180-ang2;
real anginc=360/5;

// fancydock
// node cc=fancydock(dir(ang), u, anginc, 0, 
    // q0, q1, q2, q3, q4);
// cc @ refresh;
// cc @ deepdraw;

// fancydock fraction
// node cc=fancydock(dir(ang), u, anginc, (0.5, 0.5), 
    // q0, q1, q2, q3, q4);
// cc @ refresh;
// cc @ deepdraw;

// node @ refresh return node
fancydock(dir(ang), u, anginc, (0.5, 0.5), 
    q0, q1, q2, q3, q4) @ refresh @ deepdraw;

// draw edges
sdraw(q0--q2^^q2--q4^^q4--q1^^q1--q3^^q3--q0);
sdraw(q0..bend..q1, q1..bend..q2, q2..bend..q3, 
    q3..bend..q4, q4..bend..q0);
