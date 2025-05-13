function PlayerStateRoll() {
	// 움직임
	hSpeed = lengthdir_x(speedRoll, direction);
	vSpeed = lengthdir_y(speedRoll, direction);

	moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);
	var _collided = PlayerCollision();

	// 스프라이트 업데이트
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1 - (moveDistanceRemaining / distanceRoll)) * _totalFrames));

	// 상태 바꾸기 
	if (moveDistanceRemaining <= 0) state = PlayerStateFree;

	if(_collided) 
	{
		state = PlayerStateFree;
		ScreenShake(8,30);
	}


}
