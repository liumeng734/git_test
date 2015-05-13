package com.rainbow.customer.po;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

public class CustomerMoneyDetail implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1403281737676790159L;

	private int id;
	private int user_id;
	private String name;
	private Timestamp datetime;
	private String operator_type;
	private String operator_status;
	private BigDecimal money;
	private BigDecimal commission;
	private BigDecimal account_balance;
	private String memo;
	private String startTime;
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
	private String endTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getDatetime() {
		return datetime;
	}
	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}

	public BigDecimal getMoney() {
		return money;
	}
	public void setMoney(BigDecimal money) {
		this.money = money;
	}
	public BigDecimal getCommission() {
		return commission;
	}
	public void setCommission(BigDecimal commission) {
		this.commission = commission;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public BigDecimal getAccount_balance() {
		return account_balance;
	}
	public void setAccount_balance(BigDecimal account_balance) {
		this.account_balance = account_balance;
	}
	public String getOperator_type() {
		return operator_type;
	}
	public void setOperator_type(String operator_type) {
		this.operator_type = operator_type;
	}
	public String getOperator_status() {
		return operator_status;
	}
	public void setOperator_status(String operator_status) {
		this.operator_status = operator_status;
	}
}
