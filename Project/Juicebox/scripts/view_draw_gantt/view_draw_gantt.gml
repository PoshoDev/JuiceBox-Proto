function view_draw_gantt()
{
	if (live_call()) { return live_result; }
	
	// Title Space
	draw_set_color(c_white);
	draw_rectangle(cat, gsty, gstx, rh, false);
		
	// Gantt's Columns
	draw_set_color(c_dkgray);
	for (var i=gstx; i<rw; i+=block_size*2)
		draw_rectangle(i, 0, i+block_size, rh, false);
	
	// Gantt's Rows
	draw_set_color(c_gray);
	for (var i=block_size; i<rh; i+=block_size)
		draw_line(0, i, rw, i);
		
	
	// Day Numbers
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	for(var i=0; i<ds_list_size(view_days); i++)
	{
		// Day's Square
		draw_set_color(c_white);
		draw_rectangle(gstx+block_size/2+block_size*i, block_size, gstx+block_size/2+block_size*(i+1), gsty, false);
		draw_set_color(c_black);
		draw_rectangle(gstx+block_size/2+block_size*i, block_size, gstx+block_size/2+block_size*(i+1), gsty, true);
		
		// Day's Number
		draw_text(gstx+block_size*(i+1), gsty-block_size/2, string(ds_list_find_value(view_days, i)));
	}
}