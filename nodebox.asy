import node;

// box with fixed size: (width, height)
node nbox(pair size, Label L, pair pos=(0,0), real xmargin=0, real ymargin=xmargin,
    pen textpen=currentpen, draw_t drawfn=Drawer)
{
  node nd;
  nd.pos=pos;
  label(nd.stuff, L, textpen);
  pair rt=size/2+(xmargin, ymargin);
  nd.outline=box(-rt, rt);
  drawfn(nd.stuff, nd.outline);
  return nd;
}

node sbox(pair size, Label L, pair pos=(0,0), nodestyle style=defaultnodestyle)
{
  return nbox(size, L, pos, style.xmargin, style.ymargin, style.textpen, style.drawfn);
}

// box with fixed width
node nbox(real w, string s, pair pos=(0,0), real xmargin=0, real ymargin=xmargin,
    pen textpen=currentpen, draw_t drawfn=Drawer)
{
  node nd;
  nd.pos=pos;
  s=minipage2(s, w, smart=false);
  label(nd.stuff, s, textpen);
  real h=gettextsize(s).y;
  pair rt=(w,h)/2+(xmargin, ymargin);
  nd.outline=box(-rt, rt);
  drawfn(nd.stuff, nd.outline);
  return nd;
}

node sbox(real w, string s, pair pos=(0,0), nodestyle style=defaultnodestyle)
{
  return nbox(w, s, pos, style.xmargin, style.ymargin, style.textpen, style.drawfn);
}

// boxes, hbox, vbox: specify width
node[] boxes(real width, real[] ratios=new real[]{}, pair pos=(0,0), nodestyle[] styles=new nodestyle[]{defaultnodestyle} ... string[] strs)
{
  real eps=0.001;
  int n=strs.length;
  if (ratios.length==0)
  {
    for (int i=0; i<n; ++i)
      ratios.push(1/n);
  }
  else if (ratios.length==n-1)
  {
    if (sum(ratios)<1)
      ratios.push(1-sum(ratios));
    else
      abort("hboxes: sum of ratios > 1");
  }
  else if (ratios.length==n)
  {
    if(sum(ratios)>1+eps)
      abort("hboxes: sum of ratios > 1");
  }
  else
    abort("hboxes: ratios.length do not match with strs.length");

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
    abort("hboxes: styles.length do not match with strs.length");

  node[] nds;
  for (int i=0; i<n; ++i)
  {
    nds.push(sbox(width*ratios[i], strs[i], (0,0), styles[i]));
  }
  return nds;
}

node hbox(real width, real[] ratios=new real[]{}, pair pos=(0,0), nodestyle[] styles=new nodestyle[]{defaultnodestyle} ... string[] strs)
{
  node[] nds=boxes(width, ratios, pos, styles ... strs);
  return hpack(... nds);
}

node vbox(real width, pair pos=(0,0), nodestyle[] styles=new nodestyle[]{defaultnodestyle} ... string[] strs)
{
  node[] nds=boxes(strs.length*width, pos, styles ... strs);
  return vpack(... nds);
}

// boxes, hbox, vbox: adaptive and flush
node[] boxes(pair pos=(0,0), nodestyle[] styles=new nodestyle[]{defaultnodestyle} ... string[] strs)
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
    abort("hboxes: styles.length do not match with strs.length");

  node[] nds;
  for (int i=0; i<n; ++i)
  {
    nds.push(sbox(strs[i], (0,0), styles[i]));
  }
  return nds;
}

node hbox(pair pos=(0,0), nodestyle[] styles=new nodestyle[]{defaultnodestyle}, pair flush=(0,0), bool sameheight=true ... string[] strs)
{
  node[] nds=boxes(pos, styles ... strs);
  return hpack(flush=flush, sameheight=sameheight ... nds);
}

node vbox(pair pos=(0,0), nodestyle[] styles=new nodestyle[]{defaultnodestyle}, pair flush=(0,0), bool samewidth=true ... string[] strs)
{
  node[] nds=boxes(pos, styles ... strs);
  return vpack(flush=flush, samewidth=samewidth ... nds);
}
