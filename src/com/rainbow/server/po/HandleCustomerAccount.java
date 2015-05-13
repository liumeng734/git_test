package com.rainbow.server.po;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * <description>用户充值PO类</description> 
 * @author li-jx
 * @since 1.4
 * @version 1.0
 * @date 2014-04-27
 */
public class HandleCustomerAccount implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long id;
	private String name;
	private String reality_name;
	private BigDecimal money;
	private int user_id;
	private Timestamp datetime;
	private String pay_code;
	private String third_pay_code;	
	private String pay_type;
	private String result;
	private String Description;
	private String startTime;
	private String endTime;
	private String province;
	private String city;
	private String sex;
	private String user_type;
	private BigDecimal balance;
	private String freeze_money;
	public String getReality_name() {
		return reality_name;
	}
	public void setReality_name(String reality_name) {
		this.reality_name = reality_name;
	}
	
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public BigDecimal getBalance() {
		return balance;
	}
	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}
	public String getFreeze_money() {
		return freeze_money;
	}
	public void setFreeze_money(String freeze_money) {
		this.freeze_money = freeze_money;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BigDecimal getMoney() {
		return money;
	}
	public void setMoney(BigDecimal money) {
		this.money = money;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int i) {
		this.user_id = i;
	}
	public String getPay_code() {
		return pay_code;
	}
	public void setPay_code(String pay_code) {
		this.pay_code = pay_code;
	}
	public String getThird_pay_code() {
		return third_pay_code;
	}
	public void setThird_pay_code(String third_pay_code) {
		this.third_pay_code = third_pay_code;
	}
	public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public Timestamp getDatetime() {
		return datetime;
	}
	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
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
	
}
