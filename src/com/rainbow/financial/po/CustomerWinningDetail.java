package com.rainbow.financial.po;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * 用户中奖明细表 PO
 * 
 * 
 */
public class CustomerWinningDetail implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5932542324820395914L;

	//users
	private String name;//用户昵称
	private String reality_name;//用户真实姓名
	//lottery_buy_detail
	private int id;//lottery_bug_Detail表ID购彩详情ID
	private int user_id;//用户id
	private Timestamp datetime;//购彩时间
	private int scheme_id;//方案id
	private int share;//参与份数
	private int can_quash;//能否撤销(1,能 2，否)
	private int quashed;//是否已撤销(1,是 2，否)
	private BigDecimal win_money_no_with_tax;//中奖税后金额
	//scheme
	private Timestamp scheme_datetime;//时间
	private String title;//题标
	private String description;//描述
	private int initiate_user_id;//发起人ID
	private int isuse_id;//期号ID
	private int lottery_ID;//彩种ID
	private String lottery_number;//投注号码(如果是代购这里是单注的存储，如果是合买则是多注的记录)，彩票的玩法类型存储在这里
	private int multiple;//倍数
	private BigDecimal money;//购彩所用费用
	private BigDecimal assure_money;//保底金额
	private int is_system_quashed;//是否系统撤消(1,是 2，否)
	private int lottery_buyed;//是否已出票(1,已出票 2，未出票)
	private String lottery_code;//已出票，彩票条码等标识号
	private BigDecimal win_money;//税前奖金
	private BigDecimal win_commission;//发起人佣金
	private String win_description;//中奖描述
	private int at_top_application;//方案申请置顶(1,申请置顶 2，不申请置顶)
	private int at_top;//方案是否置顶(1,置顶 2，不置顶)
	private int at_win_affiche;//是否显示在开奖公告里(1,是 2，否)
	private int secrecy_level;//方案公开级别(1-公开， 2-跟单公开， 3-截止公开， 999-不公开)
	private int buy_operator_id;//出票员
	private int win_operator_id;//开奖员
	private int scheme_is_open;//是否已经开奖(1,已开奖 2,未开奖)
	//lottery
	private String lottery_name;//彩种名称
	private int lottery_type_id;//彩种类别
	//lottery_type
	private String lottery_type_name;//彩中类别名称
	
	private String startTime;//开始时间
	private String endTime;//截至时间
	private BigDecimal startWinMoneyNoWithTax;//页面查询过滤条件最小
	private BigDecimal endWinMoneyNoWithTax;//页面查询过滤条件金额最大
	private String buy_lottery_type;//购彩方式(1-手机,2-网站)
	private BigDecimal totalMoney;
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
	public BigDecimal getStartWinMoneyNoWithTax() {
		return startWinMoneyNoWithTax;
	}
	public void setStartWinMoneyNoWithTax(BigDecimal startWinMoneyNoWithTax) {
		this.startWinMoneyNoWithTax = startWinMoneyNoWithTax;
	}
	public BigDecimal getEndWinMoneyNoWithTax() {
		return endWinMoneyNoWithTax;
	}
	public void setEndWinMoneyNoWithTax(BigDecimal endWinMoneyNoWithTax) {
		this.endWinMoneyNoWithTax = endWinMoneyNoWithTax;
	}
	public String getBuy_lottery_type() {
		return buy_lottery_type;
	}
	public void setBuy_lottery_type(String buy_lottery_type) {
		this.buy_lottery_type = buy_lottery_type;
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
	public Timestamp getDatetime() {
		return datetime;
	}
	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}
	public int getScheme_id() {
		return scheme_id;
	}
	public void setScheme_id(int scheme_id) {
		this.scheme_id = scheme_id;
	}
	public int getShare() {
		return share;
	}
	public void setShare(int share) {
		this.share = share;
	}
	public int getCan_quash() {
		return can_quash;
	}
	public void setCan_quash(int can_quash) {
		this.can_quash = can_quash;
	}
	public int getQuashed() {
		return quashed;
	}
	public void setQuashed(int quashed) {
		this.quashed = quashed;
	}
	public BigDecimal getWin_money_no_with_tax() {
		return win_money_no_with_tax;
	}
	public void setWin_money_no_with_tax(BigDecimal win_money_no_with_tax) {
		this.win_money_no_with_tax = win_money_no_with_tax;
	}
	public Timestamp getScheme_datetime() {
		return scheme_datetime;
	}
	public void setScheme_datetime(Timestamp scheme_datetime) {
		this.scheme_datetime = scheme_datetime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getInitiate_user_id() {
		return initiate_user_id;
	}
	public void setInitiate_user_id(int initiate_user_id) {
		this.initiate_user_id = initiate_user_id;
	}
	public int getIsuse_id() {
		return isuse_id;
	}
	public void setIsuse_id(int isuse_id) {
		this.isuse_id = isuse_id;
	}
	
	public String getLottery_number() {
		return lottery_number;
	}
	public void setLottery_number(String lottery_number) {
		this.lottery_number = lottery_number;
	}
	public int getMultiple() {
		return multiple;
	}
	public void setMultiple(int multiple) {
		this.multiple = multiple;
	}
	public BigDecimal getMoney() {
		return money;
	}
	public void setMoney(BigDecimal money) {
		this.money = money;
	}
	public BigDecimal getAssure_money() {
		return assure_money;
	}
	public void setAssure_money(BigDecimal assure_money) {
		this.assure_money = assure_money;
	}
	public int getIs_system_quashed() {
		return is_system_quashed;
	}
	public void setIs_system_quashed(int is_system_quashed) {
		this.is_system_quashed = is_system_quashed;
	}
	public int getLottery_buyed() {
		return lottery_buyed;
	}
	public void setLottery_buyed(int lottery_buyed) {
		this.lottery_buyed = lottery_buyed;
	}
	public String getLottery_code() {
		return lottery_code;
	}
	public void setLottery_code(String lottery_code) {
		this.lottery_code = lottery_code;
	}
	public BigDecimal getWin_money() {
		return win_money;
	}
	public void setWin_money(BigDecimal win_money) {
		this.win_money = win_money;
	}
	public BigDecimal getWin_commission() {
		return win_commission;
	}
	public void setWin_commission(BigDecimal win_commission) {
		this.win_commission = win_commission;
	}

	public int getAt_top_application() {
		return at_top_application;
	}
	public void setAt_top_application(int at_top_application) {
		this.at_top_application = at_top_application;
	}
	public int getAt_top() {
		return at_top;
	}
	public void setAt_top(int at_top) {
		this.at_top = at_top;
	}
	public int getAt_win_affiche() {
		return at_win_affiche;
	}
	public void setAt_win_affiche(int at_win_affiche) {
		this.at_win_affiche = at_win_affiche;
	}
	public int getSecrecy_level() {
		return secrecy_level;
	}
	public void setSecrecy_level(int secrecy_level) {
		this.secrecy_level = secrecy_level;
	}
	public int getBuy_operator_id() {
		return buy_operator_id;
	}
	public void setBuy_operator_id(int buy_operator_id) {
		this.buy_operator_id = buy_operator_id;
	}
	public int getWin_operator_id() {
		return win_operator_id;
	}
	public void setWin_operator_id(int win_operator_id) {
		this.win_operator_id = win_operator_id;
	}
	public int getScheme_is_open() {
		return scheme_is_open;
	}
	public void setScheme_is_open(int scheme_is_open) {
		this.scheme_is_open = scheme_is_open;
	}
	public String getLottery_name() {
		return lottery_name;
	}
	public void setLottery_name(String lottery_name) {
		this.lottery_name = lottery_name;
	}
	public int getLottery_type_id() {
		return lottery_type_id;
	}
	public void setLottery_type_id(int lottery_type_id) {
		this.lottery_type_id = lottery_type_id;
	}
	public String getLottery_type_name() {
		return lottery_type_name;
	}
	public void setLottery_type_name(String lottery_type_name) {
		this.lottery_type_name = lottery_type_name;
	}
	public int getLottery_ID() {
		return lottery_ID;
	}
	public void setLottery_ID(int lottery_ID) {
		this.lottery_ID = lottery_ID;
	}
	public String getWin_description() {
		return win_description;
	}
	public void setWin_description(String win_description) {
		this.win_description = win_description;
	}
	public BigDecimal getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(BigDecimal totalMoney) {
		this.totalMoney = totalMoney;
	}
}
