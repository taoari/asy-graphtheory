node nodeph; // place holder

bool defaultlayoutrel = true;
real defaultlayoutskip = 1cm;

/////////////////////////////////////////////
// layout
/////////////////////////////////////////////

// layout according to direction
node layout(pair dir, real skip=defaultlayoutskip, bool rel=defaultlayoutrel, node[] nds) {
    if (nds.length < 2)
        return nds[nds.length-1];
        // abort("layout: nds must be of length >=2");

    pair d = skip*unit(dir);
    if (skip != 0) 
        dir = sgn(skip)*dir;
    if (rel == false) {
        for (int i=1; i<nds.length; ++i) {
            nds[i].pos = nds[i-1].pos + d;
        }
    } else {
        for (int i=1; i<nds.length; ++i) {
            nds[i].pos = point(nds[i-1], dir) + d + (nds[i].pos-point(nds[i], -dir));
        }
    }
    return nds[nds.length-1];
}

node layout(pair dir, real skip=defaultlayoutskip, bool rel=defaultlayoutrel ... node[] nds) {
    return layout(dir, skip, rel, nds);
}

// layout according angle
node layout(real angle, real skip=defaultlayoutskip, bool rel=defaultlayoutrel, node[] nds) {
    return layout(dir(angle), skip, rel, nds);
}

node layout(real angle, real skip=defaultlayoutskip, bool rel=defaultlayoutrel ... node[] nds) {
    return layout(dir(angle), skip, rel, nds);
}

// horizontal layout
node hlayout(real skip=defaultlayoutskip, bool rel=defaultlayoutrel, node[] nds) {
    return layout(E, skip, rel, nds);
}

node hlayout(real skip=defaultlayoutskip, bool rel=defaultlayoutrel ... node[] nds) {
    return layout(E, skip, rel, nds);
}

// vertical layout
node vlayout(real skip=defaultlayoutskip, bool rel=defaultlayoutrel, node[] nds) {
    return layout(S, skip, rel, nds);
}

node vlayout(real skip=defaultlayoutskip, bool rel=defaultlayoutrel ... node[] nds) {
    return layout(S, skip, rel, nds);
}

/////////////////////////////////////////////
// grid layout
/////////////////////////////////////////////

// grid layout
node gridlayout(pair grid, bool roworder=true,
        pair xyskip=(defaultlayoutskip, defaultlayoutskip), 
        bool rel=defaultlayoutrel,
        node[] nds) {
    if (grid.x <= 0 && grid.y <= 0)
        abort("gridlayout: grid dimensions at least one to be positive");
    // 0 or negative automatically set dim
    if (grid.x == 0) {
        grid = (ceil(nds.length/grid.y), grid.y);
    } else if (grid.y == 0) {
        grid = (grid.x, ceil(nds.length/grid.x));
    } else if (grid.x * grid.y < nds.length) {
        abort("gridlayout: grid.x * grid.y < nds.length");
    }

    node ref = new node;
    node[] sub;
    int k = 0;

    if (roworder) {
        vlayout(-xyskip.y, rel, nds[0], ref);
        for (int i=0; i<grid.x; ++i) {
            if (k+grid.y <= nds.length)
                sub = nds[k:k+(int)grid.y];
            else
                sub = nds[k:];
            vlayout(xyskip.y, rel, ref, sub[0]);
            hlayout(xyskip.x, rel, sub);
            ref = sub[0];
            k += (int)grid.y;
        }
    } else {
        hlayout(-xyskip.x, rel, nds[0], ref);
        for (int i=0; i<grid.y; ++i) {
            if (k+grid.x <= nds.length)
                sub = nds[k:k+(int)grid.x];
            else
                sub = nds[k:];
            hlayout(xyskip.x, rel, ref, sub[0]);
            vlayout(xyskip.y, rel, sub);
            ref = sub[0];
            k += (int)grid.x;
        }
    }

    return nds[nds.length-1];
}

node gridlayout(pair grid, bool roworder=true,
        pair xyskip=(defaultlayoutskip, defaultlayoutskip), 
        bool rel=defaultlayoutrel ... node[] nds) {
    return gridlayout(grid, roworder, xyskip, rel, nds);
}

// node[][] reshape(pair shape, bool strict=true, node[] nds) {
    // if (shape.x <= 0 && shape.y <= 0)
        // abort("reshape: shape dimensions at least one to be positive");
    // // 0 or negative automatically set dim
    // if (shape.x == 0) {
        // shape = (ceil(nds.length/shape.y), shape.y);
    // } else if (shape.y == 0) {
        // shape = (shape.x, ceil(nds.length/shape.x));
    // } else if (strict && shape.x * shape.y != nds.length) {
        // abort("shape: shape.x * shape.y != nds.length");
    // }
    // node [][] nds2d;
    // for (int i=0; i<shape.x; ++i) {
        // nds2d.push(nds[i*(int)shape.y:(i+1)*(int)shape.y]);
    // }
    // return nds2d;
// }

// gridlayout for 2d array
node gridlayout(pair xyskip=(defaultlayoutskip, defaultlayoutskip), 
        bool rel=defaultlayoutrel, node[][] nds2d) {
    node[] nds = concat(... nds2d);
    pair grid = (nds2d.length, nds2d[0].length);
    bool roworder = true;
    return gridlayout(grid, roworder, xyskip, rel, nds);
}

/////////////////////////////////////////////
// circular layout
/////////////////////////////////////////////

// circular layout
node circularlayout(real radius, pair center=(0,0), real startangle=0, real angleskip=0, 
        node[] nds) {
    if (angleskip == 0)
        angleskip = 360.0/nds.length;
    for (int i=0; i<nds.length; ++i) {
        nds[i].pos = center + radius*dir(startangle+i*angleskip);
    }
    return nds[nds.length-1];
}

node circularlayout(real radius, pair center=(0,0), real startangle=0, real angleskip=0 ...
        node[] nds) {
    return circularlayout(radius, center, startangle, angleskip, nds);
}

/////////////////////////////////////////////
// center layout
/////////////////////////////////////////////

// center layout
node centerlayout(pair dir, node ref=new node, 
        real skip=defaultlayoutskip, bool rel=defaultlayoutrel, node[] nds) {
    layout(dir, skip, rel, nds);
    pair c = (point(nds[0],-dir)+point(nds[nds.length-1],dir))/2;
    pair d = ref.pos - c;
    for (node nd: nds) {
        nd.pos += d;
    }
    return ref;
}

node centerlayout(pair dir, node ref=new node, 
        real skip=defaultlayoutskip, bool rel=defaultlayoutrel ... node[] nds) {
    return centerlayout(dir, ref, skip, rel, nds);
}

node hcenterlayout(node ref=new node, 
        real skip=defaultlayoutskip, bool rel=defaultlayoutrel, node[] nds) {
    return centerlayout(E, ref, skip, rel, nds);
}

node hcenterlayout(node ref=new node, 
        real skip=defaultlayoutskip, bool rel=defaultlayoutrel ... node[] nds) {
    return centerlayout(E, ref, skip, rel, nds);
}

node vcenterlayout(node ref=new node, 
        real skip=defaultlayoutskip, bool rel=defaultlayoutrel, node[] nds) {
    return centerlayout(S, ref, skip, rel, nds);
}

node vcenterlayout(node ref=new node, 
        real skip=defaultlayoutskip, bool rel=defaultlayoutrel ... node[] nds) {
    return centerlayout(S, ref, skip, rel, nds);
}
