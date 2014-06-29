// pen edgepen=fontsize(8pt)+fontcommand("\ttfamily");
// draw_t drawer1=Drawer;
// draw_t style1=FillDrawer(lightgray,black);

node circuit_light(real size, pair pos=(0,0), Label L="", 
    pair textpos=N, pen textpen=currentpen, draw_t filler=None,
    draw_t indrawer=Drawer, draw_t outdrawer = indrawer)
{
  // transformation
  transform t0=scale(size);
  transform t=t0;
  // design in unitcircle
  path outline=unitcircle;
  path g1=(dir(45)--dir(45+180));
  path g2=(dir(-45)--dir(-45+180));
  
  picture pic;
  filler(pic, outline);			// order: filler->indrawer->outdrawer->label
  indrawer(pic, g1);
  indrawer(pic, g2);
  outdrawer(pic, outline);
    
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

node circuit_battery(pair posalign, real size, pair pos=(0,0),
    Label L="", pair textpos=rotate(90)*posalign, pen textpen=currentpen, 
    draw_t indrawer=InDrawer)//draw_t drawer=Drawer)
    // inpen<=>drawer: inpen can draw with different linewidth
{
  // transformation
  transform t=rotate(degrees(posalign))*scale(size);
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
  nd.pos=pos;					// pos
  nd.outline=t*outline;		// outline
  add(nd.stuff, t*pic);			// stuff
  // label position
  node l=nbox(L);
  node c=node(outline=nd.outline);
  label(nd.stuff,L,c.dir(textpos)+(l.pos-l.dir(-textpos)), textpen);
  return nd;
}

node circuit_switch(pair openalign, real size, pair pos=(0,0),
    Label L="", pair textpos=openalign, pen textpen=currentpen, 
    draw_t indrawer=Drawer)//draw_t drawer=Drawer)
    // inpen<=>drawer: inpen can draw with different linewidth
{
  // transformation
  transform t=rotate(degrees(openalign))*scale(size);
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
  nd.pos=pos;					// pos
  nd.outline=t*outline;		// outline
  add(nd.stuff, t*pic);			// stuff
  // label position
  node l=nbox(L);
  node c=node(outline=nd.outline);
  label(nd.stuff,L,c.dir(textpos)+(l.pos-l.dir(-textpos)), textpen);
  return nd;
}
