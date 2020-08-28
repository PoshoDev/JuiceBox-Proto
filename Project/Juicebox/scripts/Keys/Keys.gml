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
	var key_1 = keyboard_check_direct(vk_control);
	var key_2 = keyboard_check_direct(vk_shift);
	var key_3 = keyboard_check_direct(ord("T"));
	
	if (key_1 && key_2 && key_3)
	{
		get_string("lol", "kay");
	}
}