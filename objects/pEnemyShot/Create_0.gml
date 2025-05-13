/// @desc 필수적인 몹 설정이다 이말이야 ㅋㅋㅋ
image_speed = 0;
z = 0;
flash = 0;
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
uFlash = shader_get_uniform(shWhiteFlash, "flash");
localFrame = 0;
EnemyAttack = false;
StopFrame = 0;  
AttackFrame = EnemyReload;