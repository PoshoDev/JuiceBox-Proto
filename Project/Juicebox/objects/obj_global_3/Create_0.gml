
enums_set();

// Creates the data;
globalvar task;
//data = ds_grid_create(dt.LENGTH, 0);
task = ds_list_create();

globalvar vis;  // List of the visible tasks.
vis = ds_list_create();

globalvar mode;
mode = md.standard;

globalvar view;
view = vw.gantt;

globalvar block_size;
block_size = 16;

globalvar view_days; // Maximum number of days shown (colunmns).
view_days = ds_grid_create(vs.LENGTH, 0);

enum vd { day, month, x_, LENGTH };

ds_list_add(task, new obj_task());
ds_list_add(task, new obj_task());
ds_list_add(task, new obj_task());

view_reset();

task_new = noone;   // Temp object for when you're adding something new.
button[0] = noone;  // idk rn
