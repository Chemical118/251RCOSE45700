lerpProgress += (1 - lerpProgress) / 50;
textProgress += global.textSpeed;

x1 = lerp(x1,x1Target,lerpProgress);
x2 = lerp(x2,x2Target,lerpProgress);

// 반응을 통한 회로
keyUp = keyboard_check_pressed(ord("W"));
keyDown = keyboard_check_pressed(ord("S"));
responsesSelected += (keyDown - keyUp);
var _max = array_length_1d(responses) - 1;
var _min = 0;
if (responsesSelected > _max) responsesSelected = _min;
if (responsesSelected < _min) responsesSelected = _max;

if (keyboard_check_pressed(vk_space))
{
	var _messageLength = string_length(message); 
	if (textProgress >= _messageLength)
	{
		if(responses[0] != -1) with(originInstance) DialogueResponses(other.responsesScripts[other.responsesSelected]);
		instance_destroy();
		if(instance_exists(oTextQueued))
			with (oTextQueued) ticket--;
		else with (oPlayer) state = lastState;
	}
	else if(textProgress > 3) textProgress = _messageLength;
}