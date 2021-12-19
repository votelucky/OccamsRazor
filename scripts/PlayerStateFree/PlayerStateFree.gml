// PlayerStateFree
function PlayerStateFree(){

//Movement
hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

PlayerCollision();

//Update Sprite Index
var _oldSprite = sprite_index;
if (inputMagnitude != 0)
{
	direction = inputDirection
	sprite_index = spriteRun;
} else sprite_index = spriteIdle;
if (_oldSprite != sprite_index) localFrame = 0;

//Update Image Index
PlayerAnimateSprite();

//Activate key logic
if (keyAttack)
{
	state = PlayerStateAttack;
	stateAttack = AttackSlash;
}

//Activate Key Logic
if (keyActivate)
	{
		//1. Check for an entity to activate
		//2. If there is nothing, or there is something, but it has no script
			//2a. If we are carrying something, throw it!
			//2b. Otherwise, roll!
		//3. Otherwise, there is something and it has a script! Activate!
		//4. If the thing we activate is an NPC, make it face towards us!
	
		var _activateX = x + lengthdir_x(10, direction);
		var _activateY = y + lengthdir_y(10, direction);
		var _activateSize = 12;
		var _activateList = ds_list_create();
		activate = noone;
		var _entitiesFound = collision_rectangle_list(
			_activateX - _activateSize,
			_activateY - _activateSize,
			_activateX + _activateSize,
			_activateY + _activateSize,
			pEntity,
			false,
			true,	
			_activateList,
			true
		);
	
		//if the first instance we find is either our lifted entity or it has no script: try the next one
		while (_entitiesFound > 0)
		{
			var _check = _activateList[| --_entitiesFound];
			if (_check != global.iLifted) && (_check.entityActivateScript != -1)
			{
				activate = _check;
				break;
			}
		}
	
	
	
		ds_list_destroy(_activateList);
	
	
		if (activate == noone)
		{
			//Throw something if held, otherwise roll
			if (global.iLifted != noone)
			{
				PlayerThrow();
			}
			else
			{
			state = PlayerStateRoll;
			moveDistanceRemaining = distanceRoll;
			}
		}
		else
			{
				// Activate the Entity
				ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
				//Make an NPC face the player
				if (activate.entityNPC)
				{
					with (activate)
					{
						direction = point_direction(x,y,other.x,other.y);
						image_index = CARDINAL_DIR
					}
				}
			}
	
	
	}
	
	//Use Items
	if (keyItem) && (!keyActivate) && (global.playerHasAnyItems) && (global.playerEquipped != ITEM.NONE)
	{
		switch (global.playerEquipped)
		{
			case ITEM.BOMB: UseItemBomb();break;
			case ITEM.BOW: UseItemBow();break;
			case ITEM.HOOK: UseItemHook();break;
			default: break;
		}
	}

	//Cycle Items
	if (global.playerHasAnyItems)
	{
		var _cycleDirection = keyItemSelectUp - keyItemSelectDown;
		if (_cycleDirection != 0)
		{
			do
			{
				global.playerEquipped += _cycleDirection;
				if (global.playerEquipped < 1) global.playerEquipped = ITEM.TYPE_COUNT -1;
				if (global.playerEquipped >= ITEM.TYPE_COUNT) global.playerEquipped = 1;
			}
			until (global.playerItemUnlocked[global.playerEquipped]);
		}
	}

}