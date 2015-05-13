package com.rainbow.customer.po;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * <description>客户信息表</description> 
 * @author Simple
 * @since jdk1.4
 * @version 1.0
 * 
 */
public class CustomerInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;//ID字段，主键
	private String name;//用户名
	private String reality_name;//用户真是姓名
	private String password;//用户登录密码
	private String pay_password;//用户支付密码
	private String province;//省份
	private String city;//城市
	private String sex;//性别
	private String birthDay;//生日
	private String id_card_number;//身份证
	private String address;//详细地址
	private String email;//Email
	private boolean email_valid;//邮箱是否通过验证(1,已通过 2，未通过)
	private String qq;//QQ
	private String telphone;//电话号码
	private String mobile;//移动电话
	private boolean mobile_valid;//手机是否通过验证(1,已通过 2，未通过)
	private boolean privacy;//资料保密
	private boolean blacklist;//是否在黑名单中
	private Timestamp register_time;//注册时间
	private Timestamp last_login_time;//最近一次登录的时间
	private String last_login_ip;//最近一次登录的IP
	private int login_num;//登录次数
	private int user_type;//用户类型1普通2高级
	private BigDecimal balance;//余额
	private BigDecimal freeze_money;//冻结
	private int scoring;//积分
	private String bank_type;//提现银行类别
	private String bank_name;//提现银行名字
	private String bank_card_number;//银行卡号
	private int higher_up_id;//上一级推荐人（推荐人id）（上级代理用户id）
	private String startTime;//开始时间
	private String endTime;//截至时间
	private BigDecimal rebate_rate;//如果用户是代理用户，则其下的普通用户投注时，按投注金额的这个比率给此代理用户返点
	private String flag;//标志
	private String noRecharge;//是否充值
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPay_password() {
		return pay_password;
	}
	public void setPay_password(String pay_password) {
		this.pay_password = pay_password;
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
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	public String getId_card_number() {
		return id_card_number;
	}
	public void setId_card_number(String id_card_number) {
		this.id_card_number = id_card_number;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isEmail_valid() {
		return email_valid;
	}
	public void setEmail_valid(boolean email_valid) {
		this.email_valid = email_valid;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public boolean isMobile_valid() {
		return mobile_valid;
	}
	public void setMobile_valid(boolean mobile_valid) {
		this.mobile_valid = mobile_valid;
	}
	public boolean isPrivacy() {
		return privacy;
	}
	public void setPrivacy(boolean privacy) {
		this.privacy = privacy;
	}
	public boolean isBlacklist() {
		return blacklist;
	}
	public void setBlacklist(boolean blacklist) {
		this.blacklist = blacklist;
	}
	public Timestamp getRegister_time() {
		return register_time;
	}
	public void setRegister_time(Timestamp register_time) {
		this.register_time = register_time;
	}
	public Timestamp getLast_login_time() {
		return last_login_time;
	}
	public void setLast_login_time(Timestamp last_login_time) {
		this.last_login_time = last_login_time;
	}
	public String getLast_login_ip() {
		return last_login_ip;
	}
	public void setLast_login_ip(String last_login_ip) {
		this.last_login_ip = last_login_ip;
	}
	public int getLogin_num() {
		return login_num;
	}
	public void setLogin_num(int login_num) {
		this.login_num = login_num;
	}
	public int getUser_type() {
		return user_type;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
	public BigDecimal getBalance() {
		return balance;
	}
	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}
	public BigDecimal getFreeze_money() {
		return freeze_money;
	}
	public void setFreeze_money(BigDecimal freeze_money) {
		this.freeze_money = freeze_money;
	}
	public int getScoring() {
		return scoring;
	}
	public void setScoring(int scoring) {
		this.scoring = scoring;
	}
	public String getBank_type() {
		return bank_type;
	}
	public void setBank_type(String bank_type) {
		this.bank_type = bank_type;
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
	public int getHigher_up_id() {
		return higher_up_id;
	}
	public void setHigher_up_id(int higher_up_id) {
		this.higher_up_id = higher_up_id;
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
	public BigDecimal getRebate_rate() {
		return rebate_rate;
	}
	public void setRebate_rate(BigDecimal rebate_rate) {
		this.rebate_rate = rebate_rate;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getNoRecharge() {
		return noRecharge;
	}
	public void setNoRecharge(String noRecharge) {
		this.noRecharge = noRecharge;
	}

}
