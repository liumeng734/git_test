package com.rainbow.server.dao.impl;

import java.math.BigDecimal;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.rainbow.customer.po.DataBaseProperties;
import com.rainbow.customer.util.PropertyUtil;
import com.rainbow.server.dao.serverSupportCenterDao;
import com.rainbow.server.po.CustomerDstill;
import com.rainbow.server.po.HandleCustomerAccount;
import com.rainbow.server.web.serverSupportCenterController;
import com.simple.bsp.common.util.DBUtil;
import com.simple.bsp.common.util.DataGridModel;

@Repository("serverDao")
public class serverSupportCenterDaoImpl implements serverSupportCenterDao{

	@Autowired
	private DBUtil util;
	
	private static Logger log = Logger.getLogger(serverSupportCenterController.class);
	//用来办理用户提款的
	private Connection getConnection(){
		Connection conn = null;
		PropertyUtil propetyUtil = new PropertyUtil();		
		try {			
			DataBaseProperties dataBase = propetyUtil.getProperty();
			Class.forName(dataBase.getDriverClassName());
			conn = (Connection) DriverManager.getConnection(dataBase.getUrl(), dataBase.getUserName(), dataBase.getPassWord());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	@Override
	public Map<String, Object> queryCustomerRechargeInfo(DataGridModel dgm,
			HandleCustomerAccount customerRecharge, HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Map<String, Object> result = new HashMap<String, Object>();
		String totalMoney = "select sum(money) as money from users_pay_detail where 1=1 and result = 1";
		//String totalCommission = "select sum(commission) as commission from from users_pay_detail";
		//获取记录数
		StringBuffer sumSql = new StringBuffer();
		sumSql.append("select count(1) from users u, users_pay_detail upd where 1=1 and u.id = upd.user_id");
				
		//获取结果集
		String quSql = "select upd.id, u.name, u.reality_name, u.province, u.city, u.sex, "
				+ "u.user_type, u.balance, u.freeze_money , upd.user_id, date_format(upd.datetime,'%Y-%m-%d%   %H:%i:%S') as datetime, upd.pay_code,"
				+ "upd.third_pay_code, upd.pay_type, upd.money, upd.result, upd.pay_type  "
				+ "from users u, users_pay_detail upd "
				+ "where 1=1 and u.id = upd.user_id ";
		StringBuffer sqlSb = new StringBuffer();
		Map<String, Object> params = new HashMap<String,Object>();
		if(!("").equals(customerRecharge.getName()) && customerRecharge.getName() != null){
			sqlSb.append(" and u.name like :name");
			params.put("name","%"+customerRecharge.getName()+"%");
			sumSql.append(" and u.name like '%").append(customerRecharge.getName()).append("%'");
		}
		if(customerRecharge.getResult() != null){
			sqlSb.append(" and upd.result like :result");
			params.put("result","%"+customerRecharge.getResult()+"%");
			sumSql.append(" and upd.result like '%").append(customerRecharge.getResult()).append("%'");
		}else{
			
		}		
		if(!("").equals(customerRecharge.getStartTime()) && customerRecharge.getStartTime() != null){
			sqlSb.append(" and upd.datetime > :startTime");
			params.put("startTime",customerRecharge.getStartTime());
			sumSql.append(" and upd.datetime > '").append(customerRecharge.getStartTime()).append("'");
		}
		if(!("").equals(customerRecharge.getEndTime()) && customerRecharge.getEndTime() != null){
			sqlSb.append(" and upd.datetime < :endTime");
			params.put("endTime",customerRecharge.getEndTime());
			sumSql.append(" and upd.datetime < '").append(customerRecharge.getEndTime()).append("'");
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
		Map<String, Object> map = new HashMap<String, Object>();
		HandleCustomerAccount customerAccount1 = (HandleCustomerAccount) util.getObject(totalMoney, new HashMap<String,Object>(), HandleCustomerAccount.class);
		//HandleCustomerAccount customerAccount2 = (HandleCustomerAccount) util.getObject(totalCommission, new HashMap<String,Object>(), HandleCustomerAccount.class);
		map.put("totalMoney", customerAccount1.getMoney().toString());
	//	System.out.println(customerAccount1.getMoney().toString());
		map.put("totalCommission","0.00");
		request.getSession().setAttribute("map", map);
		//绑定查询结果('total'和'rows'名称不能修改)
		result.put("total", util.getObjCount(sumSql.toString()));
		result.put("rows", util.getMapList(quSql + sqlSb.toString() + orderString + pageString, params));
		return result;
	}
	@Override
	public int[] deleteHandleAccountInfo(List<String> idList) {
		String sql = "delete from users_pay_detail where 1=1 and id = ?";
		return util.batchDelete(sql, idList);
	}
	@Override
	public Map<String, Object> queryCustomerDistill(DataGridModel dgm,
			CustomerDstill customerDistill) {
		Map<String, Object> result = new HashMap<String, Object>();
		//获取记录数
		StringBuffer sumSql = new StringBuffer();
		sumSql.append("select count(1) from users u, users_distill ud where 1=1 and u.id = ud.user_id");
				
		//获取结果集
		String quSql = "select ud.id, ud.user_id, date_format(ud.datetime,'%Y-%m-%d%   %H:%i:%S') as datetime, ud.money, ud.result, date_format(ud.accept_datetime,'%Y-%m-%d%   %H:%i:%S') as accept_datetime, "
				+ " ud.bank_name, ud.bank_card_number, ud.memo, ud.accept_operator_id, u.name, u.reality_name, u.province, u.city,"
				+ " u.id_card_number, u.balance, u.freeze_money "
				+ " from users u, users_distill ud "
				+ " where 1=1 and u.id = ud.user_id ";
		StringBuffer sqlSb = new StringBuffer();
		Map<String, Object> params = new HashMap<String,Object>();
		if(!("").equals(customerDistill.getName()) && customerDistill.getName() != null){
			sqlSb.append(" and u.name like :name");
			params.put("name","%"+customerDistill.getName()+"%");
			sumSql.append(" and u.name like '%").append(customerDistill.getName()).append("%'");
		}
		if(customerDistill.getResult() != null){
			if(customerDistill.getResult().equals("0")){
				
			}else if(customerDistill.getResult().equals("")){
				
			}
			sqlSb.append(" and ud.result like :result");
			params.put("result","%"+customerDistill.getResult()+"%");
			sumSql.append(" and ud.result like '%").append(customerDistill.getResult()).append("%'");
		}else{
			
		}		
		if(!("").equals(customerDistill.getStartTime()) && customerDistill.getStartTime() != null){
			sqlSb.append(" and ud.datetime > :startTime");
			params.put("startTime",customerDistill.getStartTime());
			sumSql.append(" and ud.datetime > '").append(customerDistill.getStartTime()).append("'");
		}
		if(!("").equals(customerDistill.getEndTime()) && customerDistill.getEndTime() != null){
			sqlSb.append(" and ud.datetime < :endTime");
			params.put("endTime",customerDistill.getEndTime());
			sumSql.append(" and ud.datetime < '").append(customerDistill.getEndTime()).append("'");
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
	public int handleCustomerDistill(String id, String result, String money, String user_id, String freeze_money) {
		// TODO Auto-generated method stub
		int i = 0;
		try {
			Connection conn = getConnection();
			conn.setAutoCommit(false);
			String agreeSql = "update users_distill set result = ? , accept_datetime = ? where id = ?";
			String userSql = "update users set freeze_money = ? where id = ?";
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(agreeSql);
			PreparedStatement ps2 = (PreparedStatement) conn.prepareStatement(userSql);
			if(result.equals("3")){
				ps.setInt(1, Integer.valueOf(result));
				ps.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
				ps.setInt(3, Integer.valueOf(id));
				if(ps.executeUpdate() > 0){
					conn.commit();
					log.info("成功处理用户user_distill[" + id + "]提款：[" + money + "]申请");
					BigDecimal newBalance = new BigDecimal(freeze_money).subtract(new BigDecimal(money));
					System.out.println("freeze_money" + freeze_money);
					System.out.println("money" + money);
					System.out.println("newBalance=" + newBalance);
					ps2.setBigDecimal(1, newBalance);
					ps2.setInt(2, Integer.valueOf(user_id));
					if(ps2.executeUpdate() > 0){
						conn.commit();
						log.info("成功处理用户users[" + id + "]提款：[" + money + "]申请");
					}else{
						i= -1;
						conn.rollback();
						log.info("处理用户users[" + id + "]提款：[" + money + "]申请失败");
					}
				}else{
					i= -1;
					conn.rollback();
					log.error("处理用户[" + id + "]提款：[" + money + "]申请失败");
				}
				
			}else{
				ps.setInt(1, Integer.valueOf(result));
				ps.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
				ps.setInt(3, Integer.valueOf(id));
				if(ps.executeUpdate() > 0){
					conn.commit();
					log.info("拒绝用户[" + id + "]提款：[" + money + "]申请");
				}else{
					i= -1;
					conn.rollback();
					log.error("拒绝处理用户[" + id + "]提款：[" + money + "]申请");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error("发生错误，详情请见：" + e.getMessage());
		}
		return i;
	}

	@Override
	public List<HandleCustomerAccount> queryCustomerRecharge(
			HandleCustomerAccount customerRecharge) {
		// TODO Auto-generated method stub
		//获取结果集
		String quSql = "select upd.id, u.name, u.reality_name, u.province, u.city, u.sex, "
				+ "u.user_type, u.balance, u.freeze_money , upd.user_id, DATE(upd.datetime) as datetime, upd.pay_code,"
				+ "upd.third_pay_code, upd.pay_type, upd.money, upd.result, upd.pay_type  "
				+ "from users u, users_pay_detail upd "
				+ "where 1=1 and u.id = upd.user_id ";
		StringBuffer sqlSb = new StringBuffer();
		Map<String, Object> params = new HashMap<String,Object>();
		if(!("").equals(customerRecharge.getName()) && customerRecharge.getName() != null){
			sqlSb.append(" and u.name like :name");
			params.put("name","%"+customerRecharge.getName()+"%");
		}
		if(customerRecharge.getResult() != null){
			sqlSb.append(" and upd.result like :result");
			params.put("result","%"+customerRecharge.getResult()+"%");
		}else{
			
		}		
		if(!("").equals(customerRecharge.getStartTime()) && customerRecharge.getStartTime() != null){
			sqlSb.append(" and upd.datetime > :startTime");
			params.put("startTime",customerRecharge.getStartTime());
		}
		if(!("").equals(customerRecharge.getEndTime()) && customerRecharge.getEndTime() != null){
			sqlSb.append(" and upd.datetime < :endTime");
			params.put("endTime",customerRecharge.getEndTime());
		}	
		return (List<HandleCustomerAccount>) util.getObjList(quSql + sqlSb.toString(), params, HandleCustomerAccount.class);
	}

}
