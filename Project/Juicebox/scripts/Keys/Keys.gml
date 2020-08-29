// All Keyboard Key Checkers
function key_manager()
{
	key_n();
	
	key_global_shortcut_addnew();
}


function key_n()
{
	if (keyboard_check_pressed(ord("N")))
	{
		switch(mode)
		{
			case md.addnew:	mode_standard();	break;
			default:		mode_addnew();		break;
		}
	}
}

function key_global_shortcut_addnew()
{
	// BAS tarea 1. from tomorrow due May 10 ~30m repeats weekly url:lol.com
	if (live_call()) { return live_result; }
	
	var key_1 = keyboard_check_direct(vk_control);
	var key_2 = keyboard_check_direct(vk_shift);
	var key_3 = keyboard_check_direct(ord("Y"));
	
	if (key_1 && key_2 && key_3)
	{
		// Temp Object
		task_new = new obj_task();
		
		fin = false;
		str2 = "";
		while (!fin)
		{
			var errors= "";
			
			// Getting
			str2 = get_string("New Task", str2);
			var str = string_lower(str2);
			
			if (str2 == "")
				break;
			
			// Category
			var pos = string_pos(" ", str2);
			if (pos == 4)
				{}
			else
				errors += "\nCategory is mandatory.";
			
			
			// Title
			var pos = string_pos(".", str2);
			if (pos)
				task_new.title = string_copy(str2, 5, pos-5);
			else
				errors += "\nTitle needs a '.'";
			
			
			// URL
			task_new.url = keyword_find_string(str, "url:");
			
			
			// Due
			var time = 0;
			
			found = keyword_find_string(str, "due ");
			show_debug_message(found)
			switch(found)
			{
				case "tomorrow":
				
				break;
				
				case "today":
				case "now":
				
				
				break;
				
				
				case "january":   case "jan":
				case "february":  case "feb":
				case "march":     case "mar":
				case "april":     case "apr":
				case "may":                  
				case "june":      case "jun":
				case "july":      case "jul":
				case "august":    case "aug":
				case "september": case "sep":
				case "october":   case "oct":
				case "november":  case "nov":
				case "december":  case "dec":
					var cm = date_get_month(date_current_datetime());
					var dm = month_get_int(found);
					show_debug_message("Month "+string(dm))
						
					var year = (cm >= dm) ? date_get_year(date_inc_year(date_current_datetime(), 1)) : date_get_year(date_current_datetime());
					
					var count = 0;
					do
					{
						cm = (cm>=11) ? 0 : cm+1;
						count++;
					}
					until (cm == dm);
					
					time = date_inc_month(date_current_datetime(), count);
					
					var pos = string_pos("due ", str) + 4 + string_length(found) + 1;
					
					var day = 0;
					
					// 1st Number
					var cha1 = string_char_at(str, pos);
					if (cha1>="0" && cha1<="9")
					{
						// 2nd Number
						var cha2 = string_char_at(str, pos+1);
						if (cha2>="0" && cha2<="9")
							day = real(cha1+cha2);
						else
							day = real(cha1);
					}
					else
						errors += "\nNo due date number found.\nCHA: "+cha;
						
					task_new.due_day = day;
					task_new.due_month = date_get_month(time);
					task_new.due_year = year;
				break;
				
				case "sunday":		case "sun":
				case "monday":		case "mon":
				case "tuesday":		case "tue":
				case "wednesday":	case "wed":
				case "thursday":	case "thu":
				case "friday":		case "fri":
				case "saturday":	case "sat":
					var cd = date_get_weekday(date_current_datetime());
					var dd = weekday_get_int(found);
						
					var count = 0;
					do
					{
						cd = (cd>=6) ? 0 : cd+1;
						count++;
					}
					until (cd == dd);
					
					time = date_inc_day(date_current_datetime(), count);
					task_new.due_day = date_get_day(time);
					task_new.due_month = date_get_month(time);
					task_new.due_year = date_get_month(time);
				break;
				
				default:
					errors += "\nDue date is missing or wrong.";
				break;
			}
			
			
			// Time Est.
			var found = keyword_find_string(str, "~");
			if (found != "")
			{
				var num = real(string_delete(found, string_length(found), 1));
				
				if (string_char_at(found, string_length(found)) == "h")
					num *= 60;
					
				task_new.time_est = num;
			}
			
			
			if (errors == "")
			{
				// Final Question:
				var say = "Add the following task?\n";
				say += value_display("Category",	task_new.category);
				say += value_display("Type",		task_new.type_);
				say += value_display("Title",		task_new.title);
				say += "\n";
				say += value_display("Notes",		task_new.notes);
				say += value_display("URL", 		task_new.url);
				say += "\n";
				say += value_display("From Day",	task_new.from_day);
				say += value_display("From Month",	task_new.from_month);
				say += "\n";
				say += value_display("Due Day", 	task_new.due_day);
				say += value_display("Due Month",	task_new.due_month);
				say += "\n";
				say += value_display("Time Est.",	task_new.time_est);
				say += value_display("Repeats", 	task_new.repeats);
				
				fin = show_question(say)
			}
			else
				show_message("Syntax Errors:\n"+errors);
		}
	}
}

function keyword_find_string(str, keyw)
{
	var pos = string_pos(keyw, str);
	if (pos)
	{
		var klen = string_length(keyw);
		var tempstr = string_copy(str, pos+klen, string_length(str));
		
		var pos2 = string_pos(" ", tempstr);
		if (!pos2)
			pos2 = string_length(tempstr);
			
		return string_replace(string_copy(str, pos+klen, pos2), " ", "");
	}
	else
		return "";
}

function value_display(str, val)
{
	switch(typeof(val))
	{
		case "number":
			if (val!=-1 && val!=0)
				return "\n"+str+": "+string(val);
			else
				return "";
		break;
		
		case "string":
			if (val != "")
				return "\n"+str+": "+val;
			else
				return "";
		break;
		
		case "bool":
			if (val != false)
				return "\n"+str+": TRUE";
			else
				return "";
		break;
	}
}