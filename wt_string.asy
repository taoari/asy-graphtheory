////////////////////////////////////////////
// default text size
pair gettextsize(Label L)
{
  picture pic;
  label(pic, L);
  pair M=max(pic), m=min(pic), D=M-m;
  return D;
}

real gettextheight(Label L) { return gettextsize(L).x; }

pair getminipagesize(string s)
{
  picture pic;
  string[] lines=split(s, "\par ");
  pair M, m, D;
  real w=0, h=0;
  for (string line: lines)
  {
    label(pic, line);
    M=max(pic); m=min(pic); D=M-m;
    w=max(w, D.x);
    h=max(h, D.y);
  }
  real dw=3pt;
  return (w-dw,h);
}

real defaulttextheight=gettextheight("e");

string minipage2(string s, real width=100bp, bool smart=true, align flush=(0,0))
{
  if (smart)
  {
    real wreal=getminipagesize(s).x;
    if (wreal < width)
      width=wreal;
  }
  string flushstring;
  if (flush.dir==W)
    flushstring="\flushleft ";
  else if (flush.dir==E)
    flushstring="\flushright ";
  else
    flushstring="\centering ";
  return "\begin{minipage}{"+(string) (width/pt)+"pt}"+flushstring+s+"\end{minipage}"; 
}
