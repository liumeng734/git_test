package com.rainbow.lottery.dao;

import java.util.List;
import java.util.Map;

import com.rainbow.lottery.po.Isuse;
import com.rainbow.lottery.po.IsuseClass;
import com.rainbow.lottery.po.Lottery;
import com.simple.bsp.common.util.DataGridModel;

/**
 * <description>彩票业务中心页面展示</description> 
 * @author li-jx
 * @since 1.4
 * @version 1.0
 * @data 2015.04.25
 * 
 */
public interface LotteryDao{
	
	/**
	 * 分页查询期号信息
	 */
	public Map<String, Object> getPageList(DataGridModel dgm, Isuse isuse);
	
	/**
	 * 保存期号信息
	 */
	public int saveIsuse(Isuse isuse,List<IsuseClass> isuseList);
	
	/**
	 * 录入开奖号码
	 */
	public int updateLottery(Isuse isuse);
	
	/**
	 * 查询彩种信息
	 */
	public List getLotteryList(Isuse isuse);
	
	/**
	 * 查询期号信息
	 */
	public List getIsuseList(Isuse isuse);
	
	/**
	 * 查询所有彩种信息
	 */
	public List getLotteryList(Lottery lottery);
	
	/**
	 * 查询所有期号信息
	 */
	public List getIsuseList(Lottery lottery);
	
	/**
	 * 已作废
	 * @param lottery
	 * @return
	 */
	public List<IsuseClass> getIsuse();
	
	/**
	 * 查询时间
	 * 
	 * 
	 */
	public Isuse getLastTime(String lottery_id);
}
