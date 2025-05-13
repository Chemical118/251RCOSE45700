function Save() {
	if (file_exists("Save.sav")) file_delete("Save.sav");
	else script_execute(Reset);
	ini_open("Save.sav");
	ini_write_real("Save1","hp",global.hp);
	ini_write_real("Save1","maxhp",global.maxhp);
	if(global.targetRoom == -1) global.targetRoom = 2;
	ini_write_real("Save1","roomnumber",global.targetRoom);
	if(instance_exists(oPlayer)){
	ini_write_real("Save1","X", oPlayer.x);
	ini_write_real("Save1","Y", oPlayer.y);}
	ini_write_real("Save1","SkillSpeed",global.SkillSpeed);
	ini_write_real("Save1","SkillCool",global.SkillCool);
	ini_write_real("Save1","SkillDamage",global.SkillDamage);
	ini_write_real("Save1","spriteRun",global.spriteRun);
	ini_write_real("Save1","spriteIdle",global.spriteIdle);
	ini_write_real("Save1","spriteAttack",global.spriteAttack);
	ini_write_real("Save1","spriteSkill",global.spriteSkill);
	ini_write_real("Save1","HaveSkill",global.HaveSkill);
	ini_write_real("Save1","PlayerSkill",global.PlayerSkill);
	ini_write_real("Save1","ShieldHave",global.ShieldHave);
	ini_close();


}
