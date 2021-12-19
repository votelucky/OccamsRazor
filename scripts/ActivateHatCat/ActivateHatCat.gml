function ActivateHatCat(){
var _hasHat = (global.iLifted != noone) && (global.iLifted.object_index == oHat);
	switch (global.questStatus[? "TheHatQuest"])
	{
		case 0: //not started
		{
			//player might have brought the hat back anyway
			if (_hasHat)
			{
				//complete quest
				NewTextBox("Wow, you found my hat without me even asking you to!",2);
				NewTextBox("You are a true hero indeed!",2);
				global.questStatus[? "TheHatQuest"] = 2;
				with (oQuestNPC) sprite_index = sQuestyHat;
				with (oHat) instance_destroy();
				global.iLifted = noone;
				with (oPlayer)
				{
					spriteIdle = sPlayer;
					spriteRun = sPlayerRun;
				}
			}
			else
			{
				//offer quest
				NewTextBox("Hello there! You look like a brave adventurer!\nWhat with the cloak and all.",2)
				NewTextBox("Could you help me find my missing hat?",2,["4:Of Course!","5:This task is beneath me"]);
			}
			
		}break;
		
		case 1: //quest in progress
		{
			if (_hasHat)
			{
				//complete quest
				NewTextBox("Wow, you found my hat!",2);
				NewTextBox("You are a true hero indeed!",2);
				global.questStatus[? "TheHatQuest"] = 2;
				with (oQuestNPC) sprite_index = sQuestyHat;
				with (oHat) instance_destroy();
				global.iLifted = noone;
				with (oPlayer)
				{
					spriteIdle = sPlayer;
					spriteRun = sPlayerRun;
				}
			}
			else
			{
				//clue reminder
				NewTextBox("I think I left my hat in that\nscary cave to the north east.",2);
				NewTextBox("You might need some items to get there!",2);
			}
			
		}break;
		case 2: //quest already completed
		{
			NewTextBox("Thanks again!",2);
		} break;
	}
}