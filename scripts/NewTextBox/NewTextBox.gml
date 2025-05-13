/// @arg Message
/// @arg Background  
function NewTextBox() {

	var _obj;
	if (instance_exists(oText)) _obj = oTextQueued;
	else _obj = oText;
	with (instance_create_layer(0,0,"Instances",_obj))
	{
		message = argument[0];
		if(instance_exists(other)) originInstance = other.id;
		else originInstance = noone;
		if(argument_count > 1) background = argument[1];
		else background = 1;
		if(argument_count > 2)
		{
			// 대답으로부터 코드 가져오기
			responses = argument[2];
			for (var i = 0; i < array_length_1d(responses); i++)
			{
				var _markerPosition = string_pos(":",responses[i]);
				responsesScripts[i] = string_copy(responses[i],1,_markerPosition - 1);
				responsesScripts[i] = real(responsesScripts[i]);
				responses[i] = string_delete(responses[i], 1, _markerPosition);
			}
		}
		else
		{
			responses = [-1];
			responsesScripts = [-1];
		}
	}
	with (oPlayer)
	{
		if (state != PlayerStateLocked)
		{
			lastState = state;
			state = PlayerStateLocked;
		}
	}


}
