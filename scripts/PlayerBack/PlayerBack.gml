/// @desc PlayerBack (arg1 , arg2)
function PlayerBack(argument0, argument1) {
	with(oPlayer){
			var _xmove = lengthdir_x(argument0, argument1);
			var _ymove = lengthdir_y(argument0, argument1);
			with(oPlayer){
			var _x = x;
			var _y = y;
			while(!tilemap_get_at_pixel(collisionMap, x + sign(_xmove) , y))
			{
				if( abs(x - _x) >= abs(_xmove) ) break; 
				x += sign(_xmove);
			}
			while(!tilemap_get_at_pixel(collisionMap, x , y + sign(_ymove)))
			{
				if( abs(y - _y) >= abs(_ymove) ) break; 
				y += sign(_ymove);
			}
			}
	}


}
