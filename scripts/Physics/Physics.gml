///limits to speed
if (hsp > hsp1) hsp = hsp1;
if (hsp <-hsp1) hsp =-hsp1;
if (vsp > vsp1) vsp = vsp1;
/// horizontal movement 
if hsp > 0 
{
	for(i=0;i<hsp and !collision_right(16); i+=1)
	{
		x+=acos;
		y-=asin;
	}
}
if hsp < 0 
{
	for(i=0;i>hsp and !collision_left(16); i-=1)
	{
		x-=acos;
		y+=asin;
	}
}
/// vertical movement
if vsp > 0 
{
	for(i=0; i<vsp and !collision_bottom(16); i+=1)
	{
		y+=1;
	}
}
if vsp < 0 
{
	for(i=0; i>vsp and !collision_top(16); i-=1)
	{
		y-=1;
	}
}
/// landing
if vsp>=0 and !groundd and collision_bottom(16) and (collision_leftline(16) or collision_rightline(16))
{
	angle = Find_angle(angle, 10, 16);
	acos = cos(degtorad(angle));
	asin = sin(degtorad(angle));
	vsp=0;
	groundd=true;
}
///lock to groundd
if groundd
	{
		while collision_main(16)
		{x-=asin; y-=acos;}
		while (collision_ground(16) and !collision_main(16))
		{x+=asin; y+=acos;}
	}
///wall collision
while(collision_right(16))
{
	x-=acos;
	y+=asin;
}
while(collision_left(16))
{
	x+=acos;
	y-=asin;
}
///leave groundd
if (!collision_leftline(16) or !collision_rightline(16)) and groundd
{
	groundd = false;
}
//gravity
if !groundd vsp+=grv;

///angle speed
if angle >70 and angle < 290 and abs(hsp) < 2.5
{
	angle = 0;
	vsp = -(asin*hsp);
	hsp = (acos*hsp);
	groundd = 0;
}
///slope factor
if action = 0 slp=0.125;;
if action = 2 {if sign(hsp) = sign(asin) slp=0.078; if sign(hsp) != sign(asin) slp=0.312;}
if action >=0 hsp-=slp*asin;
if groundd and collision_leftline(16) and collision_rightline(16)
{
	angle= Find_angle(angle,16,24);
}
else
{
	angle=0;
}
acos= cos(degtorad(angle));
asin= sin(degtorad(angle));


