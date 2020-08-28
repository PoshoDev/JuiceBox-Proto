function view_draw_gantt()
{
	// Gantt's Columns
	draw_set_color(c_dkgray);
	for (var i=block_size; i<room_width; i+=block_size*2)
		draw_rectangle(i, 0, i+block_size, room_height, false);
	
	// Gantt's Rows
	draw_set_color(c_gray);
	for (var i=block_size; i<room_height; i+=block_size)
		draw_line(0, i, room_width, i);
}