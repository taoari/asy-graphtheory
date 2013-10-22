import nodebox;

// define style
defaultnodestyle=nodestyle(ymargin=0.2cm, drawfn=FillDrawer(yellow));
defaultdrawstyle=drawstyle(p=red+fontsize(10pt)+fontcommand("\ttfamily"), arrow=Arrow);

// define nodes
node[] b=boxes(10cm, new real[]{5/8, 1/8, 2/8}, "Index", "TI", "RPL");
labelin("15", b[0], NW, NE);
labelin("2", b[1], N);
labelin("1", b[2], NW, NE);
labelin("0", b[2], NE, NW);
// node b=hpack(centerat=1, b1, b2, b3);

node m=vbox(2cm, "$\cdots$", "X", "$\cdots$");
labelin("GDT", m, S);
node n=vbox(2cm, "$\cdots$", "X", "$\cdots$");
labelin("LDT", n, S);

// dock and draw nodes
node bb=hdock(0cm, centerat=1, b[0], b[1], b[2]);
node c1=hdock(3cm, centerat=0, m, n);
vdock(2cm, bb, c1) @ refresh @ deepdraw;

// draw edges
sdraw(b[0]--VH--m);
sdraw("TI=1", b[1]--m);
sdraw("TI=0", middle(b[1], m)--HV--n);

// Notes: center depend on edges
// using pack: only one center: m, n
// using dock: multiple centers: b
