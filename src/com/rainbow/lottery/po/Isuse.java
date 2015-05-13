package com.rainbow.lottery.po;

import java.io.Serializable;

/**
 * <description>彩票业务中心页面展示</description> 
 * @author li-jx
 * @since 1.4
 * @version 1.0
 * @data 2015.04.25
 * 
 */
public class Isuse implements Serializable{
	
	private static final long serialVersionUID = 1294233722161646735L;
	
	private int id;//ID字段，主键
	private int lottery_id;//所购彩种的ID
	private String lottery_Id;//id
	private String isuse;//期号名称
	private String win_lottery_number;//开奖号码
	private String start_datetime;//期当开始投注时间（每期的开始时间）
	private String end_datetime;//当期停止投注时间（每期的结束时间）
	private Boolean chase_executed;//追号任务是否已经执行
	private String open_affiche;//开奖内容
	private Boolean is_open;//否是已经开奖
	private int days;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIsuse() {
		return isuse;
	}
	public void setIsuse(String isuse) {
		this.isuse = isuse;
	}
	
	public int getLottery_id() {
		return lottery_id;
	}
	public void setLottery_id(int lottery_id) {
		this.lottery_id = lottery_id;
	}
	public String getWin_lottery_number() {
		return win_lottery_number;
	}
	public void setWin_lottery_number(String win_lottery_number) {
		this.win_lottery_number = win_lottery_number;
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
	public Boolean getChase_executed() {
		return chase_executed;
	}
	public void setChase_executed(Boolean chase_executed) {
		this.chase_executed = chase_executed;
	}
	public String getOpen_affiche() {
		return open_affiche;
	}
	public void setOpen_affiche(String open_affiche) {
		this.open_affiche = open_affiche;
	}
	public Boolean getIs_open() {
		return is_open;
	}
	public void setIs_open(Boolean is_open) {
		this.is_open = is_open;
	}
	public String getLottery_Id() {
		return lottery_Id;
	}
	public void setLottery_Id(String lottery_Id) {
		this.lottery_Id = lottery_Id;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	
}
