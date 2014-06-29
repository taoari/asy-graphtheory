// boundbox
struct boundbox{
  pair m=(0,0);
  pair M=(0,0);

  void operator init ( pair m=(0,0), pair M=(0,0))
  {
    this.m=m; this.M=M;
  }
}

boundbox bb(path g)
{
  boundbox bb=boundbox(min(g), max(g));
  return bb;
}

boundbox bb(node nd)
{
  boundbox bb=bb(nd.outline);
  bb.m+=nd.pos;
  bb.M+=nd.pos;
  return bb;
}

boundbox bb(node[] nds)
{
  if (nds.length<1)
    abort("bb: nds.length at least 1");
  boundbox bb=bb(nds[0]);
  real xmin=bb.m.x, xmax=bb.M.x, ymin=bb.m.y, ymax=bb.M.y;
  for (int i=1; i<nds.length; ++i)
  {
    bb=bb(nds[i]);
    xmin=min(xmin, bb.m.x);
    xmax=max(xmax, bb.M.x);
    ymin=min(ymin, bb.m.y);
    ymax=max(ymax, bb.M.y);
  }
  bb.m=(xmin,ymin); bb.M=(xmax,ymax);
  return bb;
}

// middle
node middlen(... node[] nds) {
    boundbox bb=bb(nds);
    node nd;
    nd.pos = (bb.m+bb.M)/2;
    return nd;
}

// setpos
void setpos(node[] nds, pair[] positions) {
  if (nds.length != positions.length)
    abort("set pos: nds.length do not match with pos.length");
  for (int i=0; i<nds.length; ++i)
  {
    nds[i].pos = positions[i];
  }
}

// flush
void flush(align align ... node[] nds)
{
  pair dir=align.dir;
  int n=nds.length;
  if (n<2 || dir==(0,0))
    return;
  boundbox bb=bb(shift(nds[0].pos)*nds[0].outline);
  real refval;
  if (dir==(0,0))
    return;
  else if (dir==N)
  {
    refval=bb.M.y;
    for (int i=1; i<n; ++i)
    {
      bb=bb(shift(nds[i].pos)*nds[i].outline);
      nds[i].pos=(nds[i].pos.x, nds[i].pos.y+(refval-bb.M.y));
    }
  }
  else if (dir==S)
  {
    refval=bb.m.y;
    for (int i=1; i<n; ++i)
    {
      bb=bb(shift(nds[i].pos)*nds[i].outline);
      nds[i].pos=(nds[i].pos.x, nds[i].pos.y+(refval-bb.m.y));
    }
  }
  else if (dir==W)
  {
    refval=bb.m.x;
    for (int i=1; i<n; ++i)
    {
      bb=bb(shift(nds[i].pos)*nds[i].outline);
      nds[i].pos=(nds[i].pos.x+(refval-bb.m.x), nds[i].pos.y);
    }
  }
  else if (dir==E)
  {
    refval=bb.M.x;
    for (int i=1; i<n; ++i)
    {
      bb=bb(shift(nds[i].pos)*nds[i].outline);
      nds[i].pos=(nds[i].pos.x+(refval-bb.M.x), nds[i].pos.y);
    }
  }
  else
    abort("flush: invalid align, must be N, S, W, E, (0,0)");
}

// setheight, setwidth, setsize
void setheight(real h=0 ... node[] nds)
{
    if (h==0 && nds.length<2)
        return;

    boundbox bb;
    if (h==0) {
        for (node nd: nds) {
            bb = bb(nd.outline);
            h = max(h, (bb.M-bb.m).y);
        }
    }

    for (node nd: nds)
    {
        bb=bb(nd.outline);
        real nh=(bb.M-bb.m).y;
        nd.outline=yscale(h/nh)*nd.outline;
        nd.stuff=yscale(h/nh)*nd.stuff;
    }
}

void setwidth(real w=0 ... node[] nds)
{
    if (w==0 && nds.length<2)
        return;

    boundbox bb;
    if (w==0) {
        for (node nd: nds) {
            bb = bb(nd.outline);
            w = max(w, (bb.M-bb.m).x);
        }
    }

    for (node nd: nds)
    {
        bb=bb(nd.outline);
        real nw=(bb.M-bb.m).x;
        nd.outline=xscale(w/nw)*nd.outline;
        nd.stuff=xscale(w/nw)*nd.stuff;
    }
}

void setsize(pair size=(0,0) ... node[] nds) {
    setwidth(size.x ... nds);
    setheight(size.y ... nds);
}

void setwidth(real width, real[] ratios ... node[] nds) {
    int n = nds.length;
    if (ratios.length == 0) {
        for (int i=0; i<n; ++i)
            ratios.push(1/n);
    } else if (ratios.length == n) {
        ratios = ratios/sum(ratios);
    } else {
        abort("setwidth: invalid ratios");
    }

    real[] widths = width*ratios;

    for (int i=0; i<n; ++i)
        setwidth(widths[i], nds[i]);
}

// pack
nodestyle defaultpackstyle=nodestyle(drawfn=None);
real defaultpackskip=0;

node npack(nodestyle ns=defaultpackstyle ... node[] nds) {
    real xmargin=ns.xmargin;
    real ymargin=ns.ymargin;
    draw_t drawfn=ns.drawfn;
    real mag=ns.mag;

    pair d=mag*(xmargin, ymargin);
    boundbox bb=bb(nds);
    node nd;
    nd.pos = (bb.m+bb.M)/2.0;
    nd.outline = box(bb.m-nd.pos-d, bb.M-nd.pos+d);
    for(node n: nds) {
        add(nd.stuff, shift(n.pos-nd.pos)*n.stuff);
    }
    drawfn(nd.stuff, nd.outline);
    return nd;
}


node hpack(real h=-1, align align=(0,0), real skip=defaultpackskip,
       nodestyle ns=defaultpackstyle ... node[] nds) {
    if (h>=0)
        setheight(h ... nds);
    hlayout(skip ... nds);
    flush(align ... nds);
    return npack(ns ... nds);
}

node vpack(real w=-1, align align=(0,0), real skip=defaultpackskip,
        nodestyle ns=defaultpackstyle ... node[] nds) {
    if (w>=0)
        setwidth(w ... nds);
    vlayout(skip ... nds);
    flush(align ... nds);
    return npack(ns ... nds);
}

