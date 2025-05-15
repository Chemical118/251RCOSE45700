// Step Event of oGlobalController
global.KillBoss = true;

if keyboard_check(vk_shift) {
    if keyboard_check_pressed(ord("1")) {      // ← ord("1") 로 변경
        DialogueResponses(100);
    }
    else if keyboard_check_pressed(ord("2")) { // ← ord("2") 로 변경
        DialogueResponses(9);
    }
    else if keyboard_check_pressed(ord("3")) {
        DialogueResponses(15);
    }
    else if keyboard_check_pressed(ord("4")) {
        DialogueResponses(27);
    }
    else if keyboard_check_pressed(ord("5")) {
        DialogueResponses(33);
    }
}
