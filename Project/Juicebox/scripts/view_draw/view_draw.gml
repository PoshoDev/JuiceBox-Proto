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
    //if (live_call()) { return live_result; }
    
    show_debug_message("Reloading...");
    
    globalvar cat; // Category width;
    cat = block_size * 2;
    
    globalvar tit; // Title width;
	tit = block_size * 5;
	
	globalvar gstx; // Gantt's Start X
	gstx = cat + tit;
	
	globalvar gsty; // Gantt's Start Y
	gsty = block_size * 2;
	
	

    globalvar view_tasks; // Maximum number of tasks shown (rows).
    view_tasks = 64;
    
    globalvar view_count; // Number of days displayed in view.
    view_count = 0;
    
    var view_count = 0;
    for (var i=gstx; i<rw; i+=block_size*2)
        view_count += 2;
        
    // Day Numbers
	var day_current = date_get_day(date_current_datetime());
	var month_days = date_days_in_month(date_current_datetime());
	
	ds_grid_destroy(view_days);
    view_days = ds_grid_create(vd.LENGTH, view_count);
	
	var put = day_current;
	var px = gstx;
	for (var i=0; i<view_count; i++)
	{
		ds_grid_add(view_days, vd.day, i, put++);
		ds_grid_add(view_days, vd.month, i, date_get_month(date_current_datetime()));
		ds_grid_add(view_days, vd.x_, i, px);
		
		px += block_size;
		
		if (put > month_days)
		{
			put = 1;
			month_days = date_days_in_month(date_inc_month(date_current_datetime(), 1));
		}
	}
    
        
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
            var task_day = dsl(task, i).from_day;
            var task_month = dsl(task, i).from_month;
            
            var x_ = -1;
            for (var j=0; j<ds_grid_height(view_days); j++)
            {   
                var vd_day = dsg(view_days, vd.day, j);
                var vd_month = dsg(view_days, vd.month, j);
                
                if (task_day==vd_day && task_month==vd_month)
                {
                    x_ = dsg(view_days, vd.x_, j);
                    break;
                }
            }
            
            var y_ = gsty + block_size*i;
            var w_ = date_day_span(date_from, date_due);
            
            ds_list_add(vis, dsl(task, i));
            dsl(vis, ds_list_size(vis)-1).SetPos(x_, y_, w_);
            
            /*if (++added >= view_tasks)
                break;*/
        }
    }
    
    show_debug_message("Reloaded Views!");
    show_debug_message("Total Tasks: "+string(ds_list_size(task)));
    show_debug_message("Visible Tasks: "+string(ds_list_size(vis)));
    show_debug_message("View Days: "+string(ds_grid_height(view_days)));
}