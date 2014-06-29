import node;

// actor
nodestyle defaultsmlactorstyle=nodestyle(outdrawer=None);
node sml_actor(Label L="", pair symdir=E, pair textdir=S, 
        nodestyle ns=defaultsmlactorstyle) {
    pen textpen=ns.textpen;
    real size=ns.size;
    draw_t filler=ns.filler;
    draw_t indrawer=ns.indrawer;
    draw_t outdrawer=ns.outdrawer;

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
    nd.outline=t*outline;		// outline
    add(nd.stuff, t*pic);			// stuff
    // label position
    // node l=nbox(L);
    // node c=node(outline=nd.outline);
    // label(nd.stuff,L,point(c,textdir)+(l.pos-point(l,-textdir)), textpen);
    return vpack(nd, node(L));
}

// com
nodestyle defaultsmlcomstyle=new nodestyle;
node sml_com(Label L="", pair symdir=E, pair textdir=W, 
        nodestyle ns=defaultsmlcomstyle) {
    pen textpen=ns.textpen;
    real size=ns.size;
    draw_t filler=ns.filler;
    draw_t indrawer=ns.indrawer;
    draw_t outdrawer=ns.outdrawer;

    // transformation
    transform t=scale(defaulttextheight);
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
    nd.outline=t*outline;		// outline
    add(nd.stuff, t*pic);			// stuff
    return hpack(ns=nodestyle(xmargin=0.1cm, ymargin=0.1cm), node("\bfseries "+L.s), nd);
}

// iball
nodestyle defaultsmliballstyle=new nodestyle;
node sml_iball(Label L="", pair symdir=E, 
        pair textdir=rotate(90)*symdir, 
        nodestyle ns=defaultsmliballstyle) {
    pen textpen=ns.textpen;
    real size=ns.size;
    draw_t filler=ns.filler;
    draw_t indrawer=ns.indrawer;
    draw_t outdrawer=ns.outdrawer;

    // transformation
    transform t=rotate(degrees(symdir))*scale(size);
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
    nd.outline=t*outline;		// outline
    add(nd.stuff, t*pic);			// stuff
    // label position
    node l=nbox(L);
    node c=node(outline=nd.outline);
    label(nd.stuff,L,point(c,textdir)+(l.pos-point(l,-textdir)), textpen);
    return nd;
}

// sml_lead
node sml_lead(string s ... node[] nds)
{
  node body=hpack(align=S, skip=0.2cm, nodestyle(xmargin=0.3cm, ymargin=0.2cm) ... nds);
  s="\bfseries "+s;
  pair margin=(0.2cm,0.1cm);
  pair D=gettextsize(s) + 2*margin;
  real refh=gettextsize("e").y + 2*margin.y;
  node lead=nbox(s);
  setsize((max(0.8cm,D.x), max(refh, D.y)), lead);
  return vpack(align=W, lead, body);
}

node sml_lead(string s ... string[] strs)
{
  node[] nds;
  if (strs.length==1)
    nds.push(node(strs[0]));
  else
  {
    for (string str: strs)
      nds.push(nbox(str, nodestyle(xmargin=0.2cm,ymargin=0.1cm)));
  }
  return sml_lead(s ... nds);
}

// sml_class
node sml_class(string name="", string id="", string attribs="", string opers="")
{
  if (id!="")
    name="{\scriptsize $<<$"+id+"$>>$}\par {\bfseries "+name+"}";
  else
    name="\bfseries "+name;
  nodestyle boxstyle=nodestyle(xmargin=0.2cm, ymargin=0.15cm);
  node[] nds = nboxes(boxstyle, minipage2(name), attribs, opers);
  setwidth(... nds);
  return vpack(... nds);
}


