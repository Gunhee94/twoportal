package kr.ac.twoportal.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	private static final SimpleDateFormat YYYY = new SimpleDateFormat("yyyy");
	private static final SimpleDateFormat MM = new SimpleDateFormat("MM");
	private static final SimpleDateFormat YYYYMMDD = new SimpleDateFormat("yyyy-MM-dd");
	
	private DateUtils() {}
	
	public static String getYear(Date date) {
		if (date == null) {
			return "";
		}
		return YYYY.format(date);
	}
	
	public static String getMonth(Date date) {
		if (date == null) {
			return "";
		}
		return MM.format(date);
	}
	

	
	public static String getYYYYMMDD(Date date) {
		if (date == null) {
			return "";
		}
		return YYYYMMDD.format(date);
	}
	
	
}
