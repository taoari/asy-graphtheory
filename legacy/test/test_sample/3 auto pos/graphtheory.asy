import node;

Arrow=Arrow(6);

// define pen and draw type
pen edgepen=fontsize(8pt)+fontcommand("\ttfamily");
draw_t style1=RadialShader(yellow,red);

// define nodes
node q0=circle("$q_0$",style1);
node q1=circle("$q_1$",style1);
node q2=circle("$q_2$",style1);
node q3=circle("$q_3$",style1);
node q4=circle("$q_4$",style1);

// calc notes position
real u=2cm;
real ang0=360/5, ang1=(180-ang0)/2, ang2=90-ang1;
real ang=180-ang2;
real anginc=360/5;
q0<<edir(ang,u)<<q1<<edir(ang+anginc,u)<<q2<<edir(ang+2anginc,u)<<q3<<edir(ang+3anginc,u)<<q4;

// draw nodes
draw(q0,q1,q2,q3,q4);

// draw edges
draw(q0--q2,edgepen,Arrow);
draw(q2--q4,edgepen,Arrow);
draw(q4--q1,edgepen,Arrow);
draw(q1--q3,edgepen,Arrow);
draw(q3--q0,edgepen,Arrow);

draw(q0..bendright..q1,edgepen,Arrow);
draw(q1..bendright..q2,edgepen,Arrow);
draw(q2..bendright..q3,edgepen,Arrow);
draw(q3..bendright..q4,edgepen,Arrow);
draw(q4..bendright..q0,edgepen,Arrow);
