// construct node

// circle
typedef node alias_node_circle(Label L, pair pos=(0,0), real xmargin=0, real ymargin=xmargin,
    pen textpen=currentpen, draw_t drawfn=Drawer, real mag=1, int factortype=0);

node node_circle(Label L, pair pos=(0,0), real xmargin=0, real ymargin=xmargin,
    pen textpen=currentpen, draw_t drawfn=Drawer, real mag=1, int factortype=0)
{
  node nd;
  nd.pos=pos;
  label(nd.stuff, L, textpen);
  pair M=max(nd.stuff), 
       m=min(nd.stuff),
       D=M-m,
       c=0.5*(M+m);
  pair DD=mag*(D+2*(xmargin,ymargin));
  real r;
  if(factortype==1)
    r=0.5*DD.x;							// r=x
  else if(factortype==2)
    r=0.5*DD.y;							// r=y
  else if(factortype==3)
    r=0.5*min(DD.x,DD.y);				// r=min(x,y)
  else if(factortype==4)
    r=0.5*max(DD.x,DD.y);				// r=max(x,y)
  else
    r=0.5*length(DD); 					// default: r=length((x,y))
  nd.outline=circle(c, r);
  drawfn(nd.stuff, nd.outline);
  return nd;
}

typedef node alias_node_ellipse(Label L, pair pos=(0,0), real xmargin=0, real ymargin=xmargin,
    pen textpen=currentpen, draw_t drawfn=Drawer, real mag=1, int factortype=0);

node node_ellipse(Label L, pair pos=(0,0), real xmargin=0, real ymargin=xmargin,
    pen textpen=currentpen, draw_t drawfn=Drawer, real mag=1, int factortype=0)
{
  node nd;
  nd.pos=pos;
  label(nd.stuff, L, textpen);
  pair M=max(nd.stuff), 
       m=min(nd.stuff),
       D=M-m,
       c=0.5*(M+m);
  pair DD=mag*(D+2*(xmargin,ymargin));
  real ra, rb;
  if(factortype==1)
  {ra=0.5*DD.x;rb=0.5*DD.y;}						// ra=x, rb=y
  else
  {ra=0.5*DD.x*sqrt(2);rb=0.5*DD.y*sqrt(2);} 		// default: (ra,rb)=sqrt(2)*(x,y)
  nd.outline=ellipse(c, ra, rb);
  drawfn(nd.stuff, nd.outline);
  return nd;
}

typedef node alias_node_box(Label L, pair pos=(0,0), real xmargin=0, real ymargin=xmargin,
    pen textpen=currentpen, draw_t drawfn=Drawer,real mag=1);

node node_box(Label L, pair pos=(0,0), real xmargin=0, real ymargin=xmargin,
    pen textpen=currentpen, draw_t drawfn=Drawer,real mag=1)
{
  node nd;
  nd.pos=pos;
  label(nd.stuff, L, textpen);
  pair M=max(nd.stuff), 
       m=min(nd.stuff),
       D=M-m,
       c=0.5*(M+m);
  pair d=(xmargin,ymargin);
  pair MM=mag*(M+d),
       mm=mag*(m-d);
  nd.outline=box(mm, MM);
  drawfn(nd.stuff, nd.outline);
  return nd;
}

typedef node alias_node_roundbox(Label L, pair pos=(0,0), real xmargin=0, real ymargin=xmargin,
    pen textpen=currentpen, draw_t drawfn=Drawer, real mag=1, real roundratio=0.2);

node node_roundbox(Label L, pair pos=(0,0), real xmargin=0, real ymargin=xmargin,
    pen textpen=currentpen, draw_t drawfn=Drawer, real mag=1, real roundratio=0.2)
{
  node nd;
  nd.pos=pos;
  label(nd.stuff, L, textpen);
  pair M=max(nd.stuff), 
       m=min(nd.stuff),
       D=M-m,
       c=0.5*(M+m);
  pair MM=mag*(M+(xmargin,ymargin)),
       mm=mag*(m-(xmargin,ymargin)),
       DD=MM-mm;
  pair lb=mm,rb=(MM.x,mm.y),rt=MM,lt=(mm.x,MM.y);
  // Thanks to Xiaoqian Wu, a bug here is fixed when the text is long
  real d=roundratio*min(DD.x,DD.y);
  pair dx=(d,0), dy=(0,d);
  nd.outline=lb+dy{S}..{E}lb+dx--rb-dx{E}..{N}rb+dy--rt-dy{N}..{W}rt-dx--lt+dx{W}..{S}lt-dy--cycle;
  drawfn(nd.stuff, nd.outline);
  return nd;
}

