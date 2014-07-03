Usage
=====

A typical use of this library involves 4 steps:

1. define node and edge styles
2. define nodes
3. layout and draw nodes
4. draw edges

### define node and edge styles

this step can be **ignored** if the default black-white style satisfies you, or a single line if you want edges to have arrows:

    defaultdrawstyle=drawstyle(Arrow);
    
there are two global variables to control the default node style and edge style, you can overwrite them to satisfy your own needs:

    defaultnodestyle=nodestyle(drawfn=FillDrawer(lightgray,black));
    defaultdrawstyle=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"), arrow=Arrow(6));
    
you can define your own styles if you want multiple styles:

    defaultnodestyle=nodestyle(textpen=white, drawfn=FillDrawer(darkgreen,black));
    nodestyle ns2=nodestyle(textpen=white, drawfn=Filler(darkgreen)+DoubleDrawer(black));
    nodestyle ns3=nodestyle(drawfn=None);
    
### define nodes

shaped nodes, (nbox can be ncircle, nellipse, nroundbox, ndiamond, nparallelogram)

    node n0 = nbox("$n_0$");
    node n1 = ncircle("$n_1$", ns2);
    
or multiple nodes of the same shape and style (nboxes, ..., nparallelograms)

    node[] n = nboxes("$n_0$", "$n_1$", "$n_2$", "$n_3$", "$n_4$");
    node[] n = ncircles(ns2, "$n_0$", "$n_1$", "$n_2$", "$n_3$", "$n_4$");
    
text nodes (node)

    node n0 = node("$n_0$");
    node[] n = node("$n_0$", "$n_1$", "$n_2$", "$n_3$", "$n_4$");
    
    Label[][] strs = {
        {"$a_{0,0}$", "$\cdots$", "$a_{0,n}$"},
        {"$\vdots$", "$\ddots$", "$\vdots$"},
        {"$a_{m,0}$", "$\cdots$", "$a_{m,n}$"}};
    node[][] n2d = node(strs);
    
node resize (setsize, setwidth, setheight):

    setwidth(... nds); // automatically set to the largest width
    setwidth(w=width ... nds); // set width to "w", if w=0, automatically
    
    setheight(h ... nds);
    
    setsize((w,h) ... nds);
    
    // set nds total width to 10cm, with ratios of 5:1:2
    setwidth(10cm, new real[]{5,1,2} ... nds);

compound nodes (npack, hpack, vpack), nodes can be firsted resized, and then layouted before packing:

    hpack(h=-1 ... nds);       // do not reisze nodes
    hpack(h=0 ... nds);        // nodes are set to same height
    hpack(h=height, ... nds);   // nodes are set to "height" (positive)
    
    vpack(w=<-1, 0 or width> ... nds)
    
symbol nodes, please refer to nodecircuit, and nodesml.

### layout nodes

two global variables to control the layout properties

* relative layout: layout according to the outline of nodes
* absolute layout: layout accordng to the position of nodes


    defaultlayoutrel = true; // relative layout
    defaultlayoutskip = 1cm; // nodes skip
    
layouts (there is a global node "nodeph" as a place holder):

    layout(dir ... nds);
    hlayout(... nds);
    vlayout(... nds);
    
    gridlayout((rownum, colum) ... nds);
    gridlayout(nds2d);
    
    circularlayout(... nds);
    
    centerlayout(dir, refnode ... nds);
    hcenterlayout(refnode ... nds);
    vcenterlayout(refnode ... nds);
    
set to absolute positions:

    setpos(nds, positions);
    
flush:
    
    flush(align ... nds); // align can be N, S, E, W
    
layout APIs reference:

    layout(dir, skip, rel ... nds);
    hlayout(skip, rel ... nds);
    vlayout(skip, rel ... nds);

    gridlayout((rownum, colnum), roworder, (xskip, yskip), rel ... nds);
    
    circularlayout(radius, center, startangle, angleskip ... nds);
    
    centerlayout(dir, refnode, skip, rel ... nds);
    hcenterlayout(refnode, skip, rel ... nds);
    vcenterlayout(refnode, skip, rel ... nds);
    
### draw nodes

    draw(... nds);
    
### draw edges

    draw(
            (n1--n2),
            (n1..n2),
            (n1..loop(N)),
            (n1..bend..n2),
            (n1--n2).l("label"),
            (n1--n2).l("label").style(es2),
            (n1--n2).l("label").style("autorot"),
            (n1--n2).l("label").style("leftside"),
            (n1--n2).l("label").shorten(5,5)
        );