node sml_actorsymbol(real size, pair pos=(0,0), draw_t indrawer=Drawer)
{
  // transformation
  transform t=scale(size);
  // design in unitcircle
  path outline=(-1,-1)--(1,-1)--(1,1)--(-1,1)--cycle;
  real headradius=0.35, armlength=0.7, legheight=armlength;
  real neckheight=1-2headradius, bodydepth=1-legheight,legwidth=legheight;
  path head=circle((0,1-headradius), headradius);
  path arm=(-armlength,0)--(armlength,0);
  path neckbody=(0,neckheight)--(0,-bodydepth);
  path legs=(-legwidth,-1)--(0,-bodydepth)--(legwidth,-1);
  
  picture pic;		// order: filler->indrawer->outdrawer->label
  indrawer(pic, head, arm, neckbody, legs);
    
  // define node
  node nd;
  nd.pos=pos;					// pos
  nd.outline=t*outline;		// outline
  add(nd.stuff, t*pic);			// stuff
  return nd;
}

node sml_actor(real symbolsize, pair pos=(0,0), Label L="", pair textpos=S, real xmargin=0, real ymargin=xmargin, pen textpen=currentpen, draw_t filler=None, draw_t indrawer=Drawer, draw_t outdrawer=None)
{
  return pack(textpos, (0.5,0.5), xmargin=xmargin, ymargin=ymargin, drawfn=filler+outdrawer, pos=pos,
      sml_actorsymbol(symbolsize, indrawer=indrawer),
      nnone(L, textpen));
}

node sml_comsymbol(real size, pair pos=(0,0), draw_t indrawer=Drawer)
{
  // transformation
  transform t=scale(size);
  // design in unitcircle
  real h=0.4, w=0.3, dh=(2-2h)/3/2;
  path b1=box((-1-w,dh),(-1+w,dh+h));
  path b2=box((-1-w,-dh-h),(-1+w,-dh));
  path g1=(-1,-dh-h)--(-1,-1)--(1,-1)--(1,1)--(-1,1)--(-1,dh+h);
  path g2=(-1,dh)--(-1,-dh);
  path outline=(-1-w,-1)--(1,-1)--(1,1)--(-1-w,1)--cycle;
  
  picture pic;		// order: filler->indrawer->outdrawer->label
  indrawer(pic, b1, b2, g1, g2);
    
  // define node
  node nd;
  nd.pos=pos;					// pos
  nd.outline=t*outline;		// outline
  add(nd.stuff, t*pic);			// stuff
  return nd;
}

node sml_com(real symbolsize, pair pos=(0,0), Label L="", pair textpos=W, real xmargin=0.1cm, real ymargin=xmargin, pen textpen=currentpen, draw_t filler=None, draw_t indrawer=Drawer, draw_t outdrawer=Drawer)
{
  return pack(textpos, (0.5,0.5), xmargin=xmargin, ymargin=ymargin, drawfn=filler+outdrawer, pos=pos,
      sml_comsymbol(symbolsize, indrawer=indrawer),
      nnone(L, textpen));
}

node sml_iball(pair align, real size, pair pos=(0,0),
    Label L="", pair textpos=rotate(90)*align, pen textpen=currentpen, 
    draw_t indrawer=Drawer)
{
  // transformation
  transform t=rotate(degrees(align))*scale(size);
  transform t0=scale(size);
  // design in unitcircle
  real dr=0.2, ang=60;
  path g1=circle((0,0),1);
  path g2=arc((0,0),1+dr,-ang,ang);
  path outline=(-1,-1)--(1+dr,-1)--(1+dr,1)--(-1,1)--cycle;
  
  picture pic;
  indrawer(pic, g1, g2);
    
  // define node
  node nd;
  nd.pos=pos;					// pos
  nd.outline=t*outline;		// outline
  add(nd.stuff, t*pic);			// stuff
  // label position
  node l=nbox(L);
  node c=node(outline=nd.outline);
  label(nd.stuff,L,c.dir(textpos)+(l.pos-l.dir(-textpos)), textpen);
  return nd;
}
