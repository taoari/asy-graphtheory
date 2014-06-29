//////////////////////////////////
// nodestyle
//////////////////////////////////

real defaultsymbolsize=0.5cm;

// definition nodestyle
struct nodestyle{
    // text centered node
    real xmargin=0;
    real ymargin=xmargin;
    pen textpen=currentpen;
    draw_t drawfn=Drawer; // for outline draw: outdrawer+filler
    real mag=1.0;
    // for symbol node
    real size=defaultsymbolsize;
    draw_t filler=None;
    draw_t indrawer=Drawer;
    draw_t outdrawer=indrawer;

    void operator init(real xmargin=0, real ymargin=xmargin, 
            pen textpen=currentpen, draw_t drawfn=Drawer, real mag=1,
            real size=defaultsymbolsize, draw_t filler=None,
            draw_t indrawer=Drawer, draw_t outdrawer=indrawer)
    {
        this.xmargin=xmargin;
        this.ymargin=ymargin;
        this.textpen=textpen;
        this.drawfn=drawfn;
        this.mag=mag;
        this.size=size;
        this.filler=filler;
        this.indrawer=indrawer;
        this.outdrawer=outdrawer;
    }
};

nodestyle copy(nodestyle ns) {
    nodestyle cp;
    cp.xmargin=ns.xmargin;
    cp.ymargin=ns.ymargin;
    cp.textpen=ns.textpen;
    cp.drawfn=ns.drawfn;
    cp.mag=ns.mag;
    cp.size=ns.size;
    cp.filler=ns.filler;
    cp.indrawer=ns.indrawer;
    cp.outdrawer=ns.outdrawer;
    return cp;
}

// nodestyle
nodestyle defaultnodestyle;

/////////////////////////////////////////
// create nodes according to shape
/////////////////////////////////////////

// box
node nbox(Label L, nodestyle ns=defaultnodestyle) {
    real xmargin = ns.xmargin;
    real ymargin = ns.ymargin;
    pen textpen = ns.textpen;
    draw_t drawfn = ns.drawfn;
    real mag = ns.mag;

    node nd;
    label(nd.stuff, L, textpen);
    pair M=max(nd.stuff),
         m=min(nd.stuff),
         D=M-m,
         c=0.5*(M+m);
    pair d=(xmargin, ymargin);
    pair MM=mag*(M+d),
         mm=mag*(m-d);
    nd.outline=box(mm,MM);
    drawfn(nd.stuff, nd.outline);
    return nd;
}

node[] nboxes(nodestyle ns=defaultnodestyle ... Label[] Ls) {
    node[] nds;
    for (Label L : Ls) {
        nds.push(nbox(L, ns));
    }
    return nds;
}

node[] nboxes(nodestyle[] nss ... Label[] Ls) {
    if (nss.length==0)
        return nboxes(... Ls);
    else if (nss.length==1)
        return nboxes(nss[0] ... Ls);
    else if(nss.length!=Ls.length)
        abort("nboxes: nodestyles, Labels length do not match");
    node[] nds;
    for (int i=0; i<Ls.length; ++i) {
        nds.push(nbox(Ls[i], nss[i]));
    }
    return nds;
}


// text : string 1d, 2d array to node array
node node(Label L, nodestyle ns=defaultnodestyle) {
    nodestyle ns2 = copy(ns);
    ns2.drawfn = None;
    return nbox(L, ns2);
}

node[] node(Label[] Ls, nodestyle ns=defaultnodestyle) {
    nodestyle ns2 = copy(ns);
    ns2.drawfn = None;
    return nboxes(ns2 ... Ls);
}

node[][] node(Label[][] Ls2d, nodestyle ns=defaultnodestyle) {
    nodestyle ns2 = copy(ns);
    ns2.drawfn = None;
    node[][] nds2d;
    for (Label[] Ls: Ls2d) {
        nds2d.push(nboxes(ns2 ... Ls));
    }
    return nds2d;
}

// circle
node ncircle(Label L, nodestyle ns=defaultnodestyle) {
    real xmargin = ns.xmargin;
    real ymargin = ns.ymargin;
    pen textpen = ns.textpen;
    draw_t drawfn = ns.drawfn;
    real mag = ns.mag;

    node nd;
    label(nd.stuff, L, textpen);
    pair M=max(nd.stuff),
         m=min(nd.stuff),
         D=M-m,
         c=0.5*(M+m);
    pair DD=mag*(D+2*(xmargin,ymargin));
    real r = 0.5*length(DD);
    nd.outline=circle(c, r);
    drawfn(nd.stuff, nd.outline);
    return nd;
}

node[] ncircles(nodestyle ns=defaultnodestyle ... Label[] Ls) {
    node[] nds;
    for (Label L : Ls) {
        nds.push(ncircle(L, ns));
    }
    return nds;
}

