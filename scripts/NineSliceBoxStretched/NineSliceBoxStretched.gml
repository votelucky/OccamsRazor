///@Description NineSliceBoxStretched(sprite, x1, y1, x2, y2)
///@param {sprite}		sprite	The sprite used to make the text boxes
///@param {position}	x1		The left position of the text box
///@param {position}	y1		The top position of the text box
///@param {position}	x2		The right position of the text box
///@param {position}	y2		The bottom position of the text box
///@param {real}		index	The image index of the sprite used

function NineSliceBoxStretched(_sprite, _x1, _y1, _x2, _y2, _index)
{

var _size = sprite_get_width(_sprite)/ 3;
var _w = _x2 - _x1;
var _h = _y2 - _y1;

// MIDDLE
draw_sprite_part_ext(_sprite, _index, _size, _size, 1, 1, _x1+_size, _y1+_size, _w-(_size*2), _h-(_size*2), c_white,draw_get_alpha());

//Corners
//top left
draw_sprite_part(_sprite, _index, 0, 0, _size, _size, _x1, _y1);
//top right
draw_sprite_part(_sprite, _index, _size*2, 0, _size, _size, _x1+_w-_size, _y1);
//bottom left
draw_sprite_part(_sprite, _index, 0, _size*2, _size, _size, _x1, _y1+_h-_size);
//bottom right
draw_sprite_part(_sprite, _index, _size*2, _size*2, _size, _size, _x1+_w-_size, _y1+_h-_size);

//EDGES
//left edge
draw_sprite_part_ext(_sprite, _index, 0, _size, _size, 1, _x1, _y1+_size, 1, _h-(_size*2), c_white,draw_get_alpha());
//right edge
draw_sprite_part_ext(_sprite, _index, _size*2, _size, _size, 1, _x1+_w-_size, _y1+_size, 1, _h-(_size*2), c_white, draw_get_alpha());
//top edge
draw_sprite_part_ext(_sprite, _index, _size, 0, 1, _size, _x1+_size, _y1, _w-(_size*2), 1, c_white,draw_get_alpha());
//bottom edge
draw_sprite_part_ext(_sprite, _index, _size, _size*2, 1, _size, _x1+_size, _y1+_h-(_size), _w-(_size*2), 1, c_white,draw_get_alpha());


}