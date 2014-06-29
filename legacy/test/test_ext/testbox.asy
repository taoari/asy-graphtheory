import nodebox;

real h=gettextheight("Ag");
real u=10cm;

// horizontal: fixed size
node a1=nbox((13/16*u,h), "Index");
node a2=nbox((1/16*u,h), "TI");
node a3=nbox((2/16*u,h), "RPL");

// horizontal: fixed width
node b1=nbox(13/16*u, "Index");
node b2=nbox(1/16*u, "Long TI");
node b3=nbox(2/16*u, "RPL");
sameheight(b1, b2, b3);


// vertical: adaptive
node f1=nbox("$\cdots$");
node f2=nbox("PDE $n$");
node f3=nbox("PDE $n+1$");
node f4=nbox("$\cdots$");
samewidth(f1, f2, f3, f4);

// vertical: fixed width
real w=1cm;
node m1=nbox(w, "$\cdots$");
node m2=nbox(w, "PDE $n$");
node m3=nbox(w, "Long PDE $n+1$");
node m4=nbox(w, "$\cdots$");

// flush: for c5
node g1=nbox("$\cdots$");
node g2=nbox("PDE $n$");
node g3=nbox("PDE $n+1$");
node g4=nbox("$\cdots$");
node c5=vpack(flush=W, g1, g2, g3, g4);

// pack
node h1=nbox("G");
node h2=nbox("D");
node h3=nbox("0", FillDrawer(red));
node h4=nbox("Limit");
labelin("$h$", h4, NE, NW);
node h5=nbox("Base Address");
labelin("base", h5, E);
node h6=nbox("1");
node c6=vpack( 
    hpack(h1, h2, h3, h3, h3, h3, h3, h3, h4), 
    h5, 
    hpack(FillDrawer(blue), h6, h6, h3));

// dock
node c1=hdock(0cm, a1, a2, a3);
node c2=hdock(0cm, b1, b2, b3);
node c3=vdock(0cm, f1, f2, f3, f4);
node c4=vdock(0cm, m1, m2, m3, m4);
vdock(1cm, 
    c1, c2, hdock(1cm, c3, c4, c5), c6) @ refresh @ deepdraw;

// can only label node in dock
label("15", a1^NW, NE);
label("2", a2^N, N);
label("1", a3, NW, NE);
label("0", a3, NE, NW);


