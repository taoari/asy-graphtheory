node labelin(Label L, node nd, pair dir, align align=dir, pen p=nullpen, filltype filltype=NoFill)
{
  label(nd.stuff,L,nd.point(dir), align, p, filltype);
  return nd;
}

void label(picture pic=currentpicture, Label L, node nd, pair dir, align align=dir, pen p=nullpen, filltype filltype=NoFill)
{
  label(pic, L, nd.point(dir), align, p, filltype);
}
