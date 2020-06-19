function obj_task() constructor
{
	var date = date_current_datetime();
	var date_inc = date_inc_day(date, 1);
    
	category =   -1;
	type_ =      -1;
	title =      "";
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
	w = block_size * 4;
	
	alpha = -1;
	
	
	// Events
	
	Step = function()
	{
		alpha = 0.75-cos(current_time)/3/60;
	}
	
	Draw = function()
	{
		draw_set_color(c_orange);
		draw_set_alpha(alpha);
		draw_rectangle(x, y, x+w, y+block_size, false);
		
		draw_set_color(c_white);
		draw_set_alpha(1);
	}
}