var width = 320;
var xx = width - 26 * 10
var yy = 32
var xEmpty = 0
var yEmpty = 0
var xFull = 0
var yFull = 0
var xHalf = 0
var yHalf = 0
global.maxhp = clamp(global.maxhp, 2, 40)
global.hp = clamp(global.hp, 0, global.maxhp)
draw_set_font (fnt_small)
draw_set_colour(c_black)
//draw_text(width - 26 * 10 / 2, 0, "-Life-")
draw_set_halign(fa_center)

repeat (global.maxhp/2)
{
	if xEmpty == 20*10
	{
		yEmpty = 20
		xEmpty = 0
	}
	draw_sprite (emptyheart, 0 , xx - xEmpty + 250, yy + yEmpty - 10)
	xEmpty += 20
}
repeat (global.hp/2 + frac(global.hp/2)*2)
{
	if xHalf >= 20*10
	{ 
		yHalf = 20
		xHalf = 0
	}
	draw_sprite (halfheart, 0 ,xx + xHalf + 210 - 10*(global.maxhp - 6), yy+yHalf - 10)
	xHalf+=20
} 
repeat (floor(global.hp/2))
{
	if xFull >= 20*10
	{
		yFull = 20
		xFull = 0
	}
	draw_sprite (fullheart, 0 , xx + xFull + 210 - 10*(global.maxhp - 6), yy + yFull - 10)
	xFull +=20
} 
if (global.hp==0)
{
	audio_stop_all();
	room_goto(12);
}