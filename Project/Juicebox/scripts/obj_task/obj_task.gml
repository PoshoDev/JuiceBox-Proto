function obj_task() constructor
{
	var date = date_current_datetime();
	var date_inc = date_inc_day(date, 1);
    
	category =   -1;
	type_ =      -1;
	title =      "UNDEF";
	notes =      "";
	url =        "";
	from_day =   date_get_day(date);
	from_month = date_get_month(date);
	from_year =  date_get_year(date);
	due_day =    date_get_day(date_inc);
	due_month =  date_get_month(date_inc);
	due_year =   date_get_year(date_inc);
	time_est =   30;
	repeats =    false;
	cleared =    false;
	
	x = 0;
	y = 0;
	w = 0;
	
	x2 = 0;
	y2 = 0;
	
	alpha = -1;
	
	color = c_orange;
	
	
	// Events
	
	Step_Begin = function()
	{
		if (point_in_rectangle(mouse_x, mouse_y, x, y, x2, y2))
			color = c_maroon;
		else
			color = c_orange;
	}
	
	Step = function()
	{
		alpha = 0.75-cos(current_time)/3/60;
	}
	
	Draw = function()
	{
		draw_set_color(color);
		
		//draw_set_alpha(alpha);
		draw_rectangle(x, y, x2, y2, false);
		
		draw_set_color(c_black);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_text(cat+4, y+block_size/2, title);
		
		draw_set_color(c_white);
		draw_set_alpha(1);
	}
	
	
	// Functions
	
	SetPos = function(px, py, pw)
	{
		x = px;
		y = py;
		w = pw;
		
		x2 = x + block_size*w;
		y2 = y + block_size;
	}
}