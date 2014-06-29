import node;

// define style
defaultnodestyle=nodestyle(drawfn=RadialShader(yellow,red));
defaultdrawstyle=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"), arrow=Arrow(6));

// define nodes
node[] n = ncircles( "$n_0$",
        "$n_1$",
        "$n_2$",
        "$n_3$",
        "$n_4$");

// layout
circularlayout(2cm, startangle=90, n);

// draw nodes
draw(n);

// draw edges
draw(n[0]--n[2], n[2]--n[4], n[4]--n[1], n[1]--n[3], n[3]--n[0]);
draw(n[0]..bend..n[1], n[1]..bend..n[2], n[2]..bend..n[3], 
    n[3]..bend..n[4], n[4]..bend..n[0]);
