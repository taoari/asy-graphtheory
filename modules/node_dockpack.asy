void assert_docked(node nd)
{
  if (nd.docked)
    abort("node cannot be docked twice");
  nd.docked=true;
}

typedef node nodefunction(node nd);
typedef void nodedrawfunction(picture pic=currentpicture, node nd);

// node function
node refresh(node nd)
{
  for (node n: nd.sub)
  {
    n.pos=nd.pos+n.relpos;
    refresh(n);
  }
  return nd;
}

// node draw function
void draw(picture pic=currentpicture, node nd)
{
  add(pic, shift(nd.pos)*nd.stuff);
}

void deepdraw(picture pic=currentpicture, node nd)
{
  add(pic, shift(nd.pos)*nd.stuff);
  for (node n: nd.sub)
    deepdraw(pic, n);
}

void display(picture pic=currentpicture, node nd)
{
  draw(pic, shift(nd.pos)*nd.outline,red);
  dot(pic, "C", nd.pos,red);
}

node operator@(node nd, nodefunction nf) { nf(nd); return nd; }
void operator@(node nd, nodedrawfunction ndf) { ndf(currentpicture, nd); }

node dockpack(pair dir, real skip, real anginc,  int centerat, pair fraction, bool rel, pair flush, bool samewh, real xmargin, real ymargin, draw_t drawfn, bool fractionmode, bool fancymode, bool packmode, pair pos ... node[] nds)
{
  // (dock, pack) or (integer, fraction) or (nofancy, fancy) = 8 modes
  // dockmode: parent: outline, sub, stuff background; child: docked, relpos
  // packmode: use copy of nds, no sub and assert_dock, add stuff of child
  // fractionmode v.s. integermode: pair c; different
  // fancymode: anginc
  node env;
  env.pos=pos;	// env.pos
  boundbox bb;
  int n=nds.length;
  if (n<1)
    abort("dock: nds at least 1");

  if (packmode) 
  { for (int i=0; i<n; ++i) nds[i]=copy(nds[i]); }
  else
  {
    env.sub.push(nds[0]); // sub
    assert_docked(nds[0]); // docked
  }

  if (!(flush==(0,0))) samewh=false;
  if (samewh)
    if (dir==S || dir==N)
      samewidth(... nds);
    else if (dir==E || dir==W)
      sameheight(... nds);

  if (!fancymode) anginc=0; // fancymode
  real ang=degrees(dir);
  for (int i=1; i<n; ++i)
  {
    if (!packmode)
    {
      env.sub.push(nds[i]); // sub
      assert_docked(nds[i]); // docked
    }
    if (rel==false)
      nds[i-1]<<edir(ang, skip)<<nds[i];
    else
    {
      nds[i-1]<<reldir(ang, skip)<<nds[i];
    }
    ang+=anginc;
  }
  flush(flush ... nds);

  bb=bb(shift(nds[0].pos)*nds[0].outline);
  real xmin=bb.m.x, xmax=bb.M.x;
  real ymin=bb.m.y, ymax=bb.M.y;
  for (int i=1; i<n; ++i)
  {
    bb=bb(shift(nds[i].pos)*nds[i].outline);
    xmin=min(xmin, bb.m.x); xmax=max(xmax, bb.M.x);
    ymin=min(ymin, bb.m.y); ymax=max(ymax, bb.M.y);
  }

  pair c;
  if (fractionmode)
  {
    real hfraction=fraction.x, vfraction=fraction.y;
    c=(0,0)-((1-hfraction)*xmin+hfraction*xmax, (1-vfraction)*ymin+vfraction*ymax);
  }
  else
  {
    if (!(centerat>=-n && centerat<n))
      abort("centerat out of range");
    c=(0,0)-nds[(centerat+n)%n].pos;
    // vector: nds[centerat].pos->(0,0)
  }    
  
  pair d=(xmargin, ymargin);
  env.outline=shift(c)*box((xmin,ymin)-d,(xmax,ymax)+d); // env.outline
  drawfn(env.stuff, env.outline);	// env.stuff: background
  for (node nd: nds)
    nd.relpos=nd.pos+c; // relpos

  if (packmode) // pack: env.stuff
  { for (node nd: nds) add(env.stuff, shift(nd.relpos)*nd.stuff); }

  return env;
}

