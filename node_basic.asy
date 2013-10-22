// struct node
struct node{
  // real outline is: shift(pos)*outline, 
  path outline=(0,0)--cycle; // outline: should be centered around (0,0)
  picture stuff=new picture; // stuff
  pair pos=(0,0); // position

  // for dock
  bool docked=false;
  node [] sub=new node[];
  pair relpos=(0,0);

  void operator init(path outline=(0,0)--cycle, picture stuff=new picture,
      pair pos=(0,0))
  {
    this.outline=outline;
    this.pos=pos;
    this.stuff = stuff;
  }
  // position of node at modified direction v
  pair point(pair v)
  {
    pair c=pos;
    path g=shift(pos)*outline;
    pair M=max(g), 
	 m=min(g),
	 D=M-m;
    path ray=c--c+length(M-m)*unit((D.x*v.x,D.y*v.y));
    return intersectionpoint(g,ray);
  }
  // position of node at direction v
  pair dir(pair v)
  {
    pair c=pos;
    path g=shift(pos)*outline;
    pair M=max(g), 
	 m=min(g);
    path ray=c--c+length(M-m)*unit(v);
    return intersectionpoint(g,ray);
  }
  // position of node at degree v
  pair angle(real deg)
  {
    return this.dir(dir(deg));
  }
};

node copy(node nd)
{
  node cp;
  cp.outline=nd.outline;
  cp.pos=nd.pos;
  cp.stuff=nd.stuff.copy();
  return cp;
}
// basic operations
pair operator^(node nd, pair v)
{
  return nd.point(v);
}

node operator+(node nd, pair shift)
{
  nd.pos+=shift;
  return nd;
}

node operator-(node nd, pair shift)
{
  nd.pos-=shift;
  return nd;
}

pair position(node nd)
{
  return nd.pos;
}
// interp(pos) and middle(pos)
pair interppos(node nd1, node nd2, real t, bool rel=true)
{
  if (rel==false)
    return (1-t)*nd1.pos+t*nd2.pos;
  else
  {
    pair D=nd2.pos-nd1.pos;
    return (1-t)*nd1.dir(D)+t*nd2.dir(-D);
  }	
}

node interp(node nd1, node nd2, real t, bool rel=true)
{
  node nd;
  nd.pos= interppos(nd1, nd2, t, rel);
  return nd;
}

pair middlepos(node nd1, node nd2, bool rel=true)
{
  return interppos(nd1, nd2, 0.5, rel);
}

node middle(node nd1, node nd2, bool rel=true)
{
  return interp(nd1, nd2, 0.5, rel);
}

// drawing nodes
// drawing node array
void draw(picture pic=currentpicture, node[] nodearr)
{
  for (node nd: nodearr)
    add(pic, shift(nd.pos)*nd.stuff);
}
// drawing one or more nodes
void draw(picture pic=currentpicture ... node[] nodearr)
{
  draw(pic, nodearr);
}

void display(picture pic=currentpicture ... node[] nds)
{
  int n=nds.length;
  for (int i=0; i<n; ++i)
  {
    real t=i/n*360;
    draw(pic,shift(nds[i].pos)*nds[i].outline,hsv(t,1,1));
    dot(pic,string(i),nds[i].pos, hsv(t,1,1));
  }
}
