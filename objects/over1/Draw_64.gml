var offset = 2;
var txt = hu;

draw_set_font(fTitleText);
//draw_set_halign(fa_right);
//draw_set_valign(fa_bottom);
//draw_set_color(c_black);
var xk = 160;
var yk = 40;
draw_set_color(c_white)
draw_text(xk-offset,yk,txt);
draw_text(xk+offset,yk,txt);
draw_text(xk,yk-offset,txt);
draw_text(xk,yk+offset,txt);
draw_set_color(c_black);
draw_text(xk,yk,txt);
//draw_text(160,40,txt);

