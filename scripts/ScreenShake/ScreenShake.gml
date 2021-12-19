/// @description ScreenShake(magnitude,frames)
/// @argument0 Magnitude sets the strength of the shake (distance range)
/// @argument1 Frames sets the length of the shake in frames (60 = 1 second)
function ScreenShake(argument0, argument1){
with (global.iCamera)
{
	if (argument0 > shakeRemain)
	{
		shakeMagnitude = argument0;
		shakeRemain = shakeMagnitude;
		shakeLength = argument1;
	}
}

}