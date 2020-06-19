///month_get_length(month)
function month_get_length(argument0) {

	var month_ = argument0;

	switch (month_)
	{
	    case month.january:     return 31;  break;
	    case month.february:    return 29;  break;
	    case month.march:       return 31;  break;
	    case month.april:       return 30;  break;
	    case month.may:         return 31;  break;
	    case month.june:        return 30;  break;
	    case month.july:        return 31;  break;
	    case month.august:      return 31;  break;
	    case month.september:   return 30;  break;
	    case month.october:     return 31;  break;
	    case month.november:    return 30;  break;
	    case month.december:    return 31;  break;
	}


}
