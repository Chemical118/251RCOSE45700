if(HP <= 0 || StopFrame != 0)
{
	if (HP <= 0 && sprite_index != Die)
	{
		sprite_index = Die;
		StopFrame = sprite_get_number(sprite_index) * DieTime;
	}
	if (HP <= 0 && StopFrame == 0) instance_destroy();
	if(sprite_index == Die ) image_index = (StopFrame / DieTime) - 1;
	StopFrame--;
}
else
{
	TargetX = oPlayer.x - x; 
	TargetY = oPlayer.y - y;
	var _direction = point_direction(0,0,TargetX,TargetY);
	var _targetX = lengthdir_x(EnemySpeed, _direction);
	var _targetY = lengthdir_y(EnemySpeed, _direction);
	var _collision = false;
	// 수평의 충돌
	if(tilemap_get_at_pixel(collisionMap, x + _targetX, y))
	{
		x -= x mod TILE_SIZE;
		if (sign(_targetX) == 1) x += TILE_SIZE - 1;
		_targetX = 0;
		_collision = true;
	}
	// 수직의 충돌
	if(tilemap_get_at_pixel(collisionMap, x, y + _targetY))
	{
		y -= y mod TILE_SIZE;
		if (sign(_targetY) == 1) y += TILE_SIZE - 1;
		_targetY = 0;
		_collision = true;
	}
	if( abs(TargetX) < EnemySpeed ) {_targetX = 0; x = oPlayer.x;}
	if( abs(TargetY) < EnemySpeed ) {_targetY = 0; y = oPlayer.y;}
	var _distance = TargetX * TargetX + TargetY * TargetY;
	if ( _distance < ShortAttackLength)
	{
		global.hp -= entityDamage;
		ScreenShake(5,30);
		direction = point_direction(0,0,TargetX,TargetY);
		image_angle = CARDINAL_DIR;
		var _xmove = lengthdir_x(30, direction);
		var _ymove = lengthdir_y(30, direction);
	  	with(oPlayer){
		var _x = x;
		var _y = y;
		while(!tilemap_get_at_pixel(collisionMap, x + sign(_xmove) , y))
		{
			if( abs(x - _x) >= abs(_xmove) ) break; 
			x += sign(_xmove);
		}
		while(!tilemap_get_at_pixel(collisionMap, x , y + sign(_ymove)))
		{
			if( abs(y - _y) >= abs(_ymove) ) break; 
			y += sign(_ymove);
		}
		}
		StopFrame = StunTime;
	}
	else if  (AttackFrame != 0)
	{
		direction = point_direction(0,0,TargetX,TargetY);
		image_index = CARDINAL_DIR;
		if(EnemyReload -  AttackFrame == 25)  sprite_index = Idle;
		AttackFrame--;
	}
	else if( _distance <  ReactionLength && AttackFrame == 0)
	{
		sprite_index = Attack;
		direction = point_direction(0,0,TargetX,TargetY);
		with(instance_create_layer(other.x,other.y,"Instances", ObjectShot))
		{
			speed = other.BulletSpeed;
			direction = point_direction(0,0,other.TargetX,other.TargetY);
			image_angle = direction;
		}
		AttackFrame = EnemyReload;
	}
	if( AttackLength <  _distance  && _distance < ReactionLength)
	{
		if (tilemap_get_at_pixel(collisionMap, x + _targetX , y))
		{
			while(!tilemap_get_at_pixel(collisionMap, x + sign(_targetX) , y)) x += sign(_targetX);
			_targetX = 0;
		}
		if (tilemap_get_at_pixel(collisionMap, x , y + _targetY ))
		{
			while(!tilemap_get_at_pixel(collisionMap, x , y + sign(_targetY) )) y += sign(_targetY);
			_targetY = 0;
		}
		var _oldSprite = sprite_index;
		if(_oldSprite != sprite_index) localFrame = 0;
		EnemyAminateSprite();
		x += _targetX
		y += _targetY; 
	}
	else
	{
		sprite_index = Idle;
		direction = point_direction(0,0,TargetX,TargetY);
		image_index = CARDINAL_DIR;
	}
}