package kr.ac.twoportal.utils;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NumberUtils {

	private static final DecimalFormat commma = new DecimalFormat("#,###");
	
	private NumberUtils() {}
	
	public static String getNumber(int number) {
		if (number == 0) {
			return "";
		}
		return commma.format(number);
	}
	

	
	  
}
