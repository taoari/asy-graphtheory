future version:
	* nodemm.asy: for mind map drawing
	* node_edgedraw.asy: styled edge drawing: such spring edge, fancy arrow edge
	* node_drawtype.asy: 3D type
	* node3.asy: 3D draw 

version 3.0:
	* node_edge.asy: struct edge
	* node_dockpack.asy: unified dock, fraction dock, fancy dock, hvdock, pack in one function
	* node_edge.asy: HVH, VHV, HVHd, VHVd
	
version 2.9:
	* wt_string.asy: gettextsize, getminipagesize, minipage2
	* node_pos.asy: flush, samewidth, sameheight
	* node_pack: hpack, vpack
	* nodebox.asy: nbox(size), nbox(width), sbox(style), boxes, hbox, vbox 

version 2.8.1:
	* node_style.asy: gettextheight();
	* nodesml: sml_com, sml_iball
	* example/SML/component.asy

version 2.8:
	* node_label.asy:
	* node_pack.asy;
	* node_style.asy: combine node_shapestyle.asy:nodestyle and node_symbolstyle.asy:symbolstyle, delete the latter file
	* nodesml.asy, nodesml_shape.asy, nodesml_shapestyle.asy

version 2.6:
	* node_basic.asy: middle, interp --> rel
	* node_basic.asy: .point, .angle, .dir --> center according to .pos
	* node_dock.asy: dock, fancydock both with respect to i-th node and f-fraction

version 2.5:
	* style draw developed, function call ambiguious: use only: scircle, sdraw (cirle, draw no longer correct for style draw version);
	* node_drawtype.asy extended to rest argument, and add: InDrawer(pen ... real [])
	* nodecircuit.asy: split file node_circuit.asy into multifiles, in order for future extension.
	* nodecircuit.asy: support circuit style draw: see ./testext/ directory
	* nodecircuit.asy: label position corrected

version 2.2:
	* node_pos.asy rewritten

version 2.0:
	* automatic calculated nodes position
	* style draw initiated
	* extension circuit draw

version 1.0:
	object in plain_module is hard for extension: position embeded in Label, and filltype extension??
	this is a complete new module, aims at great extensionability for drawing graph theory related graphics,
	this version provide a graph theory module for asymptote based on simplenode.asy by AsymptoteByExample, can draw:
	* illustration graphics
	* graph theory graphics
	* flow chart
	* automata

version 0.0
	wt_boxes.asy
	extended the shapes of plain_boxes's envelope shapes: circle, diamond, parallelogram
	simple drawing edge method in AsymptoteByExample

/////////////////////////////////////
file function:

node.asy: basic module for envelope nodes
node_*.asy: implementation
node_pos.asy: automatically calculation
node_*style.asy, wt_style.asy: style draw

nodesymbol_style.asy: module for symbol nodes, will be basic for all future symbol nodes modules

nodecircuit.asy: symbol->circuit module
nodecircuit_*.asy: implementation

/////////////////////////////////////
example/

GraphTheory2:
	basic: manually define nodes position
GraphTheory3:
	automatic calcuate nodes position
GraphTheory4:
	uniform styles, use style drawing

/////////////////////////////////////
testbasic/

basic: envelope node test

///////////////////////////////////////
testext/

symbol node test (illustrated as circuit)


