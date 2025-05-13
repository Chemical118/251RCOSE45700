function AttackSlash() {
	// 공격이 막 시작함
	if (sprite_index != spriteAttack)
	{
		// 올바른 애니메이션을 준비하다
		sprite_index = spriteAttack;
		localFrame = 0;
		image_index = 0;
	
		//리스트를 지운다
		if(!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create();
		ds_list_clear(hitByAttack);
	}

	CalcAttack(playerhitbox);

	//스프라이트 업데이트 하기
	PlayerAminateSprite();

	if (animationEnd)
	{
		state = PlayerStateFree;
		animationEnd = false;
	}


}
