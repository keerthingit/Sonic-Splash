Physics();
///controls 
key_down = keyboard_check(vk_down);
key_up = keyboard_check(vk_up);
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_space = keyboard_check_pressed(vk_space);
key_release = keyboard_check_released(vk_space);
///direction
if action= 0
{
	if key_left xdir=-1;
	if key_right xdir=1;
}
///air drag 
if vsp<0 and vsp>-4
{
	if abs(hsp)>=0.125{hsp=hsp*adrag};
}
///movement
if (action=0 or action=1)
{
	if groundd {
		if key_right
		{if hsp>=0 {if hsp<hspm hsp+=acc} else hsp+=dcc;}
		if key_left
		{if hsp<=0 {if hsp>-hspm hsp-=acc} else hsp-=dcc;}
		if !key_right and !key_left
		{if hsp>0 hsp-=frc; if hsp < 0 hsp+=frc; if hsp <=frc and hsp >=-frc hsp=0;}
	}
	else
	{
		if key_right
		{if hsp>=0 {if hsp<hspm hsp+=acc*2}}
		if key_left
		{if hsp<=0 {if hsp>-hspm hsp-=acc*2}}
		if !key_right and !key_left
		{if hsp>0 hsp-=frc; if hsp < 0 hsp+=frc; if hsp <=frc and hsp >=-frc hsp=0;}
	}
}
if action = 2
{
	if groundd 
	{
		if hsp> bfr {hsp-=bfr; if key_left hsp-=bdcc}
		if hsp<-bfr {hsp+=bfr; if key_right hsp+=bdcc}
		if hsp <bfr and hsp>-bfr hsp=0;
	}
	else
	{
		if key_right
		{if hsp>=0 {if hsp<hspm hsp+=acc*2}}
		if key_left
		{if hsp<=0 {if hsp>-hspm hsp-=acc*2}}
	}
}
///h movement
if key_right
{
	if hsp>=0 {if hsp<hspm hsp+=acc} else hsp+=dcc; ///left clicked, acc is added to hsp
}
if key_left
{
	if hsp<=0 {if hsp>-hspm hsp-=acc} else hsp-=dcc;
}
if !key_left and !key_right
{
	if hsp > 0 hsp-=frc;
	if hsp < 0 hsp+=frc;
	if hsp <=frc and hsp >=-frc hsp=0;
}

//jumping
if key_space and groundd and (action =0 or action =2)
{
	groundd = 0;
	vsp = acos*jmp;
	hsp = asin*jmp;
	angle = 0;
	acos=1;
	asin=0;
	action =1;
}
///smalll jump	
if key_release and vsp< sjmp and action=1
{
	vsp=sjmp;
}
///landing
if groundd and (action =1)
{action =0;}

///rolling ducking
if key_down and groundd and action =0
{
	if abs(hsp)<1.03 {hsp=0; action = -1;}
	if abs(hsp)>=1.03 {action = 2;}
} 
if action=-1 and !key_down{action=0;}///unduck
if action =2 and abs(hsp)<0.5 and groundd {action = 0;}//unroll
if action =2 and vsp> 0 and !groundd and collision_ground(14) {action=0;}//un roll on grounddd
///looking
if key_up and groundd and action=0
{
	if abs(hsp) <0.2 {hsp=0; action=-3}
}
if (!key_up or !groundd or !key_left or !key_right) and action=-3 action=0;
///peel out
if action=-3 and key_space action =-4;
if action!=-4 spot =30;

if action=-4
{
	if key_release
	{
		action=0; if spot=0 {hsp=xdir*12;}
	}
	if spot!=0 spot-=1;
}
///spin
if sp>0 {sp = sp-((sp div 1)/265)}
if sp>64 sp=64;
if action = -2 and key_space{sp+=8;}
if action = -2 and !key_down {hsp = xdir*8+(xdir*floor(sp)/8); action =2; sp=0;}
if action = -1 and key_space{sp=0;action=-2;}

if keyboard_check_pressed(vk_alt)
{
	room_goto_next();
}
if keyboard_check_pressed(vk_control)
{
	show_message("Paused")
}