package com.fnt.util;

public class Util {
	public static Integer getInteger(String value) {
		try {
			return Integer.parseInt(value);
		} catch (NumberFormatException e) {
			return null;
		}
	}
	
	public static int getIntegerWithDefaultValue(String value, int defaultValue) {
		Integer result = getInteger(value);
		
		return result == null ? defaultValue : result;
	}
}
