///setup camera
cam = view_camera[0];
follow = obj_player1;
view_w_half = camera_get_view_width(cam)*0.5;
view_h_half = camera_get_view_height(cam)*0.5;
xTo = xstart;
yTo = ystart;
audio_play_sound(Levels, 1000,true);

timer= room_speed*60/2