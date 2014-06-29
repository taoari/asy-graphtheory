import nodesml;

node c1=sml_lead("symbol", sml_lead("", "actor"));
node c2=sml_lead("lead", "plead", "mlead", "nlead");
node c3=sml_lead("", "utility");
node cc=sml_lead("sml", c1, c2, c3);

draw(cc);
