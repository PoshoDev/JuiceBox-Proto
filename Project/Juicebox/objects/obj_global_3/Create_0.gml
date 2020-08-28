
enums_set();

// Creates the data;
globalvar data;
data = ds_grid_create(dt.LENGTH, 0);

globalvar mode;
mode = md.standard;

globalvar view;
view = vw.gantt;

globalvar block_size;
block_size = 16;

task_new = noone;   // Temp object for when you're adding something new.
button[0] = noone;  // idk rn
