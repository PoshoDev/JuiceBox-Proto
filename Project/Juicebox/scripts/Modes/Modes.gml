function mode_addnew()
{
	mode = md.addnew;
	leftbar_x = rw - popup_width;
	task_new = new obj_task();
	
	/*var i = -1;
	
	// Buttons
	button[++i] = new obj_button(leftbar_x, 64, 200, 100, "Title", function()
		{ og.task_new.title = get_string("Title", og.task_new.title); });
		
	button[++i] = new obj_button(leftbar_x, 200, 200, 100, "Lol", function()
		{ og.task_new.title = get_string("Lal", og.task_new.title); });*/
		
	// Container
	container_addnew = new EmuCore(leftbar_x, 0, rw-leftbar_x, rh);
	
	// Tabs
	var tab_group = new EmuTabGroup(0, 0, rw-leftbar_x, 600, 1, 32);
	var tab_newtask = new EmuTab("New Task");
	
	tab_group.AddTabs(0, [tab_newtask]);
	container_addnew.AddContent(tab_group);
	
	// New Task Tab
	tab_newtask.AddContent([
		new EmuText(32, EMU_AUTO, 512, 32, "New Task"),
		new EmuTextbox_H(32, EMU_AUTO, 512, 32, "Title:", task_new.title, "Empty", 32, E_InputTypes.STRING, function()
			{ task_new.title = value })
	]);
}


function mode_standard()
{
	mode = md.standard;
	leftbar_x = room_width;
	task_new = noone;
	
}