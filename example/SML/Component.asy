import nodesml;

node a=sml_com(":Scheduler");
node b=sml_iball(S, "MakeReservations");
node c=sml_com(":Planner");
node d=sml_iball(E, "UpdatePlans");
node e=sml_com(":TripGUI");

real u=2cm, v=2cm;
vdock(v,
    hdock(u, centerat=-1, a, b),
    hdock(u, centerat=0, c, d, e)) @ refresh @ deepdraw;

sdraw(a--b, b--c, c--d, d--e);
