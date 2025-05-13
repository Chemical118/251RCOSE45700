function Load() {
	if(file_exists("Save.sav"))
	{
		ini_open("Save.sav")
		global.hp = ini_read_real("Save1","hp",0)
		global.maxhp = ini_read_real("Save1","maxhp",0)
		global.targetX = ini_read_real("Save1","X", 0)
		global.targetY = ini_read_real("Save1","Y", 0)
		global.SkillCool = ini_read_real("Save1","SkillCool",0)
		global.SkillSpeed = ini_read_real("Save1","SkillSpeed",0)
		global.SkillDamage = ini_read_real("Save1","SkillDamage",0)
		global.spriteRun = ini_read_real("Save1","spriteRun",0)
		global.spriteIdle = ini_read_real("Save1","spriteIdle",0)
		global.spriteAttack = ini_read_real("Save1","spriteAttack",0)
		global.spriteSkill = ini_read_real("Save1","spriteSkill",0)
		global.HaveSkill = ini_read_real("Save1","HaveSkill",0)
		global.PlayerSkill = ini_read_real("Save1","PlayerSkill",0)
		global.ShieldHave = ini_read_real("Save1","ShieldHave",0)
		global.targetRoom = ini_read_real("Save1", "roomnumber", 0)
		var targetRoom = global.targetRoom
		if(targetRoom == 3) audio_play_sound(FaronWood,1000,true);
		if(targetRoom == 4) audio_play_sound(Cave,1000,true);
		if(targetRoom == 5) audio_play_sound(desert,1000,true);
		if(targetRoom == 6) audio_play_sound(beach,1000,true);
		if(targetRoom == 8) audio_play_sound(D,1000,true);
		if(targetRoom == 9) audio_play_sound(secret,1000,true);
		if(targetRoom == 12) audio_play_sound(Gameover,1000,true);
		if(targetRoom == 13) audio_play_sound(Ending,1000,true);
		room_goto(targetRoom);
		ini_close()
	} 


}
