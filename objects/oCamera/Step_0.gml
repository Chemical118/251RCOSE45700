// 카메라 업데이트
if(instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

// 물건 위치 업데이트
x += (xTo - x) / 15;
y += (yTo - y) / 15;

// 방 안에 카메라가 있어야함

x = clamp(x, viewWidthHalf, room_width-viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height-viewHeightHalf);

//화면 흔들기
x += random_range(-shakeRemain,shakeRemain);
y += random_range(-shakeRemain,shakeRemain);

shakeRemain = max(0, shakeRemain - ((1 / shakeLength) * shakeMagnitude));

camera_set_view_pos(cam ,x - viewWidthHalf, y - viewHeightHalf);
