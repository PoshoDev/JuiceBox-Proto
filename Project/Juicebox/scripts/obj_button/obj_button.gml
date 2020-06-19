function obj_button(x_, y_, w_, h_, text_, action_) constructor
{
	x = x_;
	y = y_;
	w = w_;
	h = h_;
	text = text_;
	action = action_;
	
	
	Step = function()
	{
		if (point_in_rectangle(mouse_x, mouse_y, x, y, x+w, y+h) && mouse_check_button_pressed(mb_left))
			self.action();
	}
	
	
	Draw = function()
	{
		draw_set_color(c_maroon);
		draw_rectangle(x, y, x+w, y+h, false);
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(x+w/2, y+h/2, text);
		
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}
}