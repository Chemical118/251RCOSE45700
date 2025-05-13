gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin =32;

menu_x = 160;
menu_y = 30;
menu_x_target = 160;
menu_speed = 25;
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu);
menu_committed = -1;
menu_control = true;

menu[2] ="New Game";
menu[1] ="Continue";
menu[0] ="Quit";

menu_items = array_length_1d(menu);
menu_cursor = 2;