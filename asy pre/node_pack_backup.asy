node pack(pair dir, int centerat, real skip=0, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0)  ... node[] nds)
{
  node env;
  env.pos=pos;	// env.pos
  boundbox bb;
  int n=nds.length;
  for (int i=1; i<n; ++i)
    nds[i-1]<<reldir(dir, skip)<<nds[i];

  bb=bb(shift(nds[0].pos)*nds[0].outline);
  real xmin=bb.m.x, xmax=bb.M.x;
  real ymin=bb.m.y, ymax=bb.M.y;
  for (int i=1; i<n; ++i)
  {
    bb=bb(shift(nds[i].pos)*nds[i].outline);
    xmin=min(xmin, bb.m.x); xmax=max(xmax, bb.M.x);
    ymin=min(ymin, bb.m.y); ymax=max(ymax, bb.M.y);
  }

  if (!(centerat>=-n && centerat<n))
	abort("centerat out of range");
  pair c=(0,0)-nds[(centerat+n)%n].pos;
  pair d=(xmargin,ymargin);
  env.outline=shift(c)*box((xmin,ymin)-d,(xmax,ymax)+d); // env.outline
  drawfn(env.stuff, env.outline);	// env.stuff: background
  for (node nd: nds)
  {
    nd.pos+=c; 
    add(env.stuff, shift(nd.pos)*nd.stuff); // env.stuff
  }
  return env;
}

node pack(pair dir, pair centerat=(0.5, 0.5), real skip=0, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0)  ... node[] nds)
{
  real hfraction=centerat.x, vfraction=centerat.y;

  node env;
  env.pos=pos;	// env.pos
  boundbox bb;
  int n=nds.length;
  for (int i=1; i<n; ++i)
    nds[i-1]<<reldir(dir, skip)<<nds[i];

  bb=bb(shift(nds[0].pos)*nds[0].outline);
  real xmin=bb.m.x, xmax=bb.M.x;
  real ymin=bb.m.y, ymax=bb.M.y;
  for (int i=1; i<n; ++i)
  {
    bb=bb(shift(nds[i].pos)*nds[i].outline);
    xmin=min(xmin, bb.m.x); xmax=max(xmax, bb.M.x);
    ymin=min(ymin, bb.m.y); ymax=max(ymax, bb.M.y);
  }
  pair c=(0,0)-((1-hfraction)*xmin+hfraction*xmax, (1-vfraction)*ymin+vfraction*ymax);
  pair d=(xmargin,ymargin);
  env.outline=shift(c)*box((xmin,ymin)-d,(xmax,ymax)+d); // env.outline
  drawfn(env.stuff, env.outline);	// env.stuff: background
  for (node nd: nds)
  {
    nd.pos+=c; 
    add(env.stuff, shift(nd.pos)*nd.stuff); // env.stuff
  }
  return env;
}


node hpack(pair centerat=(0.5, 0.5), pair flush=(0,0), bool sameheight=true, real skip=0, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  real hfraction=centerat.x, vfraction=centerat.y;

  node env;
  env.pos=pos; // env.pos
  int n=nds.length;
  if (n<1)
    abort("hpack: nodes at least 1");

  if (!(flush==(0,0))) sameheight=false;
  if (sameheight)
  {
    for (int i=0; i<n; ++i)
      nds[i]=copy(nds[i]);  
    sameheight(... nds);
  }
  for (int i=1; i<n; ++i)
    nds[i-1]<<relright(skip)<<nds[i];
  flush(flush ... nds);

  boundbox bb;
  bb=bb(shift(nds[0].pos)*nds[0].outline);
  real xmin=bb.m.x, xmax=bb.M.x;
  real ymin=bb.m.y, ymax=bb.M.y;
  for (int i=1; i<n; ++i)
  {
    bb=bb(shift(nds[i].pos)*nds[i].outline);
    xmin=min(xmin, bb.m.x); xmax=max(xmax, bb.M.x);
    ymin=min(ymin, bb.m.y); ymax=max(ymax, bb.M.y);
  }
  pair c=(0,0)-((1-hfraction)*xmin+hfraction*xmax, (1-vfraction)*ymin+vfraction*ymax);
  pair d=(xmargin,ymargin);
  env.outline=shift(c)*box((xmin,ymin)-d,(xmax,ymax)+d); // env.outline
  drawfn(env.stuff, env.outline);	// env.stuff: background
  for (node nd: nds)
  {
    nd.pos+=c; 
    add(env.stuff, shift(nd.pos)*nd.stuff); // env.stuff
  }
  return env;
}


