/// @arg Response
function DialogueResponses(argument0) {
	switch(argument0)
	{
		case 0: break;
		case 1: NewTextBox("Sorry I didn't remember you. May I ask you a favor?",1,["3:Yes","4:Umm..."]);break;
		case 2: NewTextBox("No, nice to meet you",1);break;
		case 3: NewTextBox("Thank you! \nPlease defeat them and save the village.\nHere is a sword to help you.",1,["100:Thanks! Got to go!"]);break;
		case 4: NewTextBox("I'll take that as a yes. \nPlease defeat them and save the village.\nHere is a sword to help you.",1,["100:Uh ok! Got to go!"]);break;
		case 100:
		{
			oPlayer.spriteAttack = playerbladeatt;
			global.spriteAttack = playerbladeatt;
			oPlayer.spriteIdle = playerbladeidle; 
			global.spriteIdle = playerbladeidle;
			oPlayer.spriteRun = playerblademov;
			global.spriteRun = playerblademov;
			NewTextBox("You received a sword! \nPress shift to use!",0);break;
		}
		case 5: NewTextBox("No I'm friendly! Thanks for getting rid of those slimes!", 1,["7:Ez","8:It was nothing"]);break;
		case 6: NewTextBox("Thanks for getting rid of those slimes!", 1,["7:Ez","8:It was nothing"]);break;
		case 7: NewTextBox("Your adventure is going to get harder... \nBut you still deserve\n something to help you on your way.",1,["9:Wow thanks, I'll get going now"]);break;
		case 8: NewTextBox("You are modest brave one. \nHere's something to help you on your way", 1, ["10:Wow thanks, I'll get going now"]);break;
		case 9: 
		{
			if(global.KillBoss == false )
			{
				NewTextBox("Hmm.. I think you don't kill the boss\ntalk to me again when you kill the boss");
				break;
			}
			global.maxhp+=2;
			global.hp = global.maxhp;
			oPlayer.spriteSkill = playergrassatt;
			global.spriteSkill = playergrassatt;
			oPlayer.HaveSkill = true;
			global.HaveSkill = true;
			oPlayer.PlayerSkill = oSkillG;
			global.PlayerSkill = oSkillG;
			oPlayer.SkillDamage = 2;
			global.SkillDamage = 2;
			oPlayer.SkillCool = 75;
			global.SkillCool = 75;
			oPlayer.SkillSpeed = 1.05;
			global.SkillSpeed = 1.05;
			NewTextBox("Too much pride isn't good for your health! \nYou received grass blade skill! \nClick to use skill!",0);break;
		}
		case 10:
		{
			if(global.KillBoss == false )
			{
				NewTextBox("Hmm.. I think you don't kill the boss\ntalk to me again when you kill the boss");
				break;
			}
			global.maxhp+=4;
			global.hp = global.maxhp;
			oPlayer.spriteSkill = playergrassatt;
			global.spriteSkill = playergrassatt;
			oPlayer.HaveSkill = true;
			global.HaveSkill = true;
			oPlayer.SkillDamage = 2;
			global.SkillDamage = 2;
			oPlayer.PlayerSkill = oSkillG;
			global.PlayerSkill = oSkillG;
			oPlayer.SkillCool = 60;
			global.SkillCool = 60;
			oPlayer.SkillSpeed = 1.2;
			global.SkillSpeed = 1.2;
			NewTextBox("You received grass blade skill! \nClick to use skill!",0);break;
		}
		case 11: NewTextBox("Look where your going... \nStill thanks for getting rid of those skeletons!", 1,["13:Ez"]);break;
		case 12: NewTextBox("Thanks for getting rid of those skeletons!", 1,["13:Ez","14:It was nothing"]);break;
		case 13: NewTextBox("you seem strong enough to take care of yourself. \nI don't think you'll need an extra heart.\nBut I'll give something to help you on your way.",1,["15:Uh thanks, I'll get going now"]);break;
		case 14: NewTextBox("You are modest brave one. \nHere's something to help you on your way", 1, ["16:Wow thanks, I'll get going now"]);break;
		case 15: 
		{
			if(global.KillBoss == false )
			{
				NewTextBox("Hmm.. I think you don't kill the boss\ntalk to me again when you kill the boss");
				break;
			}
			global.maxhp+=2;
			global.hp = global.maxhp;
			oPlayer.spriteRoll = playershielduse;
			global.spriteRoll = playershielduse;
			oPlayer.ShieldHave = true;
			global.ShieldHave = true;
			NewTextBox("Too much pride isn't good for your health! \nYou received shield charge skill! \nClick Space to use skill!",0);break;
		}
		case 16:
		{
			if(global.KillBoss == false )
			{
				NewTextBox("Hmm.. I think you don't kill the boss\ntalk to me again when you kill the boss");
				break;
			}
		
			global.maxhp+=4;
			global.hp = global.maxhp;
			oPlayer.spriteRoll = playershielduse;
			global.spriteRoll = playershielduse;
			oPlayer.ShieldHave = true;
			global.ShieldHave = true;
			NewTextBox("You received shield charge skill! \nClick Space to use skill!",0);break;
		}
		case 17: NewTextBox("Sorry I can't help it... \nStill thanks for saving me!", 1,["19:Ez"]);break;
		case 18: NewTextBox("Thanks for getting rid of those evil spirits!", 1,["19:Ez","20:I always help those in need."]);break;
		case 19: NewTextBox("Being the symbol of life,\n I see you don't need much more health. \nI'll give you just one.",1,["21:Uh ok, I'll get going now"]);break;
		case 20: NewTextBox("You have a kind heart\n so you deserve some more. \nThis will help you on your way", 1, ["22:Wow thanks, I'll get going now"]);break;
		case 21: 
		{
			if(global.KillBoss == false )
			{
				NewTextBox("Hmm.. I think you don't kill the boss\ntalk to me again when you kill the boss");
				break;
			}
			global.maxhp+=2;
			global.hp = global.maxhp;
			NewTextBox("Too much pride isn't good for you! \nYou received extra health!",0);break;
		}
		case 22:
		{
			if(global.KillBoss == false )
			{
				NewTextBox("Hmm.. I think you don't kill the boss\ntalk to me again when you kill the boss");
				break;
			}
			global.maxhp+=6;
			global.hp = global.maxhp;
			NewTextBox("You received extra health!",0);break;
		}
		case 23: NewTextBox("Please get that sword off me... \nStill thanks for defeating the kraken!", 1,["25:Ez"]);break;
		case 24: NewTextBox("Thanks for getting rid of those squids!", 1,["25:Ez","26:I always help those in need."]);break;
		case 25: NewTextBox("Well since you seemed to\n have feasted upon squid sushi, \nI'll give you just one heart and a new skill.",1,["27:Uh ok, I'll get going now"]);break;
		case 26: NewTextBox("Well since you are so kind, here's a new skill to help you!", 1, ["28:Wow thanks, I'll get going now"]);break;
		case 27: 
		{
			if(global.KillBoss == false )
			{
				NewTextBox("Hmm.. I think you don't kill the boss\ntalk to me again when you kill the boss");
				break;
			}
		
			global.maxhp+=2;
			global.hp = global.maxhp;
			oPlayer.spriteSkill = playerwateruse;
			global.spriteSkill = playerwateruse;
			oPlayer.SkillDamage = 3;
			global.SkillDamage = 3;
			oPlayer.SkillCool = 50;
			global.SkillCool = 50;
			oPlayer.SkillSpeed =  1.3;
			global.SkillSpeed = 1.3;
			oPlayer.PlayerSkill = oSkillW;
			global.PlayerSkill = oSkillW;
			NewTextBox("Good gamer but not a smart one I see? \nYou received oceanic wave skill!\nClick to use!\nAlso return to the village to gain a vital skill in a hidden location!",0);break;
		}
		case 28:
		{
			if(global.KillBoss == false )
			{
				NewTextBox("Hmm.. I think you don't kill the boss\ntalk to me again when you kill the boss");
				break;
			}
			global.maxhp+=6;
			global.hp = global.maxhp;
			oPlayer.spriteSkill = playerwateruse;
			global.spriteSkill = playerwateruse;
			oPlayer.SkillDamage = 3;
			global.SkillDamage = 3;
			oPlayer.SkillCool = 45;
			global.SkillCool = 45;
			oPlayer.SkillSpeed  = 1.5;
			global.SkillSpeed = 1.5;
			oPlayer.PlayerSkill = oSkillW;
			global.PlayerSkill = oSkillW;
			NewTextBox("You received oceanic wave skill!\nClick to use!\nAlso return to the village to gain a vital skill!",0);
			NewTextBox("Use the portal to go the village.\nPortal is surrounded by fences so you can find easily",0);
			NewTextBox("If you want to go back to here,\nuse the portal in the village.\nIt looks exactly like what portal in here.",0);
			break;
		}
		case 29: NewTextBox("No, insolent human it was a test. \nStill it is only right you\n have the bow of light", 1,["31:Umm.."]);break;
		case 30: NewTextBox("Thanks for getting rid of those squids!", 1,["31:Ez","32:It was challenging o great golem"]);break;
		case 31: NewTextBox("Insolent human here's your bow.\n Now you may leave and never come back!",1,["33:Uh ok, I'll go out now"]);break;
		case 32: NewTextBox("Well since you are so kind,\n here's a new skill to help you!", 1, ["34:I'm honored o great golem,\n I'll get going now"]);break;
		case 33: 
		{
			if ( oPlayer.HaveSkill == false) 
			{
				global.maxhp = 2;
				global.hp = 2;
				NewTextBox("You are a cheater, go back to village...",1);
				NewTextBox("You feel like your journey is going to be hard.",0);
				break;
			}
			global.maxhp+=4;
			global.hp = global.maxhp;
			oPlayer.spriteSkill = playerbowatt;
			global.spriteSkill = playerbowatt;
			oPlayer.SkillDamage = 4;
			global.SkillDamage = 4;
			oPlayer.SkillCool = 30;
			global.SkillCool = 30;
			oPlayer.SkillSpeed  = 2.3;
			global.SkillSpeed = 2.3;
			oPlayer.PlayerSkill = oSkillB;
			global.PlayerSkill = oSkillB;
			NewTextBox("Always look before you hit! \nYou received the bow of light!\nClick to use!\nNow destroy the boss!",0);break;
		}
		case 34:
		{
			if ( oPlayer.HaveSkill == false) 
			{
				global.maxhp = 4;
				global.hp = 4;
				NewTextBox("You are a cheater, go back to village...",1);
				NewTextBox("You feel like your journey is going to be hard.",0);
				break;
			}
			global.maxhp+=6;
			global.hp = global.maxhp;
			oPlayer.spriteSkill = playerbowatt;
			global.spriteSkill = playerbowatt;
			oPlayer.SkillDamage = 4;
			global.SkillDamage = 4;
			oPlayer.SkillCool = 50;
			global.SkillCool = 50;
			oPlayer.SkillSpeed  = 2.7;
			global.SkillSpeed = 2.7;
			oPlayer.PlayerSkill = oSkillB;
			global.PlayerSkill = oSkillB;
			NewTextBox("You received the bow of light!\nClick to use!\nNow destroy the boss!",0);break;
		}
		case 35: NewTextBox("This is the end of your journey! \nYou've defeated the dark lord! \nYou'll be honored by all for centuries!", 1,["40:I'll face any challenge to protect the weak"]);break;
		case 40: 
		{
			if(global.KillBoss == false)
			{
				NewTextBox("This is no time to talk, look behind you.");
				break;
			}
			global.hp = global.maxhp;
			NewTextBox("Congratulation you've won!\nCreated by Hyeonwoo Ryu, Weonjae Lee Yonghwan Jeong.",0);
			NewTextBox("Big thanks to Shaun Spalding\n Music from the Legend of Zelda.");
			room_goto(13);
			break;
		}
		case 50:
		{
			global.maxhp = 8;
			global.hp = global.maxhp;
			FirstTalk();
			break;
		}
		case 51:
		{
			global.maxhp = 6;
			global.hp = global.maxhp;
			FirstTalk();
			break;
		}
		case 52:
		{
			global.maxhp = 4;
			global.hp = global.maxhp;
			FirstTalk();
			break;
		}
		default: break;
	}


}
