/// @param file
///bulk_start(filename)
function bulk_start(argument0) {

	var file = argument0;

	/*enum col
	{
	    category,
	    type_,
	    title,
	    notes,
	    url,
	    from_day,
	    from_month,
	    from_year,
	    due_day,
	    due_month,
	    due_year,
	    time_est,
	    repeats,
	    cleared
	};*/

	if (!file_exists(file+".csv"))
	{
	    global.bulk[0, col.category] =      "Category";
	    global.bulk[0, col.type_] =         "Type";
	    global.bulk[0, col.title] =         "Title";
	    global.bulk[0, col.notes] =         "Notes";
	    global.bulk[0, col.url] =           "URL";
	    global.bulk[0, col.from_day] =      "From Day";
	    global.bulk[0, col.from_month] =    "From Month";
	    global.bulk[0, col.from_year] =     "From Year";
	    global.bulk[0, col.due_day] =       "Due Day";
	    global.bulk[0, col.due_month] =     "Due Month";
	    global.bulk[0, col.due_year] =      "Due Year";
	    global.bulk[0, col.time_est] =      "Time Est.";
	    global.bulk[0, col.repeats] =       "Repeats";
	    global.bulk[0, col.cleared] =       "Cleared";
    
	    csv_save(file, global.bulk);
	}
	else
	    global.bulk = csv_load(file);


}