node vpack(pair centerat=(0.5,0.5), pair flush=(0,0), bool samewidth=true, real skip=0, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  real hfraction=centerat.x, vfraction=centerat.y;

  node env;
  env.pos=pos; // env.pos
  int n=nds.length;
  if (n<1)
    abort("hpack: nodes at least 1");

  if (!(flush==(0,0))) samewidth=false;
  if (samewidth)
  {
    for (int i=0; i<n; ++i)
      nds[i]=copy(nds[i]);    
    samewidth(... nds);
  }
  for (int i=1; i<n; ++i)
    nds[i-1]<<reldown(skip)<<nds[i];
  flush(flush ... nds);

  boundbox bb;
  bb=bb(shift(nds[0].pos)*nds[0].outline);
  real xmin=bb.m.x, xmax=bb.M.x;
  real ymin=bb.m.y, ymax=bb.M.y;
  for (int i=1; i<n; ++i)
  {
    bb=bb(shift(nds[i].pos)*nds[i].outline);
    xmin=min(xmin, bb.m.x); xmax=max(xmax, bb.M.x);
    ymin=min(ymin, bb.m.y); ymax=max(ymax, bb.M.y);
  }
  pair c=(0,0)-((1-hfraction)*xmin+hfraction*xmax, (1-vfraction)*ymin+vfraction*ymax);
  pair d=(xmargin,ymargin);
  env.outline=shift(c)*box((xmin,ymin)-d,(xmax,ymax)+d); // env.outline
  drawfn(env.stuff, env.outline);	// env.stuff: background
  for (node nd: nds)
  {
    nd.pos+=c; 
    add(env.stuff, shift(nd.pos)*nd.stuff); // env.stuff
  }
  return env;
}


node hpack(int centerat, pair flush=(0,0), bool sameheight=true, real skip=0, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  node env;
  env.pos=pos; // env.pos
  int n=nds.length;
  if (n<1)
    abort("hpack: nodes at least 1");

  if (!(flush==(0,0))) sameheight=false;
  if (sameheight)
  {
    for (int i=0; i<n; ++i)
      nds[i]=copy(nds[i]);  
    sameheight(... nds);
  }
  for (int i=1; i<n; ++i)
    nds[i-1]<<relright(skip)<<nds[i];
  flush(flush ... nds);

  boundbox bb;
  boundbox bb;
  bb=bb(shift(nds[0].pos)*nds[0].outline);
  real xmin=bb.m.x, xmax=bb.M.x;
  real ymin=bb.m.y, ymax=bb.M.y;
  for (int i=1; i<n; ++i)
  {
    bb=bb(shift(nds[i].pos)*nds[i].outline);
    xmin=min(xmin, bb.m.x); xmax=max(xmax, bb.M.x);
    ymin=min(ymin, bb.m.y); ymax=max(ymax, bb.M.y);
  }
  if (!(centerat>=-n && centerat<n))
	abort("centerat out of range");
  pair c=(0,0)-nds[(centerat+n)%n].pos;
  pair d=(xmargin,ymargin);
  env.outline=shift(c)*box((xmin,ymin)-d,(xmax,ymax)+d); // env.outline
  drawfn(env.stuff, env.outline);	// env.stuff: background
  for (node nd: nds)
  {
    nd.pos+=c; 
    add(env.stuff, shift(nd.pos)*nd.stuff); // env.stuff
  }
  return env;
}


node vpack(int centerat, pair flush=(0,0), bool samewidth=true, real skip=0, real xmargin=0, real ymargin=xmargin, draw_t drawfn=None, pair pos=(0,0) ... node[] nds)
{
  node env;
  env.pos=pos; // env.pos
  int n=nds.length;
  if (n<1)
    abort("hpack: nodes at least 1");

  if (!(flush==(0,0))) samewidth=false;
  if (samewidth)
  {
    for (int i=0; i<n; ++i)
      nds[i]=copy(nds[i]);    
    samewidth(... nds);
  }
  for (int i=1; i<n; ++i)
    nds[i-1]<<reldown(skip)<<nds[i];
  flush(flush ... nds);

  boundbox bb;
  boundbox bb;
  bb=bb(shift(nds[0].pos)*nds[0].outline);
  real xmin=bb.m.x, xmax=bb.M.x;
  real ymin=bb.m.y, ymax=bb.M.y;
  for (int i=1; i<n; ++i)
  {
    bb=bb(shift(nds[i].pos)*nds[i].outline);
    xmin=min(xmin, bb.m.x); xmax=max(xmax, bb.M.x);
    ymin=min(ymin, bb.m.y); ymax=max(ymax, bb.M.y);
  }
  if (!(centerat>=-n && centerat<n))
    abort("centerat out of range");
  pair c=(0,0)-nds[(centerat+n)%n].pos;
  pair d=(xmargin,ymargin);
  env.outline=shift(c)*box((xmin,ymin)-d,(xmax,ymax)+d); // env.outline
  drawfn(env.stuff, env.outline);	// env.stuff: background
  for (node nd: nds)
  {
    nd.pos+=c; 
    add(env.stuff, shift(nd.pos)*nd.stuff); // env.stuff
  }
  return env;
}
