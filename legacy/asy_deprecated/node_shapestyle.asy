// use nodestyle
typedef node alias_node_circle_style(Label L, pair pos=(0,0), nodestyle style=defaultnodestyle);

node node_circle_style(Label L, pair pos=(0,0), nodestyle style=defaultnodestyle)
{
  return node_circle(L, pos, style.xmargin, style.ymargin, style.textpen,
      style.drawfn, style.mag, style.factortype);
}

typedef node alias_node_ellipse_style(Label L, pair pos=(0,0), nodestyle style=defaultnodestyle);

node node_ellipse_style(Label L, pair pos=(0,0), nodestyle style=defaultnodestyle)
{
  return node_ellipse(L, pos, style.xmargin, style.ymargin, style.textpen,
      style.drawfn, style.mag, style.factortype);
}

typedef node alias_node_box_style(Label L, pair pos=(0,0), nodestyle style=defaultnodestyle);

node node_box_style(Label L, pair pos=(0,0), nodestyle style=defaultnodestyle)
{
  return node_box(L, pos, style.xmargin, style.ymargin, style.textpen,
      style.drawfn, style.mag);
}

typedef node alias_node_roundbox_style(Label L, pair pos=(0,0), nodestyle style=defaultnodestyle);

node node_roundbox_style(Label L, pair pos=(0,0), nodestyle style=defaultnodestyle)
{
  return node_roundbox(L, pos, style.xmargin, style.ymargin, style.textpen,
      style.drawfn, style.mag);
}

typedef node alias_node_diamond_style(Label L, pair pos=(0,0), nodestyle style=defaultnodestyle);

node node_diamond_style(Label L, pair pos=(0,0), nodestyle style=defaultnodestyle)
{
  return node_diamond(L, pos, style.xmargin, style.ymargin, style.textpen,
      style.drawfn, style.mag, style.factortype);
}

typedef node alias_node_parallelogram_style(Label L, pair pos=(0,0), nodestyle style=defaultnodestyle);

node node_parallelogram_style(Label L, pair pos=(0,0), nodestyle style=defaultnodestyle)
{
  return node_parallelogram(L, pos, style.xmargin, style.ymargin, style.textpen,
      style.drawfn, style.mag, style.factortype);
}

typedef node alias_node_none_style(Label L, pair pos=(0,0), nodestyle style=defaultnodestyle);

node node_none_style(Label L, pair pos=(0,0), nodestyle style=defaultnodestyle)
{
  return node_none(L, pos, style.xmargin, style.ymargin, style.textpen, style.mag);
}

//end

alias_node_circle_style circle=node_circle_style;
alias_node_circle_style scircle=node_circle_style;
alias_node_circle_style sncircle=node_circle_style;

alias_node_ellipse_style ellipse=node_ellipse_style;
alias_node_ellipse_style sellipse=node_ellipse_style;
alias_node_ellipse_style snellipse=node_ellipse_style;

alias_node_box_style box=node_box_style;
alias_node_box_style sbox=node_box_style;
alias_node_box_style snbox=node_box_style;

alias_node_roundbox_style roundbox=node_roundbox_style;
alias_node_roundbox_style sroundbox=node_roundbox_style;
alias_node_roundbox_style snroundbox=node_roundbox_style;

alias_node_diamond_style diamond=node_diamond_style;
alias_node_diamond_style sdiamond=node_diamond_style;
alias_node_diamond_style sndiamond=node_diamond_style;

alias_node_parallelogram_style parallelogram=node_parallelogram_style;
alias_node_parallelogram_style sparallelogram=node_parallelogram_style;
alias_node_parallelogram_style snparallelogram=node_parallelogram_style;

alias_node_none_style snone=node_none_style;
