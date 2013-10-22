
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

node dock(pair dir, real dist, int centerat, bool rel=true ... node[] nds)
{
  // get value of:
  // parent: outline, sub; child: docked, relpos
  // assuming undocked node's pos=(0,0)
  node env;
  int n=nds.length;
  boundbox bb;

  if (n<1)
    abort("dock: nds at least 1");
  else if (n==1)
  {
    bb=bb(nds[0].outline);
    env.outline=box(bb.m, bb.M);
    env.sub.push(nds[0]);
    assert_docked(nds[0]);
    return env;  
  }

  env.sub.push(nds[0]); // sub
  assert_docked(nds[0]); // docked
  nds[0].relpos=nds[0].pos;

  for (int i=1; i<n; ++i)
  {
    env.sub.push(nds[i]); // sub
    // nds[i].docked=true;   // docked
    assert_docked(nds[i]);
    if (rel==false)
      nds[i-1]<<edir(dir, dist)<<nds[i];
    else
      nds[i-1]<<reldir(dir, dist)<<nds[i];   
    nds[i].relpos=nds[i].pos;
	//nds[i].pos=(0,0);
  }

  bb=bb(shift(nds[0].relpos)*nds[0].outline);
  real xmin=bb.m.x, xmax=bb.M.x;
  real ymin=bb.m.y, ymax=bb.M.y;
  for (int i=1; i<n; ++i)
  {
    bb=bb(shift(nds[i].relpos)*nds[i].outline);
    xmin=min(xmin, bb.m.x); xmax=max(xmax, bb.M.x);
    ymin=min(ymin, bb.m.y); ymax=max(ymax, bb.M.y);
  }

  if (!(centerat>=-n && centerat<n))
	abort("centerat out of range");
  pair c=nds[(centerat+n)%n].pos;
  for (node nd: nds)
    nd.relpos-=c; // relpos
  env.outline=shift(-c)*box((xmin,ymin), (xmax,ymax)); // outline
  return env;
}

node hdock(real dist, int centerat, bool rel=true ... node[] nds)
{ return dock(E, dist, centerat, rel ... nds); }
node vdock(real dist, int centerat, bool rel=true ... node[] nds)
{ return dock(S, dist, centerat, rel ... nds); }

// fraction dock
node dock(pair dir, real dist, pair fraction=(0.5,0.5), bool rel=true ... node[] nds)
{
  real hfraction=fraction.x, vfraction=fraction.y;
  // get value of:
  // parent: outline, sub; child: docked, relpos
  // assuming undocked node's pos=(0,0)
  node env;
  int n=nds.length;
  boundbox bb;

  if (n<1)
    abort("dock: nds at least 1");
  else if (n==1)
  {
    bb=bb(nds[0].outline);
    env.outline=box(bb.m, bb.M);
    env.sub.push(nds[0]);
    assert_docked(nds[0]);
    return env;  
  }

  env.sub.push(nds[0]); // sub
  assert_docked(nds[0]); // docked
  nds[0].relpos=nds[0].pos;

  for (int i=1; i<n; ++i)
  {
    env.sub.push(nds[i]); // sub
    // nds[i].docked=true;   // docked
    assert_docked(nds[i]);
    if (rel==false)
      nds[i-1]<<edir(dir, dist)<<nds[i];
    else
      nds[i-1]<<reldir(dir, dist)<<nds[i];   
    nds[i].relpos=nds[i].pos;
  }
  // calc bb, not centered at (0,0)
  bb=bb(shift(nds[0].relpos)*nds[0].outline);
  real xmin=bb.m.x, xmax=bb.M.x;
  real ymin=bb.m.y, ymax=bb.M.y;
  for (int i=1; i<n; ++i)
  {
    bb=bb(shift(nds[i].relpos)*nds[i].outline);
    xmin=min(xmin, bb.m.x); xmax=max(xmax, bb.M.x);
    ymin=min(ymin, bb.m.y); ymax=max(ymax, bb.M.y);
  }

  pair c=((1-hfraction)*xmin+hfraction*xmax, (1-vfraction)*ymin+vfraction*ymax);
  for (node nd: nds)
    nd.relpos-=c; // relpos
  env.outline=shift(-c)*box((xmin,ymin), (xmax,ymax)); // outline
  return env;
}

node hdock(real dist, pair fraction=(0.5,0.5), bool rel=true ... node[] nds)
{ return dock(E, dist, fraction, rel ... nds); }
node vdock(real dist, pair fraction=(0.5,0.5), bool rel=true ... node[] nds)
{ return dock(S, dist, fraction, rel ... nds); }

