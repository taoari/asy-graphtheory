import node;

// define style
nodestyle ns1=nodestyle(drawfn=FillDrawer(yellow));
nodestyle ns2=nodestyle(drawfn=FillDrawer(gray));
nodestyle ns3=nodestyle(white, drawfn=FillDrawer(darkgreen));
nodestyle ns4=nodestyle(drawfn=FillDrawer(red));
nodestyle ns5=nodestyle(drawfn=FillDrawer(blue));
defaultdrawstyle=drawstyle(p=red+fontsize(10pt)+fontcommand("\ttfamily"), arrow=Arrow);


// define nodes
real h=gettextheight("Ag");
real u=10cm;

node[] a = nboxes("Index", "TI", "RPL");
setwidth(u, new real[]{13,1,2} ... a);
setheight(h ... a);

node b[] = nboxes(ns1, "Index", minipage2("Long \\ TI"), "RPL");
setwidth(u, new real[]{13,1,2} ... b);

node c[] = nboxes(new nodestyle[]{ns1, ns2, ns3}, "Index", minipage2("Long \\ TI"), "RPL");
setwidth(u, new real[]{13,1,2} ... c);

hlayout(0 ...a);
vlayout(a[0], b[0]);
hlayout(0 ...b);
vlayout(b[0], c[0]);
hlayout(0 ...c);
draw(concat(a, b, c));

label("15", b[0]^NW, NE);
label("2", b[1]^N, N);
label("1", b[2]^NW, NE);
label("0", b[2]^NE, NW);

// define nodes
node[] pde = nboxes("$\cdots$", "PDE $n$", "PDE $n+1$", "$\cdots$");
node d = vpack(3cm ... pde);
node e = vpack(2cm ... pde);
node f = vpack(0 ... pde);
hcenterlayout(vlayout(2cm, middlen(...c), new node),
            d, e, f);
draw(d, e, f);

// define nodes
node g = hpack(align=N 
        ... nboxes("one line", minipage2("two \\ lines"), "flush up"));
node h = vpack(align=W ... pde);
hcenterlayout(vlayout(2cm, middlen(d,e,f), new node),
        g, h);
draw(g,h);

// define nodes
node i1 = hpack(... nboxes("G","D","0","0","0","0","Limit"));
node i2 = nbox("Base Address");
node i3 = hpack(... nboxes("1","1","0","1"));
node i = vpack(i1, i2, i3);

node j1 = hpack(... nboxes(new nodestyle[]{ns1,ns1,ns2,ns2,ns2,ns2,ns3},
            "G","D","0","0","0","0","Limit"));
node j2 = nbox("Base Address", ns4);
node j3 = hpack(... nboxes(new nodestyle[]{ns5}, "1","1","0","1"));
node j = vpack(j1,j2,j3);
vlayout(2cm, middlen(g,h), i);
vlayout(i,j);
draw(i,j);


// draw edges
draw(
        (c[0]--VHVd(0.5cm)--d),
        (c[0]--VHVd(0.5cm)--e),
        (c[0]--VHVd(0.5cm)--f)
    );

