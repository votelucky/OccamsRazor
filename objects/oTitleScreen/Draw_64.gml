if (titleVisible > 0)
{
	draw_sprite(sTitle,0,0,-RESOLUTION_H + titleVisible * RESOLUTION_H);
	
	draw_set_alpha(titleVisible * abs(sin(get_timer() * 0.000001 * pi)))
	draw_sprite(sTitle,1,0,0);
	draw_set_alpha(1.0);
}

if (slotsVisible > 0)
{
	//Draw the save slots
	draw_set_alpha(slotsVisible)
	for (var _slot = 0; _slot <= 2; _slot++)
	{
		//Draw the boxes
		var _y = 32+_slot*96
		var _x = 320;
		var _img = 2;
		if (slotSelected == _slot)
		{
			_img = 3;
			draw_sprite(sMenuPlayer,0,_x-64,_y+48);
		}
		NineSliceBoxStretched(sTextBoxBG,_x,_y,624,_y+96,_img);
		//Draw the save data (if it exists)
		draw_set_font(fText);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
		if (slotData[_slot] == -1) //empty save slot
		{
			draw_text(_x + 16, _y + 16, "Start new game");
		}
		else
		{
			draw_text(_x + 16, _y + 16, RoomToAreaName(slotData[_slot][? "room"]))
			
			//Draw health
			var _playerHealth = slotData[_slot][? "playerHealth"]
			var _playerHealthMax = slotData[_slot][? "playerHealthMax"]
			var _playerHealthFrac = frac(_playerHealth);
			_playerHealth -= _playerHealthFrac;
			for (var i = 1; i <= _playerHealthMax; i++)
			{
				var _imageIndex = (i > _playerHealth);
				if (i == _playerHealth+1)
				{
					_imageIndex += (_playerHealthFrac > 0);
					_imageIndex += (_playerHealthFrac > 0.25);
					_imageIndex += (_playerHealthFrac > 0.5);
				}
				draw_sprite(sHealth,_imageIndex, _x + 96 + ((i-1) * 32), _y + 48);
			}
			
			//Draw Money
			draw_sprite(sCoinUI, 0 , _x + 16 , _y + 56);
			draw_text(_x + 40 , _y + 48, slotData[_slot][? "playerMoney"]);
		
		}
	}
	draw_set_alpha(1.0);
}