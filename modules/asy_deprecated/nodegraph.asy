import node;

edge[] genedge(node[] ver, real[][] matadj, real bendang=15, drawstyle estyle=drawstyle(Arrow(6)))
{
  int n=ver.length;
  edge[] es; edge e;
  for (int i=0; i<matadj.length; ++i)
  {
    // write(matadj[i].length);
    for (int j=0; j<matadj[i].length; ++j)
      if (i>=n || j>=n)
	abort("genedge: matadj row or col length is larger than vertex number");
      else if (matadj[i][j]!=0)
      {
	if (i==j)
	{
	  boundbox bb=bb(ver);
	  pair loopdir=unit(ver[i].pos-(bb.m+bb.M)/2);
	  if (loopdir==(0,0)) loopdir=W; // in case of loopdir==(0,0)
	  e=ver[i]..loop(loopdir, 90, 1);
	}
	else
	  e=ver[i]..bend(bendang)..ver[j];
	e.l(string(matadj[i][j]));
	e.style(estyle);
	es.push(e);
      }
  }
  return es;
}

// problem: modify special edge with input (i,j)
int edgeind(int i, int j, real[][] matadj)
{
  int k=0;
  for (int s=0; s<matadj.length; ++s)
    for (int t=0; t<matadj[s].length; ++t)
      if (s==i && t==j)
	return k;
      else if (matadj[i][j]!=0)
	++k;
  abort("no edge from vertex i to j, or (i,j) out of matadj range");
  return 0;
}
