package com.rainbow.lottery.dao.impl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rainbow.lottery.dao.LotteryDao;
import com.rainbow.lottery.po.Isuse;
import com.rainbow.lottery.po.IsuseClass;
import com.rainbow.lottery.po.Lottery;
import com.simple.bsp.common.util.DBUtil;
import com.simple.bsp.common.util.DataGridModel;

/**
 * <description>彩票业务中心页面展示</description> 
 * @author li-jx
 * @since 1.4
 * @version 1.0
 * @data 2015.04.25
 * 
 */
@Repository("lotteryDao")
public class LotteryDaoImpl implements LotteryDao{
	
	@Autowired
	private DBUtil util;
	
	/**
	 * 分页查询期号信息
	 */
	public Map<String, Object> getPageList(DataGridModel dgm, Isuse isuse){
		
		//查询结果Map
		Map<String, Object> result = new HashMap<String, Object>(2);
		
		//获取记录数
		StringBuffer sumSql = new StringBuffer();
		sumSql.append("select count(1) from isuse where 1=1");
		
		//获取结果集
		String quSql = "select id, lottery_id, isuse, date_format(start_datetime,'%Y-%m-%d%   %H:%i:%S') start_datetime,date_format(end_datetime,'%Y-%m-%d%   %H:%i:%S') end_datetime " +
				" from isuse where 1=1 ";
		
		//组装查询条件
		StringBuffer sqlSb = new StringBuffer();
		Map<String, Object> params = new HashMap<String,Object>();
		
		//点击查询按钮时组装查询语句
		//组装排序规则
		String orderString = "";
		if(StringUtils.isNotBlank(dgm.getSort())){
			orderString = " order by " + dgm.getSort() + " " + dgm.getOrder();
		}
		
		//组装分页定义
		String pageString = " limit "+(dgm.getPage() - 1) * dgm.getRows() + ", " + dgm.getRows();
		
		//绑定查询结果('total'和'rows'名称不能修改)
		result.put("total", util.getObjCount(sumSql.toString()));
		result.put("rows", util.getMapList(quSql + sqlSb.toString() + orderString + pageString, params));
		return result;
	}
	
	/**
	 * 保存期号信息
	 */
	public int saveIsuse(Isuse isuse,List<IsuseClass> isuseList){
		String sql = "insert into isuse ( lottery_id, isuse, start_datetime,end_datetime) " +
				 "values ( :lottery_Id, :isuse,  :start_datetime , :end_datetime)";
		int result = 1;
		for(int i =0; i < isuseList.size(); i++){
			isuse.setIsuse(isuseList.get(i).getId());
			isuse.setStart_datetime(isuseList.get(i).getStart_datetime());
			isuse.setEnd_datetime(isuseList.get(i).getEnd_datetime());
		//	isuse.setId(Integer.valueOf(isuseList.get(i).getId().substring(0, 4) + isuseList.get(i).getId().substring(5, isuseList.get(i).getId().length())));
			if(util.editObject(sql, isuse) <= 0){
				result = 0;
			}			
		}
		return result;
		
	}
	
	/**
	 * 录入开奖号码
	 */
	public int updateLottery(Isuse isuse){
		String sql = "update isuse set win_lottery_number = :win_lottery_number "+
				" where lottery_id = :lottery_id and isuse = :isuse";
		return util.editObject(sql, isuse);
	}
	
	/**
	 * 查询彩种信息
	 */
	public List getLotteryList(Isuse isuse){
	
	//获取结果集
	String quSql = "SELECT id,lottery_id,(SELECT l.name FROM lottery l WHERE l.id = i.lottery_id) name FROM isuse i where 1=1 GROUP BY lottery_id ";
			
	//组装查询条件
	Map<String, Object> params = new HashMap<String,Object>();
	return util.getMapList(quSql, params);
	}
	
	/**
	 * 查询期号信息
	 */
	public List getIsuseList(Isuse isuse){
	
	//获取结果集
	String quSql = "SELECT id,lottery_id,isuse FROM isuse i where 1=1 and lottery_id = ";
	StringBuffer sqlSb = new StringBuffer();
	sqlSb.append(isuse.getLottery_id());
	//组装查询条件
	Map<String, Object> params = new HashMap<String,Object>();
	return util.getMapList(quSql+sqlSb.toString(), params);
	}
	
	/**
	 * 查询所有彩种信息
	 */
	public List getLotteryList(Lottery lottery){
	
	//Map<String, Object> params = new HashMap<String, Object>;
	//获取结果集
	String quSql = "SELECT id,name FROM lottery i where 1=1";
			
	//组装查询条件
	Map<String, Object> params = new HashMap<String,Object>();
	//return (List<Lottery>) util.getObject(quSql, params, Lottery.class);
	return util.getMapList(quSql, params);
	}
	
	/**
	 * 查询所有期号信息
	 */
	public List getIsuseList(Lottery lottery){
	
	//获取结果集
	String quSql = "SELECT id,isuse FROM isuse i where 1=1";
	//组装查询条件
	Map<String, Object> params = new HashMap<String,Object>();
	return util.getMapList(quSql, params);
	}

	@Override
	public List<IsuseClass> getIsuse() {
		// TODO Auto-generated method stub
		String quSql = "select id, start_datetime, end_datetime from isuse_class";
		Map<String, Object> params = new HashMap<String,Object>();
		return (List<IsuseClass>) util.getObjList(quSql, params, IsuseClass.class);
	}

	@Override
	public Isuse getLastTime(String lottery_id) {
		// TODO Auto-generated method stub
		String sql = "select max(start_datetime) as start_datetime from isuse where 1=1 and lottery_id = :lottery_id";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("lottery_id", lottery_id);
		return (Isuse) util.getObject(sql, params, Isuse.class);
	}
}
