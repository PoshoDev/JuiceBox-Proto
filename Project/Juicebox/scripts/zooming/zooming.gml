/// Zooming In/Out
function zooming()
{
    if (keyboard_check(vk_control))
    {
    	if (mouse_wheel_up() && block_size<block_max)
    		block_size += block_add;
    	else if (mouse_wheel_down() && block_size>block_min)
    		block_size -= block_add;
    		
    	view_reset();
    }
}