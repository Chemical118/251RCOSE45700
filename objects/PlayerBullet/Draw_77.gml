if (tilemap_get_at_pixel(collisionMap, x, y)) instance_destroy();
else if (place_meeting(x,y,pEntity))
{
	with (instance_place(other.x,other.y,pEntity))
	{
		if(entityEnemy = true)
		{
			HP -= global.SkillDamage;
			ScreenShake(3,30);
		}
		flash = 0.5;
	}
	instance_destroy();
}


 	