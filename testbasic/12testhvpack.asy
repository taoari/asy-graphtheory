import node;

nodestyle ns2=nodestyle(FillDrawer(red, black));
nodestyle ns3=nodestyle(FillDrawer(yellow, black));
node a=sbox("Box Long", ns2);
node b=sbox(minipage2("Box\par High"), ns3);

node c1=hpack((0.5, 0.5), a, b);
node c2=pack(E, (0.5, 0.5), a, b);
node c3=vpack((0.5,0.5), c1, a);

real u=1cm;
dock(S, u, (0.5,0.5), c1, c2, c3) @ refresh @ deepdraw;

