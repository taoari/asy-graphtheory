////////////////////////////////////
// struct node
// design principle: outline and pos is used for layout and positioning
//      all things are drawn in stuff
//      outline is centered at (0,0), when draw, use shift(pos)*stuff
struct node {
    path outline = (0,0)--cycle;
    picture stuff = new picture;
    pair pos = (0,0);

    void operator init(path outline=(0,0)--cycle, 
            picture stuff=new picture,
            pair pos=(0,0)) {
        this.outline = outline;
        this.pos = pos;
        this.stuff = stuff;
    }
    //////////////////////////// 
    // begin obsolted
    // for dock
    bool docked=false;
    node [] sub=new node[];
    pair relpos=(0,0);
    // position of node at modified direction v
    pair point(pair v)
    {
        pair c=pos;
        path g=shift(pos)*outline;
        pair M=max(g), 
             m=min(g),
             D=M-m;
        path ray=c--c+length(M-m)*unit((D.x*v.x,D.y*v.y));
        return intersectionpoint(g,ray);
    }
    // position of node at direction v
    pair dir(pair v)
    {
        pair c=pos;
        path g=shift(pos)*outline;
        pair M=max(g), 
             m=min(g);
        path ray=c--c+length(M-m)*unit(v);
        return intersectionpoint(g,ray);
    }
    // position of node at degree v
    pair angle(real deg)
    {
        return this.dir(dir(deg));
    }
    // end obsoleted
    //////////////////////////////
};

// create a copy
node copy(node nd) {
    node cp;
    cp.outline=nd.outline;
    cp.pos=nd.pos;
    cp.stuff=nd.stuff.copy();
    return cp;
}

// point position at modified direction v
pair operator^(node nd, pair v) {
    pair c=nd.pos;
    path g=shift(nd.pos)*nd.outline;
    pair M=max(g), 
         m=min(g),
         D=M-m;
    // path ray=c--c+length(M-m)*unit(v) // abs direction v
    path ray=c--c+length(M-m)*unit((D.x*v.x,D.y*v.y));
    return intersectionpoint(g,ray);
}

// point position at direction v
pair point(node nd, pair v) {
    pair c=nd.pos;
    path g=shift(nd.pos)*nd.outline;
    pair M=max(g), 
         m=min(g),
         D=M-m;
    path ray=c--c+length(M-m)*unit(v);
    return intersectionpoint(g,ray);
}

// node place holder
node interp(node nd1, node nd2, real t, bool rel=true) {
    node nd;
    if (rel == false) {
        nd.pos = (1-t)*nd1.pos + t*nd2.pos;
    } else {
        pair D = nd2.pos-nd1.pos;
        nd.pos = (1-t)*point(nd1,D) + t*point(nd2,-D);
    }
    return nd;
}

node middle(node nd1, node nd2, bool rel=true) {
    return interp(nd1, nd2, 0.5, rel);
}


// drawing nodes
void draw(picture pic=currentpicture, node[] nodearr)
{
    for (node nd: nodearr)
        add(pic, shift(nd.pos)*nd.stuff);
}

void draw(picture pic=currentpicture ... node[] nodearr)
{
    draw(pic, nodearr);
}

void draw(picture pic=currentpicture, node[][] nds2d)
{
    for (node[] nds: nds2d)
        for (node nd: nds)
            add(pic, shift(nd.pos)*nd.stuff);
}
