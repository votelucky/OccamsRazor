/// @description Progress Transition

with (oPlayer) 
{
	if (state != PlayerStateDead) state = PlayerStateTransition;
}

if (leading == OUT)
{
	percent = min(1, percent + TRANSITION_SPEED);
	if (percent >= 1) //If screen fully obscured
	{
		room_goto(target);
		leading = IN;
	}
	
}
else //leading == in
{
	percent = max (0, percent - TRANSITION_SPEED);
	if (percent <= 0) //If Screen full revealed
	{
		with (oPlayer) state = PlayerStateFree;
		instance_destroy();
	}
	
}