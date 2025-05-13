 // 플레이어 인풋
//global.hp = global.maxhp;
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyActivate = keyboard_check_pressed(vk_space);
keyAttack =  mouse_check_button(mb_right);
keySkill = mouse_check_button(mb_left);
inputDirection = point_direction(0,  0,keyRight-keyLeft,keyDown-keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);
if (!global.gamePaused) script_execute(state);
depth = -bbox_bottom;