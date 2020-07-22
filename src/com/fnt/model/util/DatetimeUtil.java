package com.fnt.model.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class DatetimeUtil {
	
	private String toDates;
	
	public String getToDates() {
		return toDates;
	}
	// https://nota.tistory.com/50
	public void setToDates(String prebirth) {
		// yyyy-MM-dd hh:mm:00
		String m = prebirth.substring(0, 4) + "-"
				 + prebirth.substring(4, 6) + "-"
				 + prebirth.substring(6, 8) + " "
				 + prebirth.substring(8, 10) + ":"
				 + prebirth.substring(10) + ":00";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Timestamp tm = Timestamp.valueOf(m);
		toDates = sdf.format(tm);
	}
	
	private String toDatestime;
	
	public String getToDatestime() {
		return toDatestime;
	}
	
	public void setToDatestime(String prebirth) {
		// yyyy-MM-dd hh:mm:00
		String m = prebirth.substring(0, 4) + "-"
				 + prebirth.substring(4, 6) + "-"
				 + prebirth.substring(6, 8) + " "
				 + prebirth.substring(8, 10) + ":"
				 + prebirth.substring(10) + ":00";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd. HH:mm");
		Timestamp tm = Timestamp.valueOf(m);
		toDatestime = sdf.format(tm);
	}
	
	public static String isTwo(String msg) {
		return (msg.length() < 2)? " " + msg : msg;
	}

}
