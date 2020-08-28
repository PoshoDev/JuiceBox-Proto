/// Modes Draw manager
function mode_draw()
{
    switch(mode)
    {
	    case md.addnew: mode_draw_addnew(); break;
    }
}


function mode_draw_addnew()
{
	/*// The Info Region
    draw_rectangle_color(leftbar_x, 0, room_width, room_height, c_black, c_white, c_black, c_white, false);
    
    // The Text Stuff
	draw_set_color(c_orange);
	draw_text(leftbar_x, 0, "Add New");*/
	
	// Container Background
	draw_set_color(c_white);
	draw_rectangle(leftbar_x, 0, rw, rh, false);
	
	container_addnew.Render();
	EmuOverlay.Render();
}