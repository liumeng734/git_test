package com.rainbow.lottery.service.impl;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.lottery.dao.LotteryDao;
import com.rainbow.lottery.po.Isuse;
import com.rainbow.lottery.po.IsuseClass;
import com.rainbow.lottery.po.Lottery;
import com.rainbow.lottery.service.LotteryService;
import com.simple.bsp.common.util.DataGridModel;

/**
 * <description>彩票业务中心页面展示</description> 
 * @author li-jx
 * @since 1.4
 * @version 1.0
 * @data 2015.04.25
 * 
 */
@Service("lotteryService")
public class LotteryServiceImpl implements LotteryService{
	
	
	
	@Autowired
	private LotteryDao lotteryDao;
	
	/**
	 * 分页查询角色
	 * @param dgm
	 * @param org
	 * @return
	 */
	public Map<String, Object> getPageList(DataGridModel dgm, Isuse isuse){
		return lotteryDao.getPageList(dgm, isuse);
	}
	
	/**
	 * 保存期号信息
	 * @param isuse
	 * @return
	 */
	public int saveIsuse(Isuse isuse,List<IsuseClass> isuseList){
		return lotteryDao.saveIsuse(isuse,isuseList);
	}
	
	/**
	 * 录入开奖号码
	 * @param lottery
	 * @return
	 */
	public int updateLottery(Isuse isuse){
		return lotteryDao.updateLottery(isuse);
	}
	
	/**
	 * 查询彩种
	 * @param lottery
	 * @return
	 */
	public List getLotteryList(Isuse isuse){
		return lotteryDao.getLotteryList(isuse);
	}
	
	/**
	 * 查询期号
	 * @param lottery
	 * @return
	 */
	public List getIsuseList(Isuse isuse){
		return lotteryDao.getIsuseList(isuse);
	}
	
	/**
	 * 查询彩种
	 * @param lottery
	 * @return
	 */
	public List getLotteryList(Lottery lottery){
		return lotteryDao.getLotteryList(lottery);
	}
	
	/**
	 * 查询期号
	 * @param lottery
	 * @return
	 */
	public List getIsuseList(Lottery lottery){
		return lotteryDao.getIsuseList(lottery);
	}

	@Override
	public List<IsuseClass> getIsuse() {
		// TODO Auto-generated method stub
		return lotteryDao.getIsuse();
	}

	@Override
	public Isuse getLastTime(String lottery_id) {
		// TODO Auto-generated method stub
		return lotteryDao.getLastTime(lottery_id);
	}
	
}
