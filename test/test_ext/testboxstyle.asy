import nodebox;

// define style
defaultnodestyle=nodestyle(ymargin=0.2cm, drawfn=FillDrawer(yellow));
defaultdrawstyle=drawstyle(p=red+fontsize(10pt)+fontcommand("\ttfamily"), arrow=Arrow);

// define nodes
real u=10cm;
node b1=sbox(5/8*u, "Index");
labelin("15", b1, NW, NE);
node b2=sbox(1/8*u, "TI");
labelin("2", b2, N);
node b3=sbox(2/8*u, "RPL");
labelin("1", b3, NW, NE);
labelin("0", b3, NE, NW);
// node b=hpack(centerat=1, b1, b2, b3);

real w=2cm;
node m1=sbox(w, "$\cdots$");
node m2=sbox(w, "X");
node m3=sbox(w, "Y");
node m=vpack(m1, m2, m1);
labelin("GDT", m, S);
node n=vpack(m1, m3, m1);
labelin("LDT", n, S);

// dock and draw nodes
node b=hdock(0cm, centerat=1, b1, b2, b3);
node c1=hdock(3cm, centerat=0, m, n);
vdock(2cm, b, c1) @ refresh @ deepdraw;

// draw edges
sdraw(b1--VH--m);
sdraw("TI=1", b2--m);
sdraw("TI=0", middle(b2, m)--HV--n);

// Notes: center depend on edges
// using pack: only one center: m, n
// using dock: multiple centers: b



