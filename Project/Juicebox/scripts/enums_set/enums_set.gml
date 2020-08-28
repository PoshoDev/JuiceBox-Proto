function enums_set()
{
	#macro block_add 8
	#macro block_min 8
	#macro block_max 128
	
	#macro popup_width 600
	#macro popup_height 800
	
	#macro rw room_width
	#macro rh room_height
	
	#macro og self


	enum weekday
	{
	    monday,
	    tuesday,
	    wednesday,
	    thursday,
	    friday,
	    saturday,
	    sunday
	}

	enum month
	{
	    january,
	    february,
	    march,
	    april,
	    may,
	    june,
	    july,
	    august,
	    september,
	    october,
	    november,
	    december
	}
	
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
	};
	
	// Mode
	enum md { standard, addnew };
	
	// View
	enum vw { gantt };
}
