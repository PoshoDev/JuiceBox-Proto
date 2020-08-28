/*#macro block_add 8
#macro block_min 8
#macro block_max 128

#macro popup_width 600
#macro popup_height 800

#macro og self

enum dt
{
    category,
    type_,
    title,
    notes,
    url,
    from_day,
    from_month,
    from_year,
    due_day,
    due_month,
    due_year,
    time_est,
    repeats,
    cleared,
    LENGTH
};*/

globalvar data;
data = ds_grid_create(dt.LENGTH, 0);


/*enum md { standard, addnew };
enum vw { gantt };*/

globalvar mode;
mode = md.standard;

globalvar block_size;
block_size = 16;

task_new = noone;
button[0] = noone;