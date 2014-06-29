import nodegraph;

// define style
defaultdrawstyle=drawstyle(Arrow(6));

// define nodes
node[] ver=ncircles("$q_0$", "$q_1$", "$q_2$", "$q_3$", "$q_4$", "$q_5$", "$q_6$");
pair[] pos={(0,0), (4,3), (5,-2), (-1,3), (-2,1), (1,-2), (-2,-1)};
real[][] matadj={{1,1,0,0,0,1,1},
  {0,1,0,1,0,0},
  {1,3,1,0,0,1},
  {0,2,0,2,1,0}};

// layout
setpos(ver, pos*1cm);

// generate edges
edge[] edge=genedge(ver, matadj);
edge[edgeind(0,0,matadj)]=(ver[0]..loop(NW,90,1));
edge[edgeind(0,1,matadj)]=(ver[0]--ver[1]).style(drawstyle(p=red+dashed));

// draw nodes and edges
draw(edge);
draw(ver);