// dock:
// integer dock
node dock(pair dir, real skip, int centerat, bool rel=true, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  return dockpack(dir, skip, anginc=0.0, centerat, fraction=(0.0,0.0), rel, flush=(0,0), samewh=false, xmargin, ymargin, drawfn, fractionmode=false, fancymode=false, packmode=false, pos ... nds);
}
// fraction dock
node dock(pair dir, real skip, pair fraction=(0.5,0.5), bool rel=true, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  return dockpack(dir, skip, anginc=0, centerat=0, fraction, rel, flush=(0,0), samewh=false, xmargin, ymargin, drawfn, fractionmode=true, fancymode=false, packmode=false, pos ... nds);
}
// fancy integer dock
node fancydock(pair dir, real skip, real anginc, int centerat, bool rel=false, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  return dockpack(dir, skip, anginc, centerat, fraction=(0,0), rel, flush=(0,0), samewh=false, xmargin, ymargin, drawfn, fractionmode=false, fancymode=true, packmode=false, pos ... nds);
}
// fancy fraction dock
node fancydock(pair dir, real skip, real anginc, pair fraction=(0.5,0.5), bool rel=false, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  return dockpack(dir, skip, anginc, centerat=0, fraction, rel, flush=(0,0), samewh=false, xmargin, ymargin, drawfn, fractionmode=true, fancymode=true, packmode=false, pos ... nds);
}
// integer hdock
node hdock(real skip, int centerat, bool rel=true, pair flush=(0,0), bool sameheight=false, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  return dockpack(E, skip, anginc=0.0, centerat, fraction=(0.0,0.0), rel, flush, sameheight, xmargin, ymargin, drawfn, fractionmode=false, fancymode=false, packmode=false, pos ... nds);
}
// fraction hdock
node hdock(real skip, pair fraction=(0.5,0.5), bool rel=true, pair flush=(0,0), bool sameheight=false, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  return dockpack(E, skip, anginc=0, centerat=0, fraction, rel, flush, sameheight, xmargin, ymargin, drawfn, fractionmode=true, fancymode=false, packmode=false, pos ... nds);
}
// integer vdock
node vdock(real skip, int centerat, bool rel=true, pair flush=(0,0), bool samewidth=false, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  return dockpack(S, skip, anginc=0.0, centerat, fraction=(0.0,0.0), rel, flush, samewidth, xmargin, ymargin, drawfn, fractionmode=false, fancymode=false, packmode=false, pos ... nds);
}
// fraction vdock
node vdock(real skip, pair fraction=(0.5,0.5), bool rel=true, pair flush=(0,0), bool samewidth=false, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  return dockpack(S, skip, anginc=0, centerat=0, fraction, rel, flush, samewidth, xmargin, ymargin, drawfn, fractionmode=true, fancymode=false, packmode=false, pos ... nds);
}

//pack:
// integer pack
node pack(pair dir, int centerat, real skip=0, bool rel=true, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  return dockpack(dir, skip, anginc=0.0, centerat, fraction=(0.0,0.0), rel, flush=(0,0), samewh=false, xmargin, ymargin, drawfn, fractionmode=false, fancymode=false, packmode=true, pos ... nds);
}
// fraction pack
node pack(pair dir, pair fraction=(0.5,0.5), real skip=0, bool rel=true, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  return dockpack(dir, skip, anginc=0, centerat=0, fraction, rel, flush=(0,0), samewh=false, xmargin, ymargin, drawfn, fractionmode=true, fancymode=false, packmode=true, pos ... nds);
}
// integer hpack
node hpack(int centerat, real skip=0, bool rel=true, pair flush=(0,0), bool sameheight=false, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  return dockpack(E, skip, anginc=0.0, centerat, fraction=(0.0,0.0), rel, flush, sameheight, xmargin, ymargin, drawfn, fractionmode=false, fancymode=false, packmode=true, pos ... nds);
}
// fraction hpack
node hpack(pair fraction=(0.5,0.5), real skip=0, bool rel=true, pair flush=(0,0), bool sameheight=false, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  return dockpack(E, skip, anginc=0, centerat=0, fraction, rel, flush, sameheight, xmargin, ymargin, drawfn, fractionmode=true, fancymode=false, packmode=true, pos ... nds);
}
// integer vpack
node vpack(int centerat, real skip=0, bool rel=true, pair flush=(0,0), bool samewidth=false, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  return dockpack(S, skip, anginc=0.0, centerat, fraction=(0.0,0.0), rel, flush, samewidth, xmargin, ymargin, drawfn, fractionmode=false, fancymode=false, packmode=true, pos ... nds);
}
// fraction vpack
node vpack(pair fraction=(0.5,0.5), real skip=0, bool rel=true, pair flush=(0,0), bool samewidth=false, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  return dockpack(S, skip, anginc=0, centerat=0, fraction, rel, flush, samewidth, xmargin, ymargin, drawfn, fractionmode=true, fancymode=false, packmode=true, pos ... nds);
}
