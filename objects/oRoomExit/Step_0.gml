 /// @desc 방을 옯기는데 영향을 준다
var _boolcheck = (instance_exists(oPlayer)) && (position_meeting(oPlayer.x , oPlayer.y , id));

if ( (RightDIrection == false || global.KillBoss == true) && _boolcheck)
{
	global.targetRoom = targetRoom;
	global.targetX = targetX;
	global.targetY = targetY;
	global.targetDirection = oPlayer.direction;
	audio_stop_all();
	if(targetRoom == 3) audio_play_sound(FaronWood,1000,true);
	if(targetRoom == 4) audio_play_sound(Cave,1000,true);
	if(targetRoom == 5) audio_play_sound(desert,1000,true);
	if(targetRoom == 6) audio_play_sound(beach,1000,true);
	if(targetRoom == 8) audio_play_sound(D,1000,true);
	if(targetRoom == 9) audio_play_sound(secret,1000,true);
	if(targetRoom == 12) audio_play_sound(Gameover,1000,true);
	if(targetRoom == 13) audio_play_sound(Ending,1000,true);
	global.KillBoss = false;
	room_goto(targetRoom);
	instance_destroy();
}
else if( RightDIrection == true && global.KillBoss == false && _boolcheck)
{
	ScreenShake(5,30);
	NewTextBox("Kill the boss go to next stage");
	with(oPlayer)
	{
		if(direction != 11.324){
		x -= lengthdir_x(5,direction);
		y -= lengthdir_y(5,direction);
		}
	}
}