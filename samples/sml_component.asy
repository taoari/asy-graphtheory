import nodesml;

node a=sml_com(":Scheduler");
node b=sml_iball("MakeReservations", S);
node c=sml_com(":Planner");
node d=sml_iball("UpdatePlans", E);
node e=sml_com(":TripGUI");

defaultlayoutskip=2cm;
hlayout(a,b);
vlayout(b,c);
hlayout(c,d,e);

draw(a, b, c, d, e);

draw(a--b, b--c, c--d, d--e);
