if (live_call()) { return live_result; }

if (keyboard_check(vk_control))
{
	if (mouse_wheel_up() && block_size<block_max)
		block_size += block_add;
	else if (mouse_wheel_down() && block_size>block_min)
		block_size -= block_add;
}

switch(mode)
{
	case md.addnew:
		if (keyboard_check_pressed(ord("N")))
		{
			mode_standard();
		}
	break;
	
	
	default:
		if (keyboard_check_pressed(ord("N")))
		{
			mode_addnew();
		}
	break;
}

// The all.
if (task_new != noone)
	task_new.Step();
	
for (var i=0; i<array_length(button); i++)
	if (button[i] != noone)
		button[i].Step();