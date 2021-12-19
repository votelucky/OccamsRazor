/// @Description PlayerActOutAnimation(Sprite, EndScript)
/// @argument Sprite
/// @argument EndScript

// Carry out an animation and optionally carry out a script when the animation ends
function PlayerActOutAnimation(argument0,argument1){
state = PlayerStateAct;
sprite_index = argument[0];
animationEndScript = argument[1];
//if (argument_count > 1) animationEndScript = argument[1] else animationEndScript = -1;
//if (argument_count > 2) animationEndScriptArgs = argument[2]; else animationEndScriptArgs = [];
localFrame = 0;
image_index = 0;
PlayerAnimateSprite();
}