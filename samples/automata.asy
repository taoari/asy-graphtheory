import node;

// define style
defaultnodestyle=nodestyle(textpen=white, drawfn=FillDrawer(darkgreen,black));
nodestyle ns2=nodestyle(textpen=white, drawfn=Filler(darkgreen)+DoubleDrawer(black));
nodestyle ns3=nodestyle(drawfn=None);
defaultdrawstyle=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"), arrow=Arrow(6));

// define nodes
node q0=ncircle("$q_0$"),
     q1=ncircle("$q_1$"),
     q2=ncircle("$q_2$",ns2),
     q3=ncircle("$q_3$"),
     q4=ncircle("$q_4$"),
     q5=ncircle("$q_5$"),
     q6=ncircle("$q_6$",ns2),
     q7=ncircle("$q_7$",ns2),
     start=ncircle("Start",ns3);

// layout
defaultlayoutrel = false;
defaultlayoutskip = 2cm;
real u = defaultlayoutskip;

hlayout(0.6u, start, q0);
vlayout(q0, q1);
hlayout(q1, q2);
vlayout(-u, q2, q3);
layout(-30.0, q3, q4);
hlayout(q4, q5, q6, q7);

// draw nodes
draw(start,q0,q1,q2,q3,q4,q5,q6,q7);

// draw edges
draw(
        (q0--q1).l("."),
        (q1--q2).l("[0-9]"),
        (q3--q2).l("."),
        (q2--q4).l("[eE]"),
        (q0--q3).l("[0-9]").style("leftside"),
        (q3--q4).l("[eE]").style("leftside"),
        (q4--q5).l("[+-]").style("leftside"),
        (q5--q6).l("[0-9]").style("leftside"),
        (q6--q7).l("[fFlL]").style("leftside"),
        (q3..loop(N)).l("[0-9]"),
        (q2..loop(S)).l("[0-9]"),
        (q6..loop(N)).l("[0-9]"),
        (q4..bend..q6).l("[0-9]"),
        (q2..bend..q7).l("[fFlL]"),
        (start--q0)
    );
