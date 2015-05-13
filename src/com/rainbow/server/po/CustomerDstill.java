package com.rainbow.server.po;

import java.io.Serializable;
import java.math.BigDecimal;

public class CustomerDstill implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;//id
	private String user_id;//用户id
	private String datetime;//提现时间
	private String money;//体现金额
	private String result;//体现结果结果(1-申请， 2-等待， 3-成功， 4-拒绝， 5-失败)
	private String accept_datetime;//同意时间
	private String bank_name;//体现银行名称
	private String bank_card_number;//提现银行卡号
	private String memo;//备注
	private String accept_operator_id;//同意人id
	private String name;//用户昵称
	private String reality_name;//真实姓名
	private String province;//客户省份
	private String city;//客户城市
	private String id_card_number;//客户身份证号
	private String balance;//客户余额
	private String freeze_money;//客户冻结金额
	private String startTime;
	private String endTime;
	//private BigDecimal totalMoney;
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
	public String getId_card_number() {
		return id_card_number;
	}
	public void setId_card_number(String id_card_number) {
		this.id_card_number = id_card_number;
	}
	public String getBalance() {
		return balance;
	}
	public void setBalance(String balance) {
		this.balance = balance;
	}
	public String getFreeze_money() {
		return freeze_money;
	}
	public void setFreeze_money(String freeze_money) {
		this.freeze_money = freeze_money;
	}
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
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getBank_card_number() {
		return bank_card_number;
	}
	public void setBank_card_number(String bank_card_number) {
		this.bank_card_number = bank_card_number;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getAccept_operator_id() {
		return accept_operator_id;
	}
	public void setAccept_operator_id(String accept_operator_id) {
		this.accept_operator_id = accept_operator_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAccept_datetime() {
		return accept_datetime;
	}
	public void setAccept_datetime(String accept_datetime) {
		this.accept_datetime = accept_datetime;
	}
	
}
