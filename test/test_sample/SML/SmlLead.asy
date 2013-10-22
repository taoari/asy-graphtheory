import nodebox;

node sml_lead(string s ... node[] nds)
{
  nodestyle boxstyle=nodestyle(xmargin=0.2cm, ymargin=0.1cm);
  node body=hpack(flush=S, skip=0.2cm, xmargin=0.3cm, ymargin=0.2cm, drawfn=Drawer ... nds);
  s="\bfseries "+s;
  pair D=gettextsize(s);
  real refh=gettextsize("e").y;
  node lead=sbox((max(0.5cm,D.x), max(refh, D.y)), s, boxstyle);
  return vpack(flush=W, lead, body);
}

node sml_lead(string s ... string[] strs)
{
  nodestyle nonestyle;
  nodestyle boxstyle=nodestyle(xmargin=0.2cm, ymargin=0.1cm);
  node[] nds;
  if (strs.length==1)
    nds.push(snone(strs[0], nonestyle));
  else
  {
    for (string str: strs)
      nds.push(sbox(str, boxstyle));
  }
  return sml_lead(s ... nds);
}

node c1=sml_lead("symbol", sml_lead("", "actor"));
node c2=sml_lead("lead", "plead", "mlead", "nlead");
node c3=sml_lead("", "utility");
node cc=sml_lead("sml", c1, c2, c3);

draw(cc);
