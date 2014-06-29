// Labelstyle
struct labelstyle{
  align align=NoAlign;
  pen p=nullpen;
  embed embed=Rotate;
  filltype filltype=NoFill;

  void operator init(align align=NoAlign, pen p=nullpen, 
      embed embed=Rotate, filltype filltype=NoFill)
  {
    this.align=align;
    this.p=p;
    this.embed=embed;
    this.filltype=filltype;
  }
};

// label style
labelstyle defaultlabelstyle;

// use label style
void slabel(picture pic=currentpicture, Label L, pair position,
    labelstyle style=defaultlabelstyle)
{
  label(pic, L, position, style.align, style.p, style.filltype);
}

void slabel(picture pic=currentpicture, Label L, path g,
    labelstyle style=defaultlabelstyle)
{
  label(pic, L, g, style.align, style.p, style.filltype);
}

///////////////////////////////////////
// drawstyle
// definition drawstyle
struct drawstyle{
  labelstyle sL;			// for default construct
  align align=NoAlign;
  pen p=currentpen;
  arrowbar arrow=None;
  arrowbar bar=None;
  margin margin=NoMargin;
  Label legend="";
  marker marker=nomarker;
  
  // for construct with specified part style
  void operator init(labelstyle sL=new labelstyle, 
     align align=NoAlign, pen p=currentpen,
     arrowbar arrow=None, arrowbar bar=None, margin margin=NoMargin,
     Label legend="", marker marker=nomarker)
  {
    this.sL=sL;
    this.align=align;
    this.p=p;
    this.arrow=arrow;
    this.bar=bar;
    this.margin=margin;
    this.legend=legend;
    this.marker=marker;
  }
};

drawstyle copy(drawstyle style)
{
  return drawstyle(style.sL, style.align, style.p, style.arrow, 
      style.bar, style.margin, style.legend, style.marker);
}

// drawstyle
drawstyle defaultdrawstyle;
drawstyle defaultdrawstyleleft=drawstyle(align=LeftSide);

// use drawstyle
// style_fancy_draw: style_draw
typedef void alias_style_fancy_draw(picture pic=currentpicture, Label L="", path g,
    drawstyle style=defaultdrawstyle);

void style_fancy_draw(picture pic=currentpicture, Label L="", path g,
    drawstyle style=defaultdrawstyle)
{
  labelstyle sL=style.sL;
  // only use sL.pen, sL.filltype
  // L.align, L.embed in effect, other set to default
  // note if style.align!=NoAligan, L.align will not have effect
  draw(pic, Label(L, align=L.align, p=sL.p, embed=L.embed, filltype=sL.filltype), g, style.align, style.p, style.arrow, style.bar, 
      style.margin, style.legend, style.marker);
}
// style_string_draw
typedef void alias_style_string_draw(picture pic=currentpicture, string s="", path g,
    drawstyle style=defaultdrawstyle);

void style_string_draw(picture pic=currentpicture, string s="", path g,
    drawstyle style=defaultdrawstyle)
{
  labelstyle sL=style.sL;
  draw(pic, Label(s,sL.align,sL.p,sL.embed,sL.filltype), 
      g, style.align, style.p, style.arrow, style.bar, 
      style.margin, style.legend, style.marker);
}
// style_label_draw
typedef void alias_style_label_draw(picture pic=currentpicture, Label L="", path g,
    drawstyle style=defaultdrawstyle);

void style_label_draw(picture pic=currentpicture, Label L="", path g,
    drawstyle style=defaultdrawstyle)
{
  labelstyle sL=style.sL;
  draw(pic, L, g, style.align, style.p, style.arrow, style.bar, 
      style.margin, style.legend, style.marker);
}

// rest draw
typedef void alias_style_draw_arr(picture pic=currentpicture, Label L="", path []garr,
    drawstyle style=defaultdrawstyle);

void style_draw_arr(picture pic=currentpicture, Label L="", path []garr,
    drawstyle style=defaultdrawstyle)
{
  labelstyle sL=style.sL;
  for (path g: garr)
    draw(pic, Label(L,sL.align,sL.p,sL.embed,sL.filltype), 
	g, style.align, style.p, style.arrow, style.bar, 
	style.margin, style.legend, style.marker);
}

typedef void alias_style_draw_rest(picture pic=currentpicture, Label L="",
    drawstyle style=defaultdrawstyle ... path []garr);

void style_draw_rest(picture pic=currentpicture, Label L="",
    drawstyle style=defaultdrawstyle ... path []garr)
{
  style_draw_arr(pic, L, garr, style);
}

alias_style_fancy_draw sdraw=style_fancy_draw;
alias_style_string_draw ssdraw=style_string_draw;
alias_style_label_draw sldraw=style_label_draw;

// alias_style_draw_arr draw=style_draw_arr;
alias_style_draw_arr sdraw=style_draw_arr;
// alias_style_draw_arr adraw=style_draw_arr;

// alias_style_draw_rest draw=style_draw_rest;
alias_style_draw_rest sdraw=style_draw_rest;
// alias_style_draw_rest rdraw=style_draw_rest;
