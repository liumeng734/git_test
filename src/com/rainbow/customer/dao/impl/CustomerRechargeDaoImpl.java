package com.rainbow.customer.dao.impl;

import java.math.BigDecimal;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.rainbow.customer.dao.CustomerRechargeDao;
import com.rainbow.customer.po.CustomerRecharge;
import com.rainbow.customer.po.DataBaseProperties;
import com.rainbow.customer.util.PropertyUtil;
import com.simple.bsp.common.util.DBUtil;
import com.simple.bsp.common.util.DataGridModel;

@Repository("customerRechargeDao")
public class CustomerRechargeDaoImpl implements CustomerRechargeDao{
	
	@Autowired
	private DBUtil util;

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
	
	public int savePayDestail(CustomerRecharge customerRecharge, BigDecimal balance){
		int result = 0;
		try {
			Connection conn = this.getConnection();
			conn.setAutoCommit(false);
			String sql = "insert into users_pay_detail(id, user_id, datetime, pay_code, third_pay_code, pay_type, money, result)"
					+ " values(?,?,?,?,?,?,?,?)";
			String sqlUsers = "update users set balance=? where id=?";
			String update = "update users_pay_detail set result = ? where id = ?";
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			PreparedStatement ps1 = (PreparedStatement) conn.prepareStatement(sqlUsers, Statement.RETURN_GENERATED_KEYS);
			PreparedStatement ps2 = (PreparedStatement) conn.prepareStatement(update, Statement.RETURN_GENERATED_KEYS);
			ps.setLong(1, customerRecharge.getId());
			ps.setInt(2, customerRecharge.getUser_id());
			ps.setTimestamp(3, customerRecharge.getDatetime());
			ps.setString(4, customerRecharge.getPay_code());
			ps.setString(5, customerRecharge.getThird_pay_code());
			ps.setString(6, customerRecharge.getPay_type());
			ps.setBigDecimal(7, customerRecharge.getMoney());
			ps.setInt(8, customerRecharge.getResult());
			if(ps.executeUpdate() > 0){
				//con	n.commit();		
				ps1.setBigDecimal(1, balance);
				ps1.setLong(2, customerRecharge.getUser_id());
				if(ps1.executeUpdate() > 0){
					//conn.commit();
					ps2.setInt(1, 1);
					ps2.setLong(2, customerRecharge.getId());
					ps2.executeUpdate();
					conn.commit();
				}else{
					conn.rollback();
				}
				
				result = 1;
				
			}else{
				conn.rollback();
				result = 0;
			}
			System.out.println(result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		return result;
	}

	@Override
	public Map<String, Object> queryCustomerRechargeInfo(DataGridModel dgm,
			CustomerRecharge customerRecharge) {
		System.out.println("customerRechargeResult=" + customerRecharge.getResult());
		// TODO Auto-generated method stub
		Map<String, Object> result = new HashMap<String, Object>();
		//获取记录数
		StringBuffer sumSql = new StringBuffer();
		sumSql.append("select count(1) from users u, users_pay_detail upd where 1=1 and u.id = upd.user_id");
				
		//获取结果集
		String quSql = "select u.id, u.name, u.reality_name, u.province, u.city, u.sex, "
				+ "u.user_type, u.balance, u.freeze_money , upd.user_id, DATE(upd.datetime) as datetime, upd.pay_code,"
				+ "upd.third_pay_code, upd.pay_type, upd.money, upd.result "
				+ "from users u, users_pay_detail upd "
				+ "where 1=1 and u.id = upd.user_id ";
		StringBuffer sqlSb = new StringBuffer();
		Map<String, Object> params = new HashMap<String,Object>();
		if(!("").equals(customerRecharge.getName()) && customerRecharge.getName() != null){
			sqlSb.append(" and u.name like :name");
			params.put("name","%"+customerRecharge.getName()+"%");
			sumSql.append(" and name like '%").append(customerRecharge.getName()).append("%'");
		}
		if(null != String.valueOf(customerRecharge.getResult())  && !("").equals(customerRecharge.getResult())){
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
				
		System.out.println("["+sumSql.toString()+"]");
		System.out.println("["+quSql + sqlSb.toString() + orderString + pageString+"]");
				
		//绑定查询结果('total'和'rows'名称不能修改)
		result.put("total", util.getObjCount(sumSql.toString()));
		result.put("rows", util.getMapList(quSql + sqlSb.toString() + orderString + pageString, params));
		return result;
	}
}
