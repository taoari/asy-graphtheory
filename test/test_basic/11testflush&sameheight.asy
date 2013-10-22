import node;

nodestyle ns2=nodestyle(FillDrawer(red, black));
node a=sbox("Box Long", ns2);
node b=sbox(minipage2("Box\par High\par flushleft", flush=W));
node c=sbox(minipage2("Box\par High\par flushright", flush=E));

// same height: before docking
// sameheight(a, b);
// samewidth(a,c);

real u=2cm;
a<<relright(0)<<b;
a<<reldown(0)<<c;

// flush: after docking
flush(S, a, b);
flush(E, a, c);

draw(a,b,c);

