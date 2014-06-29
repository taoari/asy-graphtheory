// require wt_arcs:diamond
// require wt_style: drawstyle

include node_basic; 		
// struct node, basic operation, draw node
include node_drawtype; 	
// draw type: Drawer, Filler, FillDrawer, DoubleDrawer, RadialShader, 
// draw type: InDrawer
include node_shape;		
// basic shape: circle, ellipse, box(rectangle), roundbox, diamond, parallelogram
// private import wt_arcs;

include node_edge;
// edgeconnector, function on edge path

include node_pos;
// auto calculate nodes positon
// <<edir<<, <<reldir<<
// boundbox
// flush, samewidth, sameheight
include node_dockpack; // depend on node_pos
// auto dock nodes: calcualte node position, and generated new node of bounding box
// (integer|fraction)(fancy|nonfancy)(general|h|v)(dock|pack)
include node_label;
// label nodes: labelin, label

include node_style;
// nodestyle, symbolstyle
include node_shapestyle;
import wt_style;
// edgestyle: drawstyle

// include node_circuit; 
// circuit shape: light, battery, switch

// to use function, use: 
// import library;

// only for implementation, use: 
// private import library;

// utility
import wt_string;
// gettextsize, getminipagesize
// minipage2(string s, real width=100bp, bool smart=true, pair flush=(0,0))

// util functions: bb (boundbox), setpos, circles
include node_util;


