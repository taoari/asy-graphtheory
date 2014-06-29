import node;

// define style
defaultdrawstyle=drawstyle(arrow=Arrow);
drawstyle es2 = drawstyle(p=red, arrow=Arrow);

// define nodes
Label[][] strs = {
    {"", "$o=0$", "$o=1$", "$o=2$", "$o=3$"},
    {"$9\times 9$", "$\sigma$", "$2\sigma$", "$4\sigma$", "$8\sigma$"},
    {"$15\times 15$", "$\frac{5}{3}\sigma$", "$\frac{10}{3}\sigma$", "$\frac{20}{3}\sigma$", "$\frac{40}{3}\sigma$"},
    {"$21\times 21$", "$\frac{7}{3}\sigma$", "$\frac{14}{3}\sigma$", "$\frac{28}{3}\sigma$", "$\frac{56}{3}\sigma$"},
    {"$27\times 27$", "$3\sigma$", "$6\sigma$", "$12\sigma$", "$24\sigma$"}
};
node[][] n = node(strs);

node r1, r2, c1, c2; // dump nodes

// layout
defaultlayoutrel=false;
pair xyskip = (2cm, 1cm) * 0.8;
gridlayout(xyskip, n);
vlayout(-xyskip.y, n[0][1], r1);
vlayout(-xyskip.y, n[0][4], r2);
hlayout(-xyskip.x, n[1][0], c1);
hlayout(-xyskip.x, n[4][0], c2);

// draw nodes
draw(n);

// draw edges
draw(
        (r1--r2).l("nOctaves (o)").style("autorot").style("leftside"),
        (c1--c2).l("nOctavesLayers (i)").style("autorot"),
        (n[1][1]--n[1][2]).l("double").style(es2).shorten(5,5)
    );
