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

void setpos(node[] nds, pair[] positions) {
  if (nds.length != positions.length)
    abort("set pos: nds.length do not match with pos.length");
  for (int i=0; i<nds.length; ++i)
  {
    nds[i].pos = positions[i];
  }
}

node[] circles(nodestyle[] styles=new nodestyle[]{defaultnodestyle} ... string[] strs)
{
  real eps=0.001;
  int n=strs.length;

  if (styles.length==0)
  {
    for (int i=0; i<n; ++i)
      styles.push(defaultnodestyle);
  }
  else if (styles.length==1)
  {
    for (int i=1; i<n; ++i)
      styles.push(styles[0]);
  }
  else if (styles.length!=n)
    abort("circles: styles.length do not match with strs.length");

  node[] nds;
  for (int i=0; i<n; ++i)
  {
    nds.push(scircle(strs[i], (0,0), styles[i]));
  }
  return nds;
}

