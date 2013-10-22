import nodebox;

// define sml_class
node sml_class(string name="", string id="", string attribs="", string opers="")
{
  if (id!="")
    name="{\scriptsize $<<$"+id+"$>>$}\par {\bfseries "+name+"}";
  else
    name="\bfseries "+name;
  nodestyle boxstyle=nodestyle(xmargin=0.2cm, ymargin=0.15cm);
  return vbox(new nodestyle[]{boxstyle}, minipage2(name), attribs, opers);
}

// define nodes
node record=sml_class("Record", "type");
node datah=sml_class("DataHandler", "interface", "", "+PushData(fd:Record)");
node storeh=sml_class("StoreHandler");
node checkh=sml_class("CheckingHandler");
node comph=sml_class("CompositeHandler","","-hdset: DataHandler[]", "+PushData(fd:Record)");
node dbi=sml_class("DataBaseImp");
node cfi=sml_class("CsvFileImp");

// dock, flush and draw nodes
node c1=hdock(1cm, dbi, cfi);
node c2=vdock(2cm, centerat=0, storeh, c1);
node c3=hdock(6cm, flush=N, rel=false, c2, checkh, comph);
node c4=hdock(4cm, centerat=1, record, datah);
node cc=vdock(2cm, c4, c3) @ refresh;
flush(W, dbi, record);
cc @ deepdraw;

// draw edges
drawstyle es2=drawstyle(p=dashed+fontcommand("\ttfamily"), Arrow(SimpleHead));
drawstyle es3=drawstyle(p=dashed, BeginArrow(12,NoFill));
drawstyle es4=drawstyle(BeginArrow(12,NoFill));
(datah--record).l("$<<$use$>>$").style(es2).draw();
(datah--VHVd(1cm)--storeh).style(es3).draw();
(datah--VHVd(1cm)--checkh).style(es3).draw();
(datah--VHVd(1cm)--comph).style(es3).draw();
(storeh--VHVd(1cm)--dbi).style(es4).draw();
(storeh--VHVd(1cm)--cfi).style(es4).draw();
(datah--HV--node(pos=comph^NNE)).draw();

// label
label("*",datah^E,NE);
label("1",comph^NNE,NW);
