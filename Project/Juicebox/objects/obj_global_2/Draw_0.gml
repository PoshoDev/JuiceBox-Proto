if (live_call()) { return live_result; }

lol = 1;

// Gantt's Columns
draw_set_color(c_dkgray);
for (var i=block_size; i<room_width; i+=block_size*2)
	draw_rectangle(i, 0, i+block_size, room_height, false);
	
// Gantt's Rows
draw_set_color(c_gray);
for (var i=block_size; i<room_height; i+=block_size)
	draw_line(0, i, room_width, i);

switch(mode)
{
	case md.addnew:
		draw_rectangle_color(leftbar_x, 0, room_width, room_height, c_black, c_white, c_black, c_white, false);
		draw_set_color(c_orange);
		draw_text(leftbar_x, 0, "Add New");
	break;
}

loop_draw();