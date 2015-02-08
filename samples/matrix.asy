import node;

Label[][] strs = {
    {"$a_{0,0}$", "$\cdots$", "$a_{0,n}$"},
    {"$\vdots$", "$\ddots$", "$\vdots$"},
    {"$a_{m,0}$", "$\cdots$", "$a_{m,n}$"}};
node[][] n2d = node(strs);

gridlayout((3,3), concat(...n2d));

draw(n2d);
