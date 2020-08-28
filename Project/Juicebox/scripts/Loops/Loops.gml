/// All Loop Functions for Lightweight Objects

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
	if (task_new != noone)
		task_new.Draw();
		
	for (var i=0; i<array_length(button); i++)
		if (button[i] != noone)
			button[i].Draw();
}