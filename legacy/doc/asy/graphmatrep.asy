import nodegraph;

node[] ver=circles("$q_0$", "$q_1$", "$q_2$", "$q_3$", "$q_4$", "$q_5$", "$q_6$");
pair[] pos={(0,0), (4,3), (5,-2), (-1,3), (-2,1), (1,-2), (-2,-1)};
real[][] matadj={{1,1,0,0,0,1,1},
  {0,1,0,1,0,0},
  {1,3,1,0,0,1},
  {0,2,0,2,1,0}};

setpos(ver, pos*1cm);

edge[] edge=genedge(ver, matadj);
edge[edgeind(0,0,matadj)].g=(ver[0]..loop(NW,90,1)).g;
edge[edgeind(0,1,matadj)]=(ver[0]--ver[1]).style(drawstyle(p=red+dashed));

draw(edge);
draw(ver);

