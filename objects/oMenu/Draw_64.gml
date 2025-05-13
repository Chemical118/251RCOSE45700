draw_set_font(fMenu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for(var i = 0; i <menu_items; i++)
{
	var offset = 2;
	var txt = menu[i];
	if (menu_cursor == i)
	{
		txt = string_insert("> ", txt, 0);
		var col = c_black;
	}
	else
	{
		var col =c_gray;	
	}
	var xk = menu_x;
	var yk = menu_y - (menu_itemheight * (i*1.5))+ 100;
	draw_set_color(c_white)
	draw_text(xk-offset,yk,txt);
	draw_text(xk+offset,yk,txt);
	draw_text(xk,yk-offset,txt);
	draw_text(xk,yk+offset,txt);
	draw_set_color(col);
	draw_text(xk,yk,txt);
}