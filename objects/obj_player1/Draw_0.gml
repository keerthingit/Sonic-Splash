draw_sprite_ext(sprp, image_i, x, y, xdir, 1, angle, c_white, 1);
if image_i>998 image_1=0;
if frame>=1 {frame=0; image_i+=1};
if hsp=0 and groundd and action =0
{
	sprp = spr_sonic_stand; last_action=0;
}
if (hsp!=0 or !groundd) and action =0
{
	if last_action=0 image_i=0;
	last_action =1;
	frame+=1/max(8-(abs(hsp)),1)
	if abs(hsp) <10 sprp=spr_sonic_run;
	if abs(hsp) >=10 sprp = spr_sonic_sprint;
}
if action=1 or action=2
{
	frame+=1/max(5-abs(hsp),1);
	sprp=spr_sonic_roll;
}
///peel out
if action=-4
{
	frame+=0.5;
	if spot >=5  sprp = spr_sonic_run;
	if spot < 5 sprp = spr_sonic_sprint;
}
///sprint dash
if action=-2
{
	frame+=0.5;
	if key_space image_i =0;
	sprp=spr_sonic_spin;
}
