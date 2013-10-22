// node position
typedef node possetter(node nd1, node nd2);
typedef node posmaker(node nd1);

posmaker operator<<(node nd1, possetter set)
{
  return new node(node nd2)
  {
    return set(nd1,nd2);
  };
}

node operator<<(posmaker maker, node nd)
{
  return maker(nd);
}

posmaker operator@(node nd1, possetter set)
{
  return new node(node nd2)
  {
    return set(nd1,nd2);
  };
}

node operator@(posmaker maker, node nd)
{
  return maker(nd);
}

// possetter
// possetter: edir
possetter edir(pair dir, real dist)
{
  return new node(node nd1, node nd2)
  {
    nd2.pos=nd1.pos+dist*unit(dir);
    return nd2;
  };
}

// for dismissing dir(30,3cm): dir(int,real) ambiguity
possetter edir(int ang, real dist)
{
  return new node(node nd1, node nd2)
  {
    nd2.pos=nd1.pos+dist*dir((real)ang);
    return nd2;
  };
}

possetter edir(real ang, real dist)
{
  return new node(node nd1, node nd2)
  {
    nd2.pos=nd1.pos+dist*dir(ang);
    return nd2;
  };
}

// possetter: reldir
possetter reldir(pair dir, real dist)
{
  return new node(node nd1, node nd2)
  {
    nd2.pos=nd1.dir(dir)+dist*unit(dir)+(nd2.pos-nd2.dir(-dir));
    return nd2;
  };
}

possetter reldir(int ang, real dist)
{
  return new node(node nd1, node nd2)
  {
    nd2.pos=nd1.angle(ang)+dist*dir(ang)+(nd2.pos-nd2.angle(180-ang));
    return nd2;
  };
}

possetter reldir(real ang, real dist)
{
  return new node(node nd1, node nd2)
  {
    nd2.pos=nd1.angle(ang)+dist*dir(ang)+(nd2.pos-nd2.angle(180-ang));
    return nd2;
  };
}

possetter eleft(real dist)
{
  return edir(W,dist);
}

possetter eright(real dist)
{
  return edir(E,dist);
}

possetter eup(real dist)
{
  return edir(N,dist);
}

possetter edown(real dist)
{
  return edir(S,dist);
}

possetter relleft(real dist)
{
  return reldir(W,dist);
}

possetter relright(real dist)
{
  return reldir(E,dist);
}

possetter relup(real dist)
{
  return reldir(N,dist);
}

possetter reldown(real dist)
{
  return reldir(S,dist);
}

// possetter eleft=eleft(defaultedgedist);
// possetter eright=eright(defaultedgedist);
// possetter eup=eup(defaultedgedist);
// possetter edown=edown(defaultedgedist);
// possetter relleft=relleft(defaultedgedist);
// possetter relright=relright(defaultedgedist);
// possetter relup=relup(defaultedgedist);
// possetter reldown=reldown(defaultedgedist);
//end
