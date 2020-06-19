function mode_addnew()
{
	mode = md.addnew;
	leftbar_x = room_width - popup_width;
	task_new = new obj_task();
	
	var i = -1;
	
	button[++i] = new obj_button(leftbar_x, 64, 200, 100, "Title", function()
	{
		og.task_new.title = get_string("Title", og.task_new.title);
	});
}

			
function mode_standard()
{
	mode = md.standard;
	leftbar_x = room_width;
	task_new = noone;
	
}