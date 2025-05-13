/// 공격의 히트박스를 확인하고, 히트를 확인한다
function CalcAttack(argument0) {
	mask_index = argument0;
	var _hitByAttackNow = ds_list_create();
	var _hits = instance_place_list(x,y,pEntity,_hitByAttackNow, false);
	if (_hits > 0)
	{
		for (var i = 0 ; i < _hits ; i++)
		{
			//만약 이 물건이 아직 맞지 않았다면 때려라!
			var _hitID = _hitByAttackNow[| i]; // = ds_list_find_value(_hitByAttackByNow,i);
			if (ds_list_find_index(hitByAttack, _hitID) == -1)
			{
				ds_list_add(hitByAttack, _hitID);
				with(_hitID)
				{
					if(entityHitScript != -1) script_execute(entityHitScript);
					if (entityEnemy == true){
					direction = point_direction(other.x,other.y, x, y);
					var _xmove = lengthdir_x(15, direction);
					var _ymove = lengthdir_y(15, direction);
					if(tilemap_get_at_pixel(collisionMap, x + _xmove, y))
					{
						while(!tilemap_get_at_pixel(collisionMap, x + sign(_xmove) , y)) x += sign(_xmove);
						_xmove = 0;
					}
					x += _xmove;
					if(tilemap_get_at_pixel(collisionMap, x , y + _ymove))
					{
						while(!tilemap_get_at_pixel(collisionMap, x , y + sign(_ymove))) y += sign(_ymove);
						_ymove = 0;
					}
					y += _ymove;
					if(global.HaveSkill == false) HP--;
					else HP -= global.SkillDamage;
					}
				}
			}
		}
	}

	ds_list_destroy(_hitByAttackNow);


}