// ellipse
node nellipse(Label L, nodestyle ns=defaultnodestyle) {
    real xmargin = ns.xmargin;
    real ymargin = ns.ymargin;
    pen textpen = ns.textpen;
    draw_t drawfn = ns.drawfn;
    real mag = ns.mag;

    node nd;
    label(nd.stuff, L, textpen);
    pair M=max(nd.stuff),
         m=min(nd.stuff),
         D=M-m,
         c=0.5*(M+m);
    pair DD=mag*(D+2*(xmargin,ymargin));
    real ra, rb;
    ra=0.5*DD.x*sqrt(2);rb=0.5*DD.y*sqrt(2);
    nd.outline=ellipse(c, ra, rb);
    drawfn(nd.stuff, nd.outline);
    return nd;
}

node[] nellipses(nodestyle ns=defaultnodestyle ... Label[] Ls) {
    node[] nds;
    for (Label L : Ls) {
        nds.push(nellipse(L, ns));
    }
    return nds;
}

// roundbox
node nroundbox(Label L, nodestyle ns=defaultnodestyle) {
    real xmargin = ns.xmargin;
    real ymargin = ns.ymargin;
    pen textpen = ns.textpen;
    draw_t drawfn = ns.drawfn;
    real mag = ns.mag;

    real roundratio = 0.2; // additional parameter

    node nd;
    label(nd.stuff, L, textpen);
    pair M=max(nd.stuff),
         m=min(nd.stuff),
         D=M-m,
         c=0.5*(M+m);
    pair MM=mag*(M+(xmargin,ymargin)),
         mm=mag*(m-(xmargin,ymargin)),
         DD=MM-mm;
    pair lb=mm,rb=(MM.x,mm.y),rt=MM,lt=(mm.x,MM.y);
    // Thanks to Xiaoqian Wu, a bug here is fixed when the text is long
    real d=roundratio*min(DD.x,DD.y);
    pair dx=(d,0), dy=(0,d);
    nd.outline=lb+dy{S}..{E}lb+dx--rb-dx{E}..{N}rb+dy--rt-dy{N}..{W}rt-dx--lt+dx{W}..{S}lt-dy--cycle;
    drawfn(nd.stuff, nd.outline);
    return nd;
}

node[] nroundboxes(nodestyle ns=defaultnodestyle ... Label[] Ls) {
    node[] nds;
    for (Label L : Ls) {
        nds.push(nroundbox(L, ns));
    }
    return nds;
}

private import wt_arcs;

// diamond
node ndiamond(Label L, nodestyle ns=defaultnodestyle) {
    real xmargin = ns.xmargin;
    real ymargin = ns.ymargin;
    pen textpen = ns.textpen;
    draw_t drawfn = ns.drawfn;
    real mag = ns.mag;

    node nd;
    label(nd.stuff, L, textpen);
    pair M=max(nd.stuff),
         m=min(nd.stuff),
         D=M-m,
         c=0.5*(M+m);
    pair DD=mag*(D+2*(xmargin,ymargin));
    real ra, rb;
    ra=0.5*DD.x*2;rb=0.5*DD.y*2;
    nd.outline=diamond(c, ra, rb);
    drawfn(nd.stuff, nd.outline);
    return nd;
}

node[] ndiamonds(nodestyle ns=defaultnodestyle ... Label[] Ls) {
    node[] nds;
    for (Label L : Ls) {
        nds.push(ndiamond(L, ns));
    }
    return nds;
}

// parallelogram
node nparallelogram(Label L, nodestyle ns=defaultnodestyle) {
    real xmargin = ns.xmargin;
    real ymargin = ns.ymargin;
    pen textpen = ns.textpen;
    draw_t drawfn = ns.drawfn;
    real mag = ns.mag;

    real shiftratio = 0.2; // additional parameter

    node nd;
    label(nd.stuff, L, textpen);
    pair M=max(nd.stuff),
         m=min(nd.stuff),
         D=M-m,
         c=0.5*(M+m);
    pair MM=mag*(M+(xmargin,ymargin)),
         mm=mag*(m-(xmargin,ymargin)),
         DD=MM-mm;
    pair d=(shiftratio*DD.x,0);
    pair lb=mm,rb=(MM.x,mm.y),rt=MM,lt=(mm.x,MM.y);
    lb=lb-d;rt=rt+d;
    nd.outline=lb--rb--rt--lt--cycle;
    drawfn(nd.stuff, nd.outline);
    return nd;
}

node[] nparallelograms(nodestyle ns=defaultnodestyle ... Label[] Ls) {
    node[] nds;
    for (Label L : Ls) {
        nds.push(nparallelogram(L, ns));
    }
    return nds;
}
