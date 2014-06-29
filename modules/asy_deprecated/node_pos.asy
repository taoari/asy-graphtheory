// node position
typedef node possetter(node nd1, node nd2);
typedef node posmaker(node nd1);

posmaker operator<<(node nd1, possetter set)
{
  return new node(node nd2)
  {
    return set(nd1,nd2);
  };
}

node operator<<(posmaker maker, node nd)
{
  return maker(nd);
}

posmaker operator@(node nd1, possetter set)
{
  return new node(node nd2)
  {
    return set(nd1,nd2);
  };
}

node operator@(posmaker maker, node nd)
{
  return maker(nd);
}

// possetter
// possetter: edir
possetter edir(pair dir, real dist)
{
  return new node(node nd1, node nd2)
  {
    nd2.pos=nd1.pos+dist*unit(dir);
    return nd2;
  };
}
possetter edir(real ang, real dist) { return edir(dir(ang), dist); }
possetter edir(int ang, real dist) { return edir(dir(ang), dist); }

// possetter: reldir
possetter reldir(pair dir, real dist)
{
  return new node(node nd1, node nd2)
  {
    nd2.pos=nd1.dir(dir)+dist*unit(dir)+(nd2.pos-nd2.dir(-dir));
    return nd2;
  };
}
possetter reldir(real ang, real dist) { return reldir(dir(ang), dist); }
possetter reldir(int ang, real dist) { return reldir(dir(ang), dist); }

// possetter: 
possetter eleft(real dist) { return edir(W,dist); } 
possetter eright(real dist) { return edir(E,dist); } 
possetter eup(real dist) { return edir(N,dist); } 
possetter edown(real dist) { return edir(S,dist); } 
possetter relleft(real dist) { return reldir(W,dist); } 
possetter relright(real dist) { return reldir(E,dist); } 
possetter relup(real dist) { return reldir(N,dist); } 
possetter reldown(real dist) { return reldir(S,dist); }

// real defaultedgedist=2cm;
// possetter eleft=eleft(defaultedgedist);
// possetter eright=eright(defaultedgedist);
// possetter eup=eup(defaultedgedist);
// possetter edown=edown(defaultedgedist);
// possetter relleft=relleft(defaultedgedist);
// possetter relright=relright(defaultedgedist);
// possetter relup=relup(defaultedgedist);
// possetter reldown=reldown(defaultedgedist);
//end

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

void sameheight(... node[] nds)
{
  int n=nds.length;
  if (n<2)
    return;
  boundbox bb;
  real h=0;
  for (node nd: nds)
  {
    bb=bb(nd.outline);
    h=max(h, (bb.M-bb.m).y);
  }
  for (node nd: nds)
  {
    bb=bb(nd.outline);
    real nh=(bb.M-bb.m).y;
    nd.outline=yscale(h/nh)*nd.outline;
    nd.stuff=yscale(h/nh)*nd.stuff;
  }
}

void samewidth(... node[] nds)
{
  int n=nds.length;
  if (n<2)
    return;
  boundbox bb;
  real w=0;
  for (node nd: nds)
  {
    bb=bb(nd.outline);
    w=max(w, (bb.M-bb.m).x);
  }
  for (node nd: nds)
  {
    bb=bb(nd.outline);
    real nw=(bb.M-bb.m).x;
    nd.outline=xscale(w/nw)*nd.outline;
    nd.stuff=xscale(w/nw)*nd.stuff;
  }
}
