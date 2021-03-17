mask = argument0;

if collision_circle(x-asin*mask, y-acos*mask, 3, obj_walls, true, true) return true;
return false;