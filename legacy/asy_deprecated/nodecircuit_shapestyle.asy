
symbolstyle defaultcircuitlightstyle;

node circuit_light(pair pos=(0,0), Label L="", pair textpos=N,
    symbolstyle style=defaultcircuitlightstyle)
{
  return circuit_light(style.size, pos, L, textpos, style.textpen,
      style.filler, style.indrawer, style.outdrawer);
}

symbolstyle defaultcircuitbatterystyle=symbolstyle(indrawer=InDrawer);

node circuit_battery(pair posalign, pair pos=(0,0), Label L="", 
    pair textpos=rotate(90)*posalign, symbolstyle style=defaultcircuitbatterystyle)
{
  return circuit_battery(posalign, style.size, pos, L, textpos,
      style.textpen, style.indrawer);
}

symbolstyle defaultcircuitswitchstyle;

node circuit_switch(pair openalign, pair pos=(0,0), Label L="",
    pair textpos=openalign, symbolstyle style=defaultcircuitswitchstyle)
{
  return circuit_switch(openalign, style.size, pos, L, textpos,
      style.textpen, style.indrawer);
}