private import wt_arcs;

typedef node alias_node_diamond(Label L, pair pos=(0,0), real xmargin=0, real ymargin=xmargin,
    pen textpen=currentpen, draw_t drawfn=Drawer, real mag=1, int factortype=0);

node node_diamond(Label L, pair pos=(0,0), real xmargin=0, real ymargin=xmargin,
    pen textpen=currentpen, draw_t drawfn=Drawer, real mag=1, int factortype=0)
{
  node nd;
  nd.pos=pos;
  label(nd.stuff, L, textpen);
  pair M=max(nd.stuff), 
       m=min(nd.stuff),
       D=M-m,
       c=0.5*(M+m);
  pair DD=mag*(D+2*(xmargin,ymargin));
  real ra, rb;
  if(factortype==1)
  {ra=0.5*DD.x;rb=0.5*DD.y;}						// ra=x, rb=y
  else
  {ra=0.5*DD.x*2;rb=0.5*DD.y*2;} 		// default: (ra,rb)=sqrt(2)*(x,y)
  nd.outline=diamond(c, ra, rb);
  drawfn(nd.stuff, nd.outline);
  return nd;
}

typedef node alias_node_parallelogram(Label L, pair pos=(0,0), real xmargin=0, real ymargin=xmargin,
    pen textpen=currentpen, draw_t drawfn=Drawer, real mag=1, int factortype=0, real shiftratio=0.2);

node node_parallelogram(Label L, pair pos=(0,0), real xmargin=0, real ymargin=xmargin,
    pen textpen=currentpen, draw_t drawfn=Drawer, real mag=1, int factortype=0, real shiftratio=0.2)
{
  node nd;
  nd.pos=pos;
  label(nd.stuff, L, textpen);
  pair M=max(nd.stuff), 
       m=min(nd.stuff),
       D=M-m,
       c=0.5*(M+m);
  pair MM=mag*(M+(xmargin,ymargin)),
       mm=mag*(m-(xmargin,ymargin)),
       DD=MM-mm;
  pair d=(shiftratio*DD.x,0);
  pair lb=mm,rb=(MM.x,mm.y),rt=MM,lt=(mm.x,MM.y);
  if(factortype==1)
  {lb=lb-d/2;rb=rb-d/2;rt=rt+d/2;lt=lt+d/2;}						// ra=x, rb=y
  else
  {lb=lb-d;rt=rt+d;} 		// default: (ra,rb)=sqrt(2)*(x,y)
  nd.outline=lb--rb--rt--lt--cycle;
  drawfn(nd.stuff, nd.outline);
  return nd;
}

typedef node alias_node_none(Label L, pair pos=(0,0), real xmargin=0, real ymargin=xmargin,
    pen textpen=currentpen, real mag=1);

node node_none(Label L, pair pos=(0,0), real xmargin=0, real ymargin=xmargin,
    pen textpen=currentpen, real mag=1)
{
  return node_box(L, pos, xmargin, ymargin, textpen, drawfn=None, mag);
}
/////////////////////////////////////////////
// alias names
alias_node_circle circle=node_circle;
alias_node_circle ncircle=node_circle;

alias_node_ellipse ellipse=node_ellipse;
alias_node_ellipse nellipse=node_ellipse;

alias_node_box box=node_box;
alias_node_box nbox=node_box;

alias_node_roundbox roundbox=node_roundbox;
alias_node_roundbox nroundbox=node_roundbox;

alias_node_diamond diamond=node_diamond;
alias_node_diamond ndiamond=node_diamond;

alias_node_parallelogram parallelogram=node_parallelogram;
alias_node_parallelogram nparallelogram=node_parallelogram;

alias_node_none nnone=node_none;

