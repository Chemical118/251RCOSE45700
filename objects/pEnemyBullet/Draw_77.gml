if (tilemap_get_at_pixel(collisionMap, x, y)) instance_destroy();
else if (place_meeting(x,y,oPlayer))
{
	ScreenShake(5,30);
	global.hp -= Damage;
	instance_destroy();
}

 	