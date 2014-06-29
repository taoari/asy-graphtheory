import node;

defaultnodestyle=nodestyle(drawfn=RadialShader(yellow,red));

node[] ver=circles("$q_0$", "$q_1$", "$q_2$", "$q_3$", "$q_4$", "$q_5$", "$q_6$");
pair[] pos={(0,0), (4,3), (5,-2), (-1,3), (-2,1), (1,-2), (-2,-1)};

setpos(ver, pos*1cm);

draw(ver);



