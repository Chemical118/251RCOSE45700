#macro VIEW_RADIUS  5
#macro CELL_SIZE    4
#macro OFFSET_X     8
#macro OFFSET_Y     8

// 숨겨진 칸 색상
#macro HIDDEN_COLOR c_black

/// scr_DrawMazeMinimap(_grid, _playerGX, _playerGY)
function scr_DrawMazeMinimap(_grid, _playerGX, _playerGY) {
    var r       = VIEW_RADIUS;
    var visGrid = global.maze_matrix_vis;
    
    draw_set_alpha(0.8);
    for (var dy = -r; dy <= r; dy++) {
        for (var dx = -r; dx <= r; dx++) {
            var gx = _playerGX + dx;
            var gy = _playerGY + dy;
            var sx = OFFSET_X + (dx + r) * CELL_SIZE;
            var sy = OFFSET_Y + (dy + r) * CELL_SIZE;
            
            // 미로 밖
            if (gx < 0 || gy < 0
             || gx >= ds_grid_width(_grid)
             || gy >= ds_grid_height(_grid)) {
                draw_set_color(HIDDEN_COLOR);
            }
            else {
                // 방문 여부 & 이웃 체크
                var isVis = (ds_grid_get(visGrid, gx, gy) == 1);
                var nbrVis = false;
                if (!isVis) {
                    if (gx>0   && ds_grid_get(visGrid, gx-1, gy)==1) nbrVis = true;
                    if (gx<ds_grid_width(visGrid)-1 && ds_grid_get(visGrid, gx+1, gy)==1) nbrVis = true;
                    if (gy>0   && ds_grid_get(visGrid, gx, gy-1)==1) nbrVis = true;
                    if (gy<ds_grid_height(visGrid)-1 && ds_grid_get(visGrid, gx, gy+1)==1) nbrVis = true;
                }
                
                if (isVis || nbrVis) {
                    // 평소대로 그리기
                    var cell = ds_grid_get(_grid, gx, gy);
                    if (cell == WALL)      draw_set_color(c_gray);
                    else if (cell == FLOOR) draw_set_color(c_white);
                    else                    draw_set_color(c_black);
                }
                else {
                    // 시야 밖은 숨김 색
                    draw_set_color(HIDDEN_COLOR);
                }
            }
            
            draw_rectangle(sx, sy, sx + CELL_SIZE - 1, sy + CELL_SIZE - 1, false);
        }
    }
    
    // 플레이어 마커
    draw_set_color(c_red);
    var px = OFFSET_X + r*CELL_SIZE + CELL_SIZE/2;
    var py = OFFSET_Y + r*CELL_SIZE + CELL_SIZE/2;
    var h  = CELL_SIZE/3;
    draw_rectangle(px-h, py-h, px+h-1, py+h-1, false);
    draw_set_alpha(1);
}

var _maze_name = room_get_name(room);
if string_starts_with(_maze_name, "rMaze") {
	scr_DrawMazeMinimap(global.maze_matrix, global.mazew, global.mazeh);
	
	if (!global.ismaze) {
		audio_play_sound(Maze,1000,true);
		global.ismaze = true;
	}
} else {
	if (global.ismaze) {
		audio_stop_all();
	}
}
