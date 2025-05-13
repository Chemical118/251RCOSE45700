function Reset() {
	if (file_exists("Save.sav")) file_delete("Save.sav");
	ini_open("Save.sav");
	ini_write_real("Save1","hp",6);
	ini_write_real("Save1","maxhp",6);
	global.targetRoom = 2;
	ini_write_real("Save1","SkillSpeed",-1);
	ini_write_real("Save1","SkillCool",-1);
	ini_write_real("Save1","SkillDamage",-1);
	//ini_write_real("Save1","Shield",false);
	ini_write_real("Save1","roomnumber",global.targetRoom);
	ini_write_real("Save1","X", 32);
	ini_write_real("Save1","Y", 216);
	ini_write_real("Save1","spriteRun",playermov);
	ini_write_real("Save1","spriteIdle",playeridle);
	ini_write_real("Save1","spriteAttack",playeratt);
	ini_write_real("Save1","spriteSkill",-1);
	ini_write_real("Save1","HaveSkill",false);
	ini_write_real("Save1","PlayerSkill",-1);
	ini_write_real("Save1","ShieldHave",false);
	ini_close();


}
