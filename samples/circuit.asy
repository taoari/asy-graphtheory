import nodecircuit;

// define style
defaultcircuitlightstyle=nodestyle(textpen=red+fontcommand("\ttfamily"), filler=Filler(yellow), indrawer=red, outdrawer=red);
defaultcircuitbatterystyle=nodestyle(textpen=blue+fontcommand("\ttfamily"), indrawer=InDrawer(blue,1,3));
defaultcircuitswitchstyle=nodestyle(textpen=green+fontcommand("\ttfamily"), indrawer=green);

// define nodes
node l1=circuit_light("abcdefg", N);
node l2=circuit_light("$abcdefg$", E);
node l3=circuit_light("$abcdefg$", S);
node l4=circuit_light("$abcdefg$", W);
node b1=circuit_battery("$abcdefg$", E);
node b2=circuit_battery("$abcdefg$", S);
node b3=circuit_battery("$abcdefg$", W);
node b4=circuit_battery("$abcdefg$", N);
node s1=circuit_switch("$abcdefg$", N);
node s2=circuit_switch("$abcdefg$", E);
node s3=circuit_switch("$abcdefg$", S);
node s4=circuit_switch("$abcdefg$", W);

node n1, n2, n3, n4; // dump nodes

// layout
defaultlayoutrel=false;
real u=2cm, v=2cm;
hlayout(u, n1, l1, b1, s1, n2);
vlayout(v, n2, l2, b2, s2, n3);
hlayout(-u, n3, l3, b3, s3, n4);
vlayout(-v, n4, l4, b4, s4);

// draw nodes
draw(l1,l2,l3,l4,b1,b2,b3,b4,s1,s2,s3,s4);

// draw edges
draw(l1--b1, b1--s1, s1--HV--l2, l2--b2, b2--s2, s2--VH--l3, l3--b3, b3--s3, 
    s3--HV--l4, l4--b4, b4--s4, s4--VH--l1);
