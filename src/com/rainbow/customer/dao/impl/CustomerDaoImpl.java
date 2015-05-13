package com.rainbow.customer.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rainbow.customer.dao.CustomerDao;
import com.rainbow.customer.po.CustomerInfo;
import com.rainbow.customer.po.CustomerLoginLog;
import com.rainbow.customer.po.CustomerMoneyDetail;
import com.rainbow.customer.po.CustomerRecharge;
import com.simple.bsp.common.util.DBUtil;
import com.simple.bsp.common.util.DataGridModel;

import common.Logger;

/**
 * <description>客户信息处理类Dao层实现</description> 
 * @author Simple
 * @since 1.4
 * @version 1.0
 */
@Repository("customerDao")
public class CustomerDaoImpl implements CustomerDao{

	@Autowired
	private DBUtil util;
	
	private static Logger logger = Logger.getLogger(CustomerDaoImpl.class);
	/**
	 * <function>查询界面接口 </function>
	 * @param DataGridModel dgm
	 * @param CustomerInfo customerInfo
	 * @return Map<String,Object>
	 * 
	 */
	public Map<String, Object> queryCustomerInfo(DataGridModel dgm, CustomerInfo customerInfo){
		Map<String, Object> result = new HashMap<String, Object>();
		//获取记录数
		StringBuffer sumSql = new StringBuffer();
		sumSql.append("select count(1) from users where 1=1 ");
				
		//获取结果集
		String quSql = "select id, name, reality_name, password, pay_password, province, city, sex, birthday, id_card_number,"
				+ "address, email,email_valid, qq, telphone, mobile, mobile_valid, privacy, blacklist, "
				+ "date_format(register_time,'%Y-%m-%d%   %H:%i:%S') AS register_time,  date_format(last_login_time,'%Y-%m-%d%   %H:%i:%S') as last_login_time,"
				+ "last_login_ip, login_num, "
				+ "user_type, balance, freeze_money, scoring, bank_type, bank_name, bank_card_number,"
				+ "higher_up_id, rebate_rate "
				+ "from users "
				+ "where 1=1 ";
		StringBuffer sqlSb = new StringBuffer();
		Map<String, Object> params = new HashMap<String,Object>();
		if(!("").equals(customerInfo.getName()) && customerInfo.getName() != null){
			sqlSb.append(" and name like :name");
			params.put("name","%"+customerInfo.getName()+"%");
			sumSql.append(" and name like '%").append(customerInfo.getName()).append("%'");
		}
		if(!("").equals(customerInfo.getReality_name()) && customerInfo.getReality_name() != null){
			sqlSb.append(" and reality_name like :reality_name");
			params.put("reality_name","%"+customerInfo.getReality_name()+"%");
			sumSql.append(" and reality_name like '%").append(customerInfo.getReality_name()).append("%'");
		}		
		if(!("").equals(customerInfo.getStartTime()) && customerInfo.getStartTime() != null){
			sqlSb.append(" and last_login_time > :startTime");
			params.put("startTime",customerInfo.getStartTime());
			sumSql.append(" and last_login_time > '").append(customerInfo.getStartTime()).append("'");
		}
		if(!("").equals(customerInfo.getEndTime()) && customerInfo.getEndTime() != null){
			sqlSb.append(" and last_login_time < :endTime");
			params.put("endTime",customerInfo.getEndTime());
			sumSql.append(" and last_login_time < '").append(customerInfo.getEndTime()).append("'");
		}	
		//组装排序规则
		String orderString = "";
		if(StringUtils.isNotBlank(dgm.getSort())){
			orderString = " order by " + dgm.getSort() + " " + dgm.getOrder();
		}
		//组装分页定义
		String pageString = " limit "+(dgm.getPage() - 1) * dgm.getRows() + ", " + dgm.getRows();
				
		//System.out.println("["+sumSql.toString()+"]");
		//System.out.println("["+quSql + sqlSb.toString() + orderString + pageString+"]");
				
		//绑定查询结果('total'和'rows'名称不能修改)
		result.put("total", util.getObjCount(sumSql.toString()));
		result.put("rows", util.getMapList(quSql + sqlSb.toString() + orderString + pageString, params));
		return result;
		
	};
	
