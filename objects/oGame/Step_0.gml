/// @description Music
if global.currentMusic != global.newMusic
{
	audio_sound_gain(global.currentMusic,0,4999);
	if audio_sound_get_gain(global.newMusic||global.currentMusic) >= 0
	{
		audio_sound_gain(global.newMusic,1,5000);
		audio_play_sound(global.newMusic, 100, true);
	}
	global.currentMusic = global.newMusic;
}

if audio_sound_get_gain(global.currentMusic) = 0
{
	audio_stop_sound(global.currentMusic);
	
}