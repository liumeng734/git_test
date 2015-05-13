package com.rainbow.customer.po;

import java.io.Serializable;

/**
 * <description>用户登录日志PO</description>
 * @author li-jx
 * @since 1.4
 * @version 1.0
 * @date 2015-04-25
 * 
 */
public class CustomerLoginLog implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;//日志表ID
	private String user_id;//用户ID
	private String login_time;//登录时间
	private String ip;//登录IP地址
	private String description;//描述信息
	private String startTime;//开始日期
	private String endTime;//截至日期
	private String name;//用户昵称
	private String reality_name;//用户真实姓名
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getLogin_time() {
		return login_time;
	}
	public void setLogin_time(String login_time) {
		this.login_time = login_time;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReality_name() {
		return reality_name;
	}
	public void setReality_name(String reality_name) {
		this.reality_name = reality_name;
	}
	
}
