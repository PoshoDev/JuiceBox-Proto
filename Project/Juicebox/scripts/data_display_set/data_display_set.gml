///data_display_set(display_type)
function data_display_set(argument0) {

	enum disp { week };
	enum stk  { day, pointer };


	if (array_height_2d(global.bulk) <= 1)
	{
	    show_debug_message("Can't set, no tasks available.");
	    return;
	}
    

	var display_type = argument0;

	var count = 0;

	switch (display_type)
	{
	    case disp.week:
	        var check_day =     current_day;
	        var check_month =   current_month;
	        var check_year =    current_year;
        
        
	        show_debug_message(global.bulk[1, col.due_day]);
	        show_debug_message(typeof(month_get_length(check_month)));
        
	        for (var i=0; i<7; i++)
	        {
	            if (check_day > month_get_length(check_month))
	            {
	                check_day = 0;
	                check_month++;
	            }
            
	            for (var j=1; j<array_height_2d(global.bulk); j++)
	                if (check_day ==   global.bulk[j, col.due_day]
	                &&  check_month == global.bulk[j, col.due_month]
	                &&  check_year == global.bulk[j, col.due_year])
	                {
	                    global.stack[count, stk.day] = i;
	                    global.stack[count, stk.pointer] = j;
	                    count++;
	                }
	        }
	    break;
	}


}
