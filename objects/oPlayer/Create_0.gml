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
}
if ( spriteAttack == playeratt && global.targetRoom == 2) 
{	
	NewTextBox("Welcome Hero, Please select the difficulty level.",0,["50:Easy","51:Normal","52:Hard"]);
}