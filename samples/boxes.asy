import node;

// define style
defaultnodestyle=nodestyle(ymargin=0.2cm, drawfn=FillDrawer(yellow));
defaultdrawstyle=drawstyle(p=red+fontsize(10pt)+fontcommand("\ttfamily"), arrow=Arrow);

// define nodes
node[] b = nboxes("Index", "TI", "RPL");
setwidth(10cm, new real[]{5,1,2} ... b);

node[] m = nboxes("$\cdots$", "X", "$\cdots$");
setwidth(2cm ... m);

node[] n = nboxes("$\cdots$", "X", "$\cdots$");
setwidth(2cm ... n);

// layout
defaultlayoutskip=0cm;
hlayout(... b);
vlayout(2cm, b[1], m[0]);
hlayout(3cm, m[0], n[0]);
vlayout(... m);
vlayout(... n);

// draw nodes
draw(concat(b, m, n));

// draw edges
draw(
        (b[0]--VH--m[1]),
        (b[1]--m[0]).l("TI=1"),
        (b[1]--VHV--n[0]).l("TI=0").style("leftside")
    );

// label
label("15", b[0]^NW, NE);
label("2", b[1]^N, N);
label("1", b[2]^NW, NE);
label("0", b[2]^NE, NW);
label("GDT", m[2]^S, S);
label("LDT", n[2]^S, S);
