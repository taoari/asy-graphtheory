import node;

// light

nodestyle defaultcircuitlightstyle=copy(defaultnodestyle);

node circuit_light(Label L="", pair symdir=E, pair textdir=N, 
        nodestyle ns=defaultcircuitlightstyle) {
    pen textpen=ns.textpen;
    real size=ns.size;
    draw_t filler=ns.filler;
    draw_t indrawer=ns.indrawer;
    draw_t outdrawer=ns.outdrawer;

    // transformation
    transform t0=scale(size);
    transform t=t0;
    // design in unitcircle
    path outline=unitcircle;
    path g1=(dir(45)--dir(45+180));
    path g2=(dir(-45)--dir(-45+180));

    picture pic;
    filler(pic, outline);   // order: filler->indrawer->outdrawer->label
    indrawer(pic, g1);
    indrawer(pic, g2);
    outdrawer(pic, outline);

    // define node
    node nd;
    nd.outline=t*outline;		// outline
    add(nd.stuff, t*pic);			// stuff
    // label position
    node l=node(L);
    node c=node(outline=nd.outline);
    label(nd.stuff,L,point(c,textdir)+(l.pos-point(l,-textdir)), textpen);
    return nd;
}

// battery: symdir -> positive dir

nodestyle defaultcircuitbatterystyle=copy(defaultnodestyle);

node circuit_battery(Label L="", pair symdir, 
        pair textdir=rotate(90)*symdir, 
        nodestyle ns=defaultcircuitbatterystyle) {
    pen textpen=ns.textpen;
    real size=ns.size;
    draw_t filler=ns.filler;
    draw_t indrawer=ns.indrawer;
    draw_t outdrawer=ns.outdrawer;

    // transformation
    transform t=rotate(degrees(symdir))*scale(size);
    transform t0=scale(size);
    // design in unitcircle
    real posx=0.5, posy=1;
    real negx=-0.5, negy=0.5;
    path g1=((posx,-posy)--(posx,posy));
    path g2=((negx,-negy)--(negx,negy));
    path outline=box((negx,-posy),(posx,posy));

    picture pic;
    indrawer(pic, g1, g2);

    // define node
    node nd;
    nd.outline=t*outline;		// outline
    add(nd.stuff, t*pic);			// stuff
    // label position
    node l=nbox(L);
    node c=node(outline=nd.outline);
    label(nd.stuff,L,c.dir(textdir)+(l.pos-l.dir(-textdir)), textpen);
    return nd;
}

// switch: symdir -> open dir

nodestyle defaultcircuitswitchstyle=copy(defaultnodestyle);

node circuit_switch(Label L="", pair symdir, pair textdir=symdir, 
        nodestyle ns=defaultcircuitswitchstyle) {
    pen textpen=ns.textpen;
    real size=ns.size;
    draw_t filler=ns.filler;
    draw_t indrawer=ns.indrawer;
    draw_t outdrawer=ns.outdrawer;

    // transformation
    transform t=rotate(degrees(symdir))*scale(size);
    transform t0=scale(size);
    // design in unitcircle
    real r=0.1, ang=30;
    path g1=circle((0,1-r),r);
    path g2=circle((0,-1+r),r);
    path g3=(0,1-r)+r*dir(-90+ang)--dir(-90+ang);
    path outline=box((-r,-1),(1,1));

    picture pic;
    indrawer(pic, g1, g2, g3);

    // define node
    node nd;
    nd.outline=t*outline;		// outline
    add(nd.stuff, t*pic);			// stuff
    // label position
    node l=nbox(L);
    node c=node(outline=nd.outline);
    label(nd.stuff,L,c.dir(textdir)+(l.pos-l.dir(-textdir)), textpen);
    return nd;
}