	public Map<String, Object> queryCustomerLoginLog(DataGridModel dgm, CustomerLoginLog loginLog){
		Map<String, Object> result = new HashMap<String, Object>();
		//获取记录数
		StringBuffer sumSql = new StringBuffer();
		sumSql.append("select count(1) from login_log , users  where 1=1 and users.id = login_log.user_id ");
						
		//获取结果集
		String quSql = "select log.id, log.user_id, u.name, u.reality_name, u.province, u.city, log.ip, u.login_num ,"
				+ " u.last_login_ip, date_format(u.last_login_time,'%Y-%m-%d%   %H:%i:%S') as last_login_time,"
				+ " date_format(log.login_time,'%Y-%m-%d%   %H:%i:%S') as login_time,log.description "
				+ " from users u, login_log log "
				+ "where 1=1 and u.id = log.user_id ";
		StringBuffer sqlSb = new StringBuffer();
		Map<String, Object> params = new HashMap<String,Object>();
		if(!("").equals(loginLog.getName()) && loginLog.getName() != null){
			sqlSb.append(" and u.name like :name");
			params.put("name","%"+loginLog.getName()+"%");
			sumSql.append(" and users.name like '%").append(loginLog.getName()).append("%'");
		}
		if(!("").equals(loginLog.getReality_name()) && loginLog.getReality_name() != null){
			sqlSb.append(" and u.reality_name like :reality_name");
			params.put("reality_name","%"+loginLog.getReality_name()+"%");
			sumSql.append(" and users.reality_name like '%").append(loginLog.getReality_name()).append("%'");
		}		
		
		if(!("").equals(loginLog.getStartTime()) && loginLog.getStartTime() != null){
			sqlSb.append(" and log.login_time > :startTime");
			params.put("startTime",loginLog.getStartTime());
			sumSql.append(" and login_log.login_time > '").append(loginLog.getStartTime()).append("'");
		}
		if(!("").equals(loginLog.getEndTime()) && loginLog.getEndTime() != null){
			sqlSb.append(" and log.login_time < :endTime");
			params.put("endTime",loginLog.getEndTime());
			sumSql.append(" and login_log.login_time < '").append(loginLog.getEndTime()).append("'");
		}

				
	//组装排序规则
	String orderString = "";
	if(StringUtils.isNotBlank(dgm.getSort())){
			orderString = " order by " + dgm.getSort() + " " + dgm.getOrder();
	}
	//组装分页定义
	String pageString = " limit "+(dgm.getPage() - 1) * dgm.getRows() + ", " + dgm.getRows();
						
	//System.out.println("["+sumSql.toString()+"]");
	//System.out.println("["+quSql + sqlSb.toString() + orderString + pageString+"]");
						
	//绑定查询结果('total'和'rows'名称不能修改)
	result.put("total", util.getObjCount(sumSql.toString()));
	result.put("rows", util.getMapList(quSql + sqlSb.toString() + orderString + pageString, params));
	return result;
	}

	@Override
	public int[] deleteCustomerLog(List<String> idList) {
		// TODO Auto-generated method stub
		String sql = "delete from login_log where 1=1 and id = ?";
		return util.batchDelete(sql, idList);
	}

	@Override
	public int saveCustomerMoney(CustomerRecharge customerRecharge) {
		// TODO Auto-generated method stub
		String sql = "update users set balance = :money where users.name = :name";
		int i = util.editObject(sql, customerRecharge);
		if(i > 0){
			customerRecharge.setResult(i);
			String insertSql = "insert into users_pay_detail (id, user_id, datetime,pay_code, third_pay_code, pay_type, money, result)"
					+ "values(:id, :user_id, :datetime, :pay_code, :third_pay_code, :pay_type, :money, :result)";
			util.editObject(insertSql, insertSql);
		}else{
			customerRecharge.setResult(2);
			String insertSql = "insert into users_pay_detail (id, user_id, datetime,pay_code, third_pay_code, pay_type, money, result)"
					+ "values(:id, :user_id, :datetime, :pay_code, :third_pay_code, :pay_type, :money, :result)";
			util.editObject(insertSql, insertSql);
		}
		return i;
	}

