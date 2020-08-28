// Views Manager
function view_draw()
{
    switch(view)
    {
        case vw.gantt:  view_draw_gantt();  break;
        
        default:
            show_debug_message("ERROR: Unknown view.");
        break;
    }
}