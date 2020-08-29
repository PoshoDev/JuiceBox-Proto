// Views Manager
function view_draw()
{
    switch(view)
    {
        case vw.gantt:  view_draw_gantt();  break;
        
        default:
            show_debug_message("ERROR: Unknown view.");
        break;
    }
}


// For when you change sizes, etc.
function view_reset()
{
    if (live_call()) { return live_result; }
    
    show_debug_message("Reloaded Views!");
    
    globalvar cat; // Category width;
    cat = block_size * 2;
    
    globalvar tit; // Title width;
	tit = block_size * 5;
	
	globalvar gstx; // Gantt's Start X
	gstx = cat + tit;
	
	globalvar gsty; // Gantt's Start Y
	gsty = block_size * 2;
	
	globalvar view_days; // Maximum number of days shown (colunmns).
    view_days = ds_list_create();

    globalvar view_tasks; // Maximum number of tasks shown (rows).
    view_tasks = 0;
    
    globalvar view_count; // Number of days displayed in view.
    view_count = 0;
    
    var view_count = 0;
    for (var i=gstx; i<rw; i+=block_size*2)
        view_count += 2;
        
    enum vs { pointer, day_start, day_count, LENGTH };
    
    ds_list_clear(vis);
    
    var date_min = date_current_datetime();
    var date_max = date_inc_day(date_min, view_count);
    
    var added = 0;
    for (var i=0; i<ds_list_size(task); i++)
    {
        var date_from = date_create_datetime(dsl(task, i).from_year, dsl(task, i).from_month, dsl(task, i).from_day, 0, 0, 0);
        var date_due = date_create_datetime(dsl(task, i).due_year, dsl(task, i).due_month, dsl(task, i).due_day, 0, 0, 0);
        
        if ((date_from>=date_min && date_from<=date_max) || (date_due>=date_min && date_due<=date_max))
        {
            ds_list_add(vis, dsl(task, i));
            dsl(vis, ds_list_size(vis)-1).SetPos(gstx, gsty);
            
            if (++added >= view_tasks)
                break;
        }
    }
    
    // Day Numbers
	var day_current = date_get_day(date_current_datetime());
	var month_days = date_days_in_month(date_current_datetime());
	
	ds_list_clear(view_days);
	
	var put = day_current;
	for (var i=0; i<view_count; i++)
	{
		ds_list_add(view_days, put++);
		
		if (put > month_days)
		{
			put = 1;
			month_days = date_days_in_month(date_inc_month(date_current_datetime(), 1));
		}
	}
	
	
}