	@Override
	public CustomerInfo queryCustomerBalance(String Name) {
		// TODO Auto-generated method stub
		String sql = "select balance, id "
				+ "from users "
				+ "where 1=1 and name = :name";
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("name", Name);
		return (CustomerInfo) util.getObject(sql, params,CustomerInfo.class);
	}

	@Override
	public Map<String, Object> queryCustomerMoney(DataGridModel dgm,
			CustomerMoneyDetail moneyDetail) {
		System.out.println(moneyDetail.getOperator_type());
		// TODO Auto-generated method stub
		Map<String, Object> result = new HashMap<String, Object>();
		//获取记录数
		StringBuffer sumSql = new StringBuffer();
		sumSql.append("select count(1) from users_money_detail , users  where 1=1 and users.id = users_money_detail.user_id ");
						
		//获取结果集
		String quSql = "select umd.id, umd.user_id, date_format(umd.datetime,'%Y-%m-%d%   %H:%i:%S') as datetime, umd.operator_type , umd.operator_status,"
				+ "umd.money, umd.commission, umd.account_balance, umd.memo, u.name "
				+ " from users u, users_money_detail umd "
				+ " where 1=1 and u.id = umd.user_id ";
		
		StringBuffer sqlSb = new StringBuffer();
		Map<String, Object> params = new HashMap<String,Object>();
		if(!("").equals(moneyDetail.getName()) && moneyDetail.getName() != null){
			sqlSb.append(" and u.name like :name");
			params.put("name","%"+moneyDetail.getName()+"%");
			sumSql.append(" and users.name like '%").append(moneyDetail.getName()).append("%'");
		}
		if(!("").equals(moneyDetail.getOperator_type()) && moneyDetail.getOperator_type() != null){
			sqlSb.append(" and umd.operator_type like :operator_type");
			params.put("operator_type","%"+moneyDetail.getOperator_type()+"%");
			sumSql.append(" and users_money_detail.operator_type like '%").append(moneyDetail.getOperator_type()).append("%'");
		}
		
		if(!("").equals(moneyDetail.getStartTime()) && moneyDetail.getStartTime() != null){
			sqlSb.append(" and umd.datetime > :startTime");
			params.put("startTime",moneyDetail.getStartTime());
			sumSql.append(" and users_money_detail.datetime > '").append(moneyDetail.getStartTime()).append("'");
		}
		if(!("").equals(moneyDetail.getEndTime()) && moneyDetail.getEndTime() != null){
			sqlSb.append(" and umd.datetime < :endTime");
			params.put("endTime",moneyDetail.getEndTime());
			sumSql.append(" and users_money_detail.datetime < '").append(moneyDetail.getEndTime()).append("'");
		}

				
	//组装排序规则
	String orderString = "";
	if(StringUtils.isNotBlank(dgm.getSort())){
			orderString = " order by " + dgm.getSort() + " " + dgm.getOrder();
	}
	//组装分页定义
	String pageString = " limit "+(dgm.getPage() - 1) * dgm.getRows() + ", " + dgm.getRows();
						
	//System.out.println("["+sumSql.toString()+"]");
	//System.out.println("["+quSql + sqlSb.toString() + orderString + pageString+"]");
						
	//绑定查询结果('total'和'rows'名称不能修改)
	result.put("total", util.getObjCount(sumSql.toString()));
	result.put("rows", util.getMapList(quSql + sqlSb.toString() + orderString + pageString, params));
	return result;
	}
	
	
}
