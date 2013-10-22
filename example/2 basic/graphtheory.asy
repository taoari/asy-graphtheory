import node;

// pair u=(2cm,0);
// pair v=(0,2cm);

real u=2cm;
real ang0=90, anginc=360/5;
Arrow=Arrow(6);

// define pen and draw type
pen edgepen=fontsize(8pt)+fontcommand("\ttfamily");
draw_t style1=RadialShader(yellow,red);

// define and calculate nodes position
node q0=circle("$q_0$",u*dir(ang0+0*anginc),style1);
node q1=circle("$q_1$",u*dir(ang0+1*anginc),style1);
node q2=circle("$q_2$",u*dir(ang0+2*anginc),style1);
node q3=circle("$q_3$",u*dir(ang0+3*anginc),style1);
node q4=circle("$q_4$",u*dir(ang0+4*anginc),style1);

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
