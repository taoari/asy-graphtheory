// import node;
import nodecircuit;

Arrow=Arrow(6);


pen textpen=blue + fontcommand("\ttfamily");

real size=0.5cm;
node l1=circuit_light(size, "$abcdefg$", N, textpen=textpen, filler=Filler(yellow), indrawer=Drawer(red));
node l2=circuit_light(size, "$abcdefg$", E, textpen=textpen, filler=Filler(yellow), indrawer=Drawer(red));
node l3=circuit_light(size, "$abcdefg$", S, textpen=textpen, filler=Filler(yellow), indrawer=Drawer(red));
node l4=circuit_light(size, "$abcdefg$", W, textpen=textpen, filler=Filler(yellow), indrawer=Drawer(red));
node b1=circuit_battery(E, size, "$abcdefg$", N, textpen=textpen, indrawer=InDrawer(blue,1,3));
node b2=circuit_battery(S, size, "$abcdefg$", E, textpen=textpen, indrawer=InDrawer(blue,1,3));
node b3=circuit_battery(W, size, "$abcdefg$", S, textpen=textpen, indrawer=InDrawer(blue,1,3));
node b4=circuit_battery(N, size, "$abcdefg$", W, textpen=textpen, indrawer=InDrawer(blue,1,3));
node s1=circuit_switch(N, size, "$abcdefg$", N, textpen=textpen, indrawer=Drawer(green));
node s2=circuit_switch(E, size, "$abcdefg$", E, textpen=textpen, indrawer=Drawer(green));
node s3=circuit_switch(S, size, "$abcdefg$", S, textpen=textpen, indrawer=Drawer(green));
node s4=circuit_switch(W, size, "$abcdefg$", W, textpen=textpen, indrawer=Drawer(green));


real u=2cm;
real v=2cm;
l1<<eright(u)<<b1<<eright(u)<<s1<<eright(u)<<new node<<
edown(v)<<l2<<edown(v)<<b2<<edown(v)<<s2<<edown(v)<<new node<<
eleft(u)<<l3<<eleft(u)<<b3<<eleft(u)<<s3<<eleft(u)<<new node<<
eup(v)<<l4<<eup(v)<<b4<<eup(v)<<s4<<eup(u);

draw(l1--b1);
draw(b1--s1);
draw(s1--HV--l2);
draw(l2--b2);
draw(b2--s2);
draw(s2--VH--l3);
draw(l3--b3);
draw(b3--s3);
draw(s3--HV--l4);
draw(l4--b4);
draw(b4--s4);
draw(s4--VH--l1);

draw(l1,l2,l3,l4,b1,b2,b3,b4,s1,s2,s3,s4);
