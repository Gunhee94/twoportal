package kr.ac.twoportal.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LectureTimeUtils {
	private LectureTimeUtils() {}

	private static final SimpleDateFormat HHMM = new SimpleDateFormat("HH:mm");
	private static final SimpleDateFormat E = new SimpleDateFormat("E");
	
	
	public static int getPeriodTime() {
		
		Date date = new Date();
		String now = HHMM.format(date);
		
		int compareS = now.compareTo("09:00");
		int compareE = now.compareTo("09:59");
		if(compareS > 0 && 0 > compareE) {
			return 1;
		}
		 compareS = now.compareTo("10:00");
		 compareE = now.compareTo("10:59");
		if(compareS > 0 && 0 > compareE) {
			return 2;
		}
		compareS = now.compareTo("11:00");
		compareE = now.compareTo("11:59");
		if(compareS > 0 && 0 > compareE) {
			return 3;
		}
		compareS = now.compareTo("12:00");
		compareE = now.compareTo("12:59");
		if(compareS > 0 && 0 > compareE) {
			return 4;
		}
		compareS = now.compareTo("13:00");
		compareE = now.compareTo("13:59");
		if(compareS > 0 && 0 > compareE) {
			return 5;
		}
		compareS = now.compareTo("14:00");
		compareE = now.compareTo("14:59");
		if(compareS > 0 && 0 > compareE) {
			return 6;
		}
		compareS = now.compareTo("15:00");
		compareE = now.compareTo("15:59");
		if(compareS > 0 && 0 > compareE) {
			return 7;
		}
		compareS = now.compareTo("16:00");
		compareE = now.compareTo("16:59");
		if(compareS > 0 && 0 > compareE) {
			return 8;
		}
		compareS = now.compareTo("17:00");
		compareE = now.compareTo("22:59");
		if(compareS > 0 && 0 > compareE) {
			return 9;
		}
	
		return 0;
	}
	//ex.목,월
	public static String getToday() {
		Date date = new Date();
		return E.format(date);
	}
}
