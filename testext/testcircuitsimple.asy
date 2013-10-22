// import node;
import nodecircuit;

node l1=circuit_light("abcdefg", N);
node l2=circuit_light("abcdefg", E);
node l3=circuit_light("abcdefg", S);
node l4=circuit_light("abcdefg", W);
node b1=circuit_battery(E, "abcdefg");
node b2=circuit_battery(S, "abcdefg");
node b3=circuit_battery(W, "abcdefg");
node b4=circuit_battery(N, "abcdefg");
node s1=circuit_switch(N, "abcdefg");
node s2=circuit_switch(E, "abcdefg");
node s3=circuit_switch(S, "abcdefg");
node s4=circuit_switch(W, "abcdefg");


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
