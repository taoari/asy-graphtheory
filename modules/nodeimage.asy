import node;

nodestyle defaultnodeimagestyle=nodestyle();

node nimage(string fn, pair imsize, transform t=scale(1.0), 
        nodestyle ns=defaultnodeimagestyle) {
    real xmargin = ns.xmargin;
    real ymargin = ns.ymargin;
    pen textpen = ns.textpen;
    draw_t drawfn = ns.drawfn;
    real mag = ns.mag;

    node nd; 
    string imopt = "width="+(string)imsize.x+"bp, height="+
        (string)imsize.y+"bp";
    label(nd.stuff, t*graphic(fn, imopt)); // image
    pair s = mag*(imsize+2*(xmargin,ymargin));
    nd.outline = t*scale(s.x, s.y)*shift(-0.5,-0.5)*unitsquare;
    drawfn(nd.stuff, nd.outline);
    return nd;
}
