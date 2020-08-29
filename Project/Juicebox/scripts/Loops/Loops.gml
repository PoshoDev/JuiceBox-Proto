/// All Loop Functions for Lightweight Objects

// Step Begin
function loop_step_begin()
{
	for (var i=0; i<ds_list_size(vis); i++)
		ds_list_find_value(vis, i).Step_Begin();
}


// Step
function loop_step()
{
	// Temp Task's Step Loop
	if (task_new != noone)
		task_new.Step();

	// All active buttons
	for (var i=0; i<array_length(button); i++)
		if (button[i] != noone)
			button[i].Step();
}


// Draw
function loop_draw()
{
	if (live_call()) { return live_result; }
	
	if (task_new != noone)
		task_new.Draw();
		
	for (var i=0; i<ds_list_size(vis); i++)
		ds_list_find_value(vis, i).Draw();
		
	for (var i=0; i<array_length(button); i++)
		if (button[i] != noone)
			button[i].Draw();
}