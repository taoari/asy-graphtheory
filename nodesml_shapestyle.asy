
symbolstyle defaultsmlactorstyle=symbolstyle(outdrawer=None);

node sml_actor(pair pos=(0,0), Label L="", pair textpos=S, symbolstyle style=defaultsmlactorstyle)
{
  return sml_actor(style.size, pos, L, textpos, style.xmargin, style.ymargin, style.textpen, 
      style.filler, style.indrawer, style.outdrawer);
}

symbolstyle defaultsmlcomstyle=symbolstyle(size=gettextheight("e"), xmargin=0.1cm, textpen=currentpen+fontcommand("\bfseries"));

node sml_com(pair pos=(0,0), Label L="", pair textpos=W, symbolstyle style=defaultsmlcomstyle)
{
  return sml_com(style.size, pos, L, textpos, style.xmargin, style.ymargin, style.textpen, 
      style.filler, style.indrawer, style.outdrawer);
}

symbolstyle defaultsmliballstyle;

node sml_iball(pair align, pair pos=(0,0), Label L="", pair textpos=rotate(90)*align, symbolstyle style=defaultsmliballstyle)
{
  return sml_iball(align, style.size, pos, L, textpos, style.textpen, style.indrawer);
}
