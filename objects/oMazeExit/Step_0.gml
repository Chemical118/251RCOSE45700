/// @desc 방을 옯기는데 영향을 준다
var _boolcheck = (instance_exists(oPlayer)) && (position_meeting(oPlayer.x , oPlayer.y , id));

if (_boolcheck)
{	
	
	var dx = 0;
    var dy = 0;
    switch (MazeDir) {
        case 1: dx =  1; dy =  0; break;  // 오른쪽
        case 2: dx =  0; dy = -1; break;  // 위쪽
        case 3: dx = -1; dy =  0; break;  // 왼쪽
        case 4: dx =  0; dy =  1; break;  // 아래쪽
        default:
            show_error("scr_room_transition: 잘못된 MazeDir(" + string(MazeDir) + ")", true);
            return;
    }

    // 2) 타겟 좌표 계산
    var target_w = global.mazew + dx;
    var target_h = global.mazeh + dy;

    // 3) 이동 가능 여부 검사 (matrix 값이 0 이어야 함)
    //    GMS2.3+ 에서는 assert() 사용 가능
    scr_assert(global.maze_matrix[# target_w, target_h] == FLOOR,
			   "방 이동 실패: 타겟 셀(" + string(target_w) + ", " + string(target_h) + ")이 비어있지 않습니다.");
	
	global.mazew = target_w;
	global.mazeh = target_h;
	global.maze_matrix_vis[# global.mazew, global.mazeh] = 1;
	
	var dirs = ""; // 접미사로 쓸 방향 숫자들
	
	if (global.mazew == global.mazestw && global.mazeh == global.mazesth) {
		dirs = "In";
	} else if (global.mazew == global.mazendw && global.mazeh == global.mazendh) {
		dirs = "Out";
	} else {
		// 1) 전역 미로 좌표 복사 (x,y 대신 _x,_y)
	    var _x = global.mazew;
	    var _y = global.mazeh;

	    // 2) 동서남북 방향으로 주변이 FLOOR인지 확인
	    //    오른쪽 (1)
	    if (_x + 1 < ds_grid_width(global.maze_matrix)
	        && global.maze_matrix[# _x+1, _y] == FLOOR) {
	        dirs += "1";
	    }
	    // 위쪽 (2)
	    if (_y - 1 >= 0
	        && global.maze_matrix[# _x, _y-1] == FLOOR) {
	        dirs += "2";
	    }
	    // 왼쪽 (3)
	    if (_x - 1 >= 0
	        && global.maze_matrix[# _x-1, _y] == FLOOR) {
	        dirs += "3";
	    }
	    // 아래쪽 (4)
	    if (_y + 1 < ds_grid_height(global.maze_matrix)
	        && global.maze_matrix[# _x, _y+1] == FLOOR) {
	        dirs += "4";
	    }

	    // 3) 연결된 방향이 하나도 없으면 에러
	    if (dirs == "") {
	        show_error("scr_determine_target_room: 이동할 방이 없습니다! (" 
	                   + string(_x) + "," + string(_y) + ")", true);
	        return;
	    }	
	}

    // 4) 방 이름 생성 및 id 얻기
    var roomName = "rMaze" + dirs;
	show_debug_message(roomName);
    targetRoom = asset_get_index(roomName);
	
	global.MazeDir = MazeDir;
	global.targetRoom = targetRoom;
	global.targetX = -1;
	global.targetY = -1;
	global.targetDirection = oPlayer.direction;
	room_goto(targetRoom);
	instance_destroy();
}
