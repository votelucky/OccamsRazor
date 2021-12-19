/// argument id
function ActivateLiftable(){
if (global.iLifted == noone)
{
	PlayerActOutAnimation (sPlayerLift,-1);
	
	spriteIdle = sPlayerCarrying;
	spriteRun = sPlayerRunCarrying;
	
	global.iLifted = argument0;
	with (global.iLifted)
	{
		lifted = true;
		persistent = true
	}
	
}
}