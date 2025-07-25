function EnemyCollision() {
	var _collision = false;

	// 수평의 충돌
	if(tilemap_get_at_pixel(collisionMap, x + hSpeed, y))
	{
		x -= x mod TILE_SIZE;
		if (sign(hSpeed) == 1) x += TILE_SIZE - 1;
		hSpeed = 0;
		_collision = true;
	}

	// 수평의 움직임
	x += hSpeed;

	// 수직의 충돌
	if(tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
	{
		y -= y mod TILE_SIZE;
		if (sign(vSpeed) == 1) y += TILE_SIZE - 1;
		vSpeed = 0;
		_collision = true;
	}

	// 수직의 움직임
	y += vSpeed;


	return _collision;


}
