  

menu_x += (menu_x_target - menu_x) / menu_speed;

//menu control
if (menu_control)
{
	if(keyboard_check_pressed(ord("W")))
	{
		menu_cursor++;
		if(menu_cursor >= menu_items) menu_cursor = 0;
	}
	if(keyboard_check_pressed(ord("S")))
	{
		menu_cursor--;
		if(menu_cursor < 0 ) menu_cursor = menu_items-1;
	}
	if(keyboard_check_pressed(vk_space))
	{
		menu_x_target = gui_width+200;
		menu_committed = menu_cursor;
		ScreenShake(4,30);
		menu_control = false;
	}
}

if (menu_x > gui_width+150)&&(menu_committed != -1)
{
	audio_stop_all()
	switch (menu_committed)
	{
		case 2: script_execute(Reset); script_execute(Load); break;
		case 1: script_execute(Load); break;
		case 0: game_end(); break;
	}
}