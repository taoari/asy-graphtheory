import nodeimage;
import math;

// define style
defaultnodestyle=nodestyle(xmargin=6pt, ymargin=4pt, drawfn=FillDrawer(lightgray,black));
defaultdrawstyle=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"), arrow=Arrow(6));

node img = nimage("lena.jpg", (2cm,2cm));
node[] flow = nboxes("Blocks",
        "Gabor Filter Bank",
        minipage2("Feature Vector: \\ GWT Components \\ $\mu,\sigma$"),
        "SVM",
        "Class");

hlayout(img ... flow);

draw(img ... flow);
draw(
        (img--flow[0]),
        (flow[0]--flow[1]),
        (flow[1]--flow[2]),
        (flow[2]--flow[3]),
        (flow[3]--flow[4])
    );
