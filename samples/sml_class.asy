import nodesml;

// define nodes
node record=sml_class("Record", "type");
node datah=sml_class("DataHandler", "interface", "", "+PushData(fd:Record)");
node storeh=sml_class("StoreHandler");
node checkh=sml_class("CheckingHandler");
node comph=sml_class("CompositeHandler","","-hdset: DataHandler[]", "+PushData(fd:Record)");
node dbi=sml_class("DataBaseImp");
node cfi=sml_class("CsvFileImp");

// layout
hlayout(1cm, dbi, cfi);
vlayout(-2cm, middlen(dbi, cfi), storeh);
hlayout(2cm, storeh, checkh, comph);
flush(N, storeh, checkh, comph);
vlayout(-3cm, middlen(storeh, checkh, comph), datah);
hlayout(-1cm, datah, record);
flush(W, dbi, record);

draw(dbi, cfi, storeh, checkh, comph, datah, record);

// draw edges
drawstyle es2=drawstyle(p=dashed+fontcommand("\ttfamily"), Arrow(SimpleHead));
drawstyle es3=drawstyle(p=dashed, BeginArrow(12,NoFill));
drawstyle es4=drawstyle(BeginArrow(12,NoFill));

draw(
    (datah--record).l("$<<$use$>>$").style(es2),
    (datah--VHVd(1cm)--storeh).style(es3),
    (datah--VHVd(1cm)--checkh).style(es3),
    (datah--VHVd(1cm)--comph).style(es3),
    (storeh--VHVd(1cm)--dbi).style(es4),
    (storeh--VHVd(1cm)--cfi).style(es4),
    (datah--HV--node(pos=comph^NNE))
);


// label
label("*",datah^E,NE);
label("1",comph^NNE,NW);
