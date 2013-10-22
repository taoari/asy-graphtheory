// draw_t type
typedef void draw_t(picture pic, path g);

draw_t compose(...draw_t[] drawfns)
{
	return new void(picture pic, path g)
	{
		for (draw_t f: drawfns)
			f(pic,g);
	};
}

draw_t operator+(draw_t drawfn1, draw_t drawfn2)
{
	return compose(drawfn1, drawfn2);
}
// void draw_t
draw_t None=new void(picture pic, path g){};
// draw_t draw
draw_t Drawer(pen p)
{
	return new void(picture pic, path g)
	{
		draw(pic, g, p);
	};
}

draw_t Drawer=Drawer(currentpen);
// draw_t fill
draw_t Filler(pen p)
{
	return new void(picture pic, path g)
	{
		fill(pic, g, p);
	};
}

// draw_t Filler=Filler(currentpen);

// draw_t FillDraw
draw_t FillDrawer(pen fillpen, pen drawpen=currentpen)
{
	return new void(picture pic, path g)
	{
		filldraw(pic, g, fillpen, drawpen);
	};
}

// draw_t DoubleDraw
draw_t DoubleDrawer(pen p, pen bg=white)
{
	return new void(picture pic, path g)
	{
		draw(pic, g, p+3*linewidth(p));
		draw(pic, g, bg+linewidth(p));
	};
	//return compose(Drawer(p+linewidth(p)*3), Drawer(bg+linewidth(p));
	// first draw with 3 linewidth, then recover draw with pen bg of 1 linewidth
}

draw_t DoubleDrawer=DoubleDrawer(currentpen);
// draw_t Shadow
draw_t Shadower(pair shift=2SE, real scale=1, pen color=gray)
{
	return new void(picture pic, path g)
	{
		picture pic2;
		fill(pic2, shift(shift)*scale(scale)*g, color);
		unfill(pic2, g);
		add(pic, pic2);
	};
}

draw_t Shadower=Shadower();
// draw_t RadialShader
draw_t RadialShader(pen penc, pen penr)
{
	return new void(picture pic, path g)
	{
		pair c=(min(g)+max(g))/2;
		radialshade(pic,g,penc,c,0,penr,c,abs(max(g)-min(g))/2);
	};
}

