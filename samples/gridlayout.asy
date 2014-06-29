import node;

// define nodes
node[] nds = ncircles("$n_0$", 
        "$n_1$",
        "$n_2$",
        "$n_3$",
        "$n_4$",
        "$n_5$",
        "$n_6$",
        "$n_7$",
        "$n_8$",
        "$n_9$",
        "$n_{10}$");

// layout
defaultlayoutrel = false;
defaultlayoutskip = 2cm;

gridlayout((3,4), roworder=false, nds);
// circularlayout(3cm, nds);

// draw nodes
draw(nds);
