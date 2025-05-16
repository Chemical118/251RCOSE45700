state = PlayerStateFree;
stateAttack = AttackSlash;
hitByAttack = -1;
lastState = state;
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedwalk = 1.5;
speedRoll = 2.5;
distanceRoll = 52;
spriteRoll = playershielduse;
spriteRun = global.spriteRun;
spriteIdle = global.spriteIdle;
spriteAttack = global.spriteAttack;
spriteSkill = global.spriteSkill;
HaveSkill = global.HaveSkill;
PlayerSkill = global.PlayerSkill;
ShieldHave = global.ShieldHave;
localFrame = 0; 
StopFrame = 0; 

if(global.targetX != -1)
{
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
} else {
	var _maze_name = room_get_name(room);
	if string_starts_with(_maze_name, "rMaze") {
		direction = global.targetDirection;
		if (_maze_name == "rMazeIn") {
			x = 33;
			y = 133;
		} else if (_maze_name == "rMazeOut") {
			x = 173;
			y = 35;
		} else {
			var _exitInst;
			switch (global.MazeDir) {
			    case 1: _exitInst = instance_find(oMazeExit3, 0); break; // 오른쪽 이동 → 왼쪽 exit
			    case 2: _exitInst = instance_find(oMazeExit4, 0); break; // 위쪽 이동 → 아래 exit
			    case 3: _exitInst = instance_find(oMazeExit1, 0); break; // 왼쪽 이동 → 오른쪽 exit
			    case 4: _exitInst = instance_find(oMazeExit2, 0); break; // 아래쪽 이동 → 위 exit
			    default:
			        show_error("Room Start: 잘못된 global.MazeDir = " + string(global.MazeDir), true);
			        exit;
			}

			// 2) exit 인스턴스 존재 확인
			if (_exitInst == noone) {
			    show_error("Room Start: oMazeExit 인스턴스를 찾을 수 없습니다.", true);
			    exit;
			}

			// 3) 방향별로 _x, _y 직접 지정 (MAZE_OFFSET 사용, .x/.y 대신 bbox 평균)
		    switch (global.MazeDir) {
		        case 1:
		            // 왼쪽 벽 exit 오른쪽으로 MAZE_OFFSET
		            x = _exitInst.bbox_right + MAZE_OFFSET;
		            // y는 top/bottom 평균
		            y = (_exitInst.bbox_top + _exitInst.bbox_bottom) / 2;
		            break;
		        case 2:
		            // 아래쪽 벽 exit 위로 MAZE_OFFSET
		            y = _exitInst.bbox_top - MAZE_OFFSET;
		            // x는 left/right 평균
		            x = (_exitInst.bbox_left + _exitInst.bbox_right) / 2;
		            break;
		        case 3:
		            // 오른쪽 벽 exit 왼쪽으로 MAZE_OFFSET
		            x = _exitInst.bbox_left - MAZE_OFFSET;
		            y = (_exitInst.bbox_top + _exitInst.bbox_bottom) / 2;
		            break;
		        case 4:
		            // 윗쪽 벽 exit 아래로 MAZE_OFFSET
		            y = _exitInst.bbox_bottom + MAZE_OFFSET;
		            x = (_exitInst.bbox_left + _exitInst.bbox_right) / 2;
		            break;
		    }
		}
	}
}

if (spriteAttack == playeratt && global.targetRoom == 2 && !global.islevel) 
{	
	NewTextBox("Welcome Hero, Please select the difficulty level.",0,["50:Easy","51:Normal","52:Hard"]);
	global.islevel = true;
}

