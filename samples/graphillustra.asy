import node;

// define style
defaultnodestyle=nodestyle(drawfn=FillDrawer(lightgray,black));
defaultdrawstyle=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"));

// define nodes
node[] n = ncircles(".tex", ".dvi", ".pdf", ".ps");

// layout
defaultlayoutrel=false;
gridlayout((2,2), (5cm, 3cm), n);

// draw nodes
draw(n);

// draw edges
draw(
        (n[0]--n[1]).l("latex"), 
        (n[0]--n[2]).l("pdflatex"),
        (n[0]--n[2]).l("xelatex").style("leftside"),
        (n[1]--n[3]).l("dvips"),
        (n[3]--n[2]).l("ps2pdf"),
        (n[1]--n[2]).l("dvipdfmx")
    );
