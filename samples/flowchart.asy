import node;

// define style
defaultnodestyle=nodestyle(xmargin=4pt, ymargin=2pt, drawfn=FillDrawer(lightgray,black));
defaultdrawstyle=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"), arrow=Arrow(6));

// define nodes
node start=nroundbox("Start"),
     read=nparallelogram("Read N"),
     b1=nbox(minipage2("M=1\\ F=1")),
     b2=nbox("F=F*M"),
     d1=ndiamond("Is M=N?"),
     b3=nbox("M=M+1"),
     print=nparallelogram("Print F"),
     end=nroundbox("End");

// layout
defaultlayoutskip=0.5cm;
vlayout(start, read, b1, new node, b2, d1, print, end);
hlayout(-defaultlayoutskip, d1, b3);

// draw nodes
draw(start, read, b1, b2, d1, b3, print, end);

// draw edges
draw(start--read, read--b1, b1--b2, b2--d1, (d1--print).l("Yes"), 
    (d1--b3).l("No"), print--end, b3--VH--middle(b1,b2));
