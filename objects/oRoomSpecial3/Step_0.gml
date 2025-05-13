/// @desc 방을 옯기는데 영향을 준다

var _boolcheck = (instance_exists(oPlayer)) && (position_meeting(oPlayer.x , oPlayer.y , id));

if(_boolcheck){
if ( oPlayer.HaveSkill == true && oPlayer.PlayerSkill == oSkillB)
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
	room_goto(targetRoom);
	instance_destroy();
}
else if (oPlayer.HaveSkill == true && oPlayer.PlayerSkill == oSkillW)
{
	ScreenShake(2,15);
	NewTextBox("Go behind of house to get a vital skill",0);
	with(oPlayer)
	{
		x -= lengthdir_x(3,direction);
		y -= lengthdir_y(3,direction);
	}
}
else
{
	ScreenShake(2,15);
	NewTextBox("You will be use this later...",0);
	with(oPlayer)
	{
		x -= lengthdir_x(3,direction);
		y -= lengthdir_y(3,direction);
	}
}
}