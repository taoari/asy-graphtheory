guide star(int n = 5, real angle = 90, real r = 0)
{
	guide unitstar;
	if (n < 2) return nullpath;
	real theta = 180/n;
	if (r == 0) {
		if (n < 5)
			r = 1/3; // for n=3,4
		else
			r = Cos(2theta) / Cos(theta);
	}
	for (int k = 0; k < n; ++k)
		unitstar = unitstar -- dir(angle+2k*theta) -- r * dir(angle+(2k+1)*theta);
	unitstar = unitstar -- cycle;
	return unitstar;
}

path diamond(pair center=(0,0), real rx=1, real ry=rx)
{
	return center+(rx,0)--center+(0,ry)--center-(rx,0)--center-(0,ry)--cycle;
}