mask = argument0;

if collision_circle(x-asin*(mask*1.5), y+acos*(mask*1.5), 3, obj_walls, true, true) return true;
return false;