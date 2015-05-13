package com.rainbow.customer.po;

import java.io.Serializable;

public class DataBaseProperties implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2081817194753210254L;

	private String driverClassName;
	private String url;
	public String getDriverClassName() {
		return driverClassName;
	}
	public void setDriverClassName(String driverClassName) {
		this.driverClassName = driverClassName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	private String userName;
	private String passWord;
}
