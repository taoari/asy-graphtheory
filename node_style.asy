import node_drawtype;

//////////////////////////////////
// nodestyle
// definition nodestyle
struct nodestyle{
  real xmargin=0;
  real ymargin=xmargin;
  pen textpen=currentpen;
  draw_t drawfn=Drawer;
  real mag=1.0;
  int factortype=0;

  void operator init(real xmargin=0, real ymargin=xmargin, 
      pen textpen=currentpen,
    draw_t drawfn=Drawer, real mag=1, int factortype=0)
  {
    this.xmargin=xmargin;
    this.ymargin=ymargin;
    this.textpen=textpen;
    this.drawfn=drawfn;
    this.mag=mag;
    this.factortype=factortype;
  }
};

// nodestyle
nodestyle defaultnodestyle;

///////////////////////////////////////
// symbolstyle
real defaultsymbolsize=0.5cm;

// define symbolstyle
struct symbolstyle{
  real size=defaultsymbolsize;
  real xmargin=0;
  real ymargin=xmargin;
  pen textpen=currentpen;
  draw_t filler=None;
  draw_t indrawer=Drawer;
  // pen indrawerpen=currentpen;
  draw_t outdrawer=indrawer;

  void operator init(real size=defaultsymbolsize, real xmargin=0, real ymargin=xmargin, pen textpen=currentpen, 
      draw_t filler=None, draw_t indrawer=Drawer, 
      // pen indrawerpen=currentpen, 
	  draw_t outdrawer=indrawer)
  {
    this.size=size;
    this.xmargin=xmargin;
    this.ymargin=ymargin;
    this.textpen=textpen;
    this.filler=filler;
    this.indrawer=indrawer;
    // this.indrawerpen=indrawerpen;
    this.outdrawer=outdrawer;
  }
};

symbolstyle defaultsymbolstyle;
