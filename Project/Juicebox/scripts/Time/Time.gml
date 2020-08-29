function weekday_get_int(str)
{
    switch(str)
    {
        case "sunday":	  case "sun":   return 0;      break;
        case "monday":    case "mon":   return 1;      break;
		case "tuesday":	  case "tue":   return 2;     break;
		case "wednesday": case "wed":   return 3;   break;
		case "thursday":  case "thu":   return 4;    break;
		case "friday":	  case "fri":   return 5;      break;
		case "saturday":  case "sat":   return 6;    break;
    }
}

