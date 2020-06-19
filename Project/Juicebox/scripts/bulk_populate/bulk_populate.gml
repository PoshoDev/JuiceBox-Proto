///bulk_populate()
function bulk_populate() {
	// Basically spawns all active tasks as objects.

	global.last = noone;

	for (var i=1; i<array_height_2d(global.bulk); i++)
	{
	    /*var obj = instance_create_depth(0, 0, 0, obj_task);
    
	    obj.category =      global.bulk[i, col.category];
	    obj.type =          global.bulk[i, col.type_];
	    obj.title =         global.bulk[i, col.title];
	    obj.notes =         global.bulk[i, col.notes];
	    obj.url =           global.bulk[i, col.url];
	    obj.from_day =      global.bulk[i, col.from_day];
	    obj.from_month =    global.bulk[i, col.from_month];
	    obj.from_year =     global.bulk[i, col.from_year];
	    obj.due_day =       global.bulk[i, col.due_day];
	    obj.due_month =     global.bulk[i, col.due_month];
	    obj.due_year =      global.bulk[i, col.due_year];
	    obj.time_est =      global.bulk[i, col.time_est];
	    obj.repeats =       global.bulk[i, col.repeats];
	    obj.cleared =       global.bulk[i, col.cleared];
	    obj.next = global.last;
    
	    if (global.last != noone)
	        obj.y = global.last.y+100+8;
    
	    global.last = obj;*/
	}


}
