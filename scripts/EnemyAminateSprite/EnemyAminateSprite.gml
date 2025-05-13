function EnemyAminateSprite() {
	// 스프라이트 업데이트
	var _totalFrames = sprite_get_number(sprite_index) / 4;
	image_index = localFrame + (CARDINAL_DIR * _totalFrames); 
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;

	// 다음에도 스프라이프가 루프에 걸린 경우
	if( localFrame >= _totalFrames)
	{
		animationEnd = true;
		localFrame= 0;
	}
	else animationEnd = false;


}