// fancy dock
node fancydock(pair dir, real dist, real anginc, int centerat, bool rel=false ... node[] nds)
{
  // get value of:
  // parent: outline, sub; child: docked, relpos
  // assuming undocked node's pos=(0,0)
  node env;
  int n=nds.length;
  boundbox bb;

  if (n<3)
    abort("dock: nds at least 3");

  env.sub.push(nds[0]); // sub
  assert_docked(nds[0]); // docked
  nds[0].relpos=nds[0].pos;

  env.sub.push(nds[1]); // sub
  assert_docked(nds[1]);
  if (rel==false)
    nds[0]<<edir(dir, dist)<<nds[1];
  else
    nds[0]<<reldir(dir, dist)<<nds[1];   
  nds[1].relpos=nds[1].pos;

  real ang=degrees(dir);

  for (int i=2; i<n; ++i)
  {
    env.sub.push(nds[i]); // sub
    // nds[i].docked=true;   // docked
    assert_docked(nds[i]);
    ang+=anginc;
    if (rel==false)
      nds[i-1]<<edir(ang, dist)<<nds[i];
    else
      nds[i-1]<<reldir(ang, dist)<<nds[i];   
    nds[i].relpos=nds[i].pos;
	//nds[i].pos=(0,0);
  }
  bb=bb(shift(nds[0].relpos)*nds[0].outline);
  real xmin=bb.m.x, xmax=bb.M.x;
  real ymin=bb.m.y, ymax=bb.M.y;
  for (int i=1; i<n; ++i)
  {
    bb=bb(shift(nds[i].relpos)*nds[i].outline);
    xmin=min(xmin, bb.m.x); xmax=max(xmax, bb.M.x);
    ymin=min(ymin, bb.m.y); ymax=max(ymax, bb.M.y);
  }

  if (!(centerat>=-n && centerat<n))
	abort("centerat out of range");
  pair c=nds[(centerat+n)%n].pos;
  for (node nd: nds)
    nd.relpos-=c; // relpos
  env.outline=shift(-c)*box((xmin,ymin), (xmax,ymax)); // outline
  return env;
}

node fancydock(pair dir, real dist, real anginc, pair fraction=(0.5, 0.5), bool rel=false ... node[] nds)
{
  real hfraction=fraction.x, vfraction=fraction.y;
  // get value of:
  // parent: outline, sub; child: docked, relpos
  // assuming undocked node's pos=(0,0)
  node env;
  int n=nds.length;
  boundbox bb;

  if (n<3)
    abort("dock: nds at least 3");

  env.sub.push(nds[0]); // sub
  assert_docked(nds[0]); // docked
  nds[0].relpos=nds[0].pos;

  env.sub.push(nds[1]); // sub
  assert_docked(nds[1]);
  if (rel==false)
    nds[0]<<edir(dir, dist)<<nds[1];
  else
    nds[0]<<reldir(dir, dist)<<nds[1];   
  nds[1].relpos=nds[1].pos;

  real ang=degrees(dir);

  for (int i=2; i<n; ++i)
  {
    env.sub.push(nds[i]); // sub
    // nds[i].docked=true;   // docked
    assert_docked(nds[i]);
    ang+=anginc;
    if (rel==false)
      nds[i-1]<<edir(ang, dist)<<nds[i];
    else
      nds[i-1]<<reldir(ang, dist)<<nds[i];   
    nds[i].relpos=nds[i].pos;
	//nds[i].pos=(0,0);
  }
  // calc bb, not centered at (0,0)
  bb=bb(shift(nds[0].relpos)*nds[0].outline);
  real xmin=bb.m.x, xmax=bb.M.x;
  real ymin=bb.m.y, ymax=bb.M.y;
  for (int i=1; i<n; ++i)
  {
    bb=bb(shift(nds[i].relpos)*nds[i].outline);
    xmin=min(xmin, bb.m.x); xmax=max(xmax, bb.M.x);
    ymin=min(ymin, bb.m.y); ymax=max(ymax, bb.M.y);
  }

  pair c=((1-hfraction)*xmin+hfraction*xmax, (1-vfraction)*ymin+vfraction*ymax);
  for (node nd: nds)
    nd.relpos-=c; // relpos
  env.outline=shift(-c)*box((xmin,ymin), (xmax,ymax)); // outline
  return env;
}
