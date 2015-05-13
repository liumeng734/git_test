package com.rainbow.lottery.po;

import java.io.Serializable;

public class IsuseClass implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5342484994002421059L;

	private String id;
	private String start_datetime;
	private String end_datetime;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStart_datetime() {
		return start_datetime;
	}
	public void setStart_datetime(String start_datetime) {
		this.start_datetime = start_datetime;
	}
	public String getEnd_datetime() {
		return end_datetime;
	}
	public void setEnd_datetime(String end_datetime) {
		this.end_datetime = end_datetime;
	}
}
