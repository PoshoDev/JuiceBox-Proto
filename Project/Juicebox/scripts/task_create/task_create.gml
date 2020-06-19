function task_create() {
	//task_create();

	// Not final, but ok.

	var obj = instance_create_depth(0, 0, 0, obj_task);

	// Make object.    
	obj.category =      get_integer("Category", 0);
	obj.type =          get_integer("Type", 0);
	obj.title =         get_string("Title", "");
	obj.notes =         get_string("Notes", "");
	obj.url =           get_string("URL", "");
	obj.from_day =      get_integer("From Day", 0);
	obj.from_month =    get_integer("From Month", 0);
	obj.from_year =     get_integer("From Year", 0);
	obj.due_day =       get_integer("Due Day", 0);
	obj.due_month =     get_integer("Due Month", 0);
	obj.due_year =      get_integer("Due Year", 0);
	obj.time_est =      get_integer("Time Est", 0);
	obj.repeats =       show_question("Repeats?");
	obj.cleared =       false;
	obj.next = global.last;

	if (global.last != noone)
	    obj.y = global.last.y+100+8;

	global.last = obj;


	// Update the CSV.

	var at = array_height_2d(global.bulk);

	global.bulk[at, col.category] =     obj.category;
	global.bulk[at, col.type_] =        obj.type;
	global.bulk[at, col.title] =        obj.title;
	global.bulk[at, col.notes] =        obj.notes;
	global.bulk[at, col.url] =          obj.url;
	global.bulk[at, col.from_day] =     obj.from_day;
	global.bulk[at, col.from_month] =   obj.from_month;
	global.bulk[at, col.from_year] =    obj.from_year;
	global.bulk[at, col.due_day] =      obj.due_day;
	global.bulk[at, col.due_month] =    obj.due_month;
	global.bulk[at, col.due_year] =     obj.due_year;
	global.bulk[at, col.time_est] =     obj.time_est;
	global.bulk[at, col.repeats] =      obj.repeats;
	global.bulk[at, col.cleared] =      obj.cleared;

	csv_save(global.filename, global.bulk);



}
