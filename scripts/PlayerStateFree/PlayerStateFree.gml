function PlayerStateFree() {
	//움직임
	hSpeed = lengthdir_x(inputMagnitude * speedwalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedwalk, inputDirection);
	PlayerCollision();
	//스프라이트 주소 바꾸기
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0)
	{
		direction = inputDirection;
		sprite_index = spriteRun;
	}
	else sprite_index = spriteIdle;
	if(_oldSprite != sprite_index) localFrame = 0;
	//사진 인덱스 바꾸기
	PlayerAminateSprite();
	//공격키 설정
	if(keyAttack)
	{
		state = PlayerStateAttack;
		stateAttack = AttackSlash;
	}
	// 스킬 설정
	if ( StopFrame != 0)
	{
		if ( (global.SkillCool - StopFrame) < 30) sprite_index = spriteSkill;
		else sprite_index = spriteIdle;
		StopFrame--;
	}
	if ( StopFrame == 0 && HaveSkill && keySkill)
	{
		with(instance_create_layer(x,y,"Instances",PlayerSkill))
		{
			speed = global.SkillSpeed;
			direction = point_direction(other.x,other.y,mouse_x,mouse_y);
			image_angle = direction;
			other.StopFrame = global.SkillCool;
		}
	}
	//활성화 키 규칙
	if (keyActivate)
	{
		// 활성화 시킬 물건이 있는가?
		// 아무것도 없거나 할게 없으면 구르면 된다!
		// 스크립트가 있으면 실행시키자!
		// NPC가 있으면 우리를 쳐다보게 만들자!      
		var _activateX = lengthdir_x(10, direction);
		var _activateY = lengthdir_y(10, direction);
		activate = instance_position(x + _activateX , y + _activateY, pEntity);
		if(ShieldHave == true &&  (activate == noone || activate.entityActivateScript == -1))
		{
			state = PlayerStateRoll;
			moveDistanceRemaining = distanceRoll;	
		}                                
		else if (!(activate == noone || activate.entityActivateScript == -1))
		{
			// 몹을 구연하다
			ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
			// NPC가 플레이어를 쳐다보게 만들자
			with(activate)
			{
				direction = point_direction(x,y,other.x,other.y);
				image_index = CARDINAL_DIR;
			}
		}
	}


}
