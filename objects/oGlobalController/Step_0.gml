// Step Event of oGlobalController
global.KillBoss = true;

if keyboard_check(vk_shift) {
    if keyboard_check_pressed(ord("1")) {      // ← ord("1") 로 변경
        DialogueResponses(100);
		global.targetRoom = rForest;
		global.targetX = 64;
		global.targetY = 1024;
		global.targetDirection = oPlayer.direction;
		room_goto(rForest);
    }
    else if keyboard_check_pressed(ord("2")) { // ← ord("2") 로 변
		global.targetRoom = rCave;
		global.targetX = 544;
		global.targetY = 2112;
		global.targetDirection = oPlayer.direction;
		room_goto(rCave);
		DialogueResponses(9);
    }
    else if keyboard_check_pressed(ord("3")) {
		global.targetRoom = rDessert;
		global.targetX = 1824;
		global.targetY = 1888;
		global.targetDirection = oPlayer.direction;
		room_goto(rDessert);
        DialogueResponses(15);
    }
    else if keyboard_check_pressed(ord("4")) {
		global.targetRoom = rSea;
		global.targetX = 430;
		global.targetY = 1880;
		global.targetDirection = oPlayer.direction;
		room_goto(rSea);
        DialogueResponses(27);
    }
    else if keyboard_check_pressed(ord("5")) {
        DialogueResponses(33);
    }
}
