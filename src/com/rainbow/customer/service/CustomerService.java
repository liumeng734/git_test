package com.rainbow.customer.service;

import java.util.List;
import java.util.Map;

import com.rainbow.customer.po.CustomerInfo;
import com.rainbow.customer.po.CustomerLoginLog;
import com.rainbow.customer.po.CustomerMoneyDetail;
import com.rainbow.customer.po.CustomerRecharge;
import com.simple.bsp.common.util.DataGridModel;

/**
 * <description>客户信息处理接口</description> 
 * @author Simple
 * @since 1.4
 * @version 1.0
 */
public interface CustomerService {

	/**
	 * <function>查询界面接口 </function>
	 * @param DataGridModel dgm
	 * @param CustomerInfo customerInfo
	 * @return Map<String,Object>
	 * 
	 */
	Map<String, Object> queryCustomerInfo(DataGridModel dgm, CustomerInfo customerInfo);
	
	/**
	 * <function>用户日志查询接口</function> 
	 * @param DataGridModel dgm
	 * @param CustomerLoginLog loginLog
	 * @return Map<String,Object>
	 * 
	 */
	Map<String, Object> queryCustomerLoginLog(DataGridModel dgm, CustomerLoginLog loginLog);
	
	/**
	 * 批量删除或单独删除信息 
	 * @param List<String> idList
	 * @return int[]
	 * 
	 */
	int[] deleteCustomerLog(List<String> idList);
	
	/**
	 * 用户充值 
	 * @param CustomerRecharge customerRecharge
	 * @return int
	 * 
	 */
	int saveCustomerMoney(CustomerRecharge customerRecharge);
	
	/**
	 * 查询当前用户余额 
	 * @param String Name
	 * @CustomerInfo 
	 */
	CustomerInfo queryCustomerBalance(String Name);
	
	/**
	 * 查询用户账户明细 
	 * 
	 */
	Map<String,Object> queryCustomerMoney(DataGridModel dgm, CustomerMoneyDetail moneyDetail);
}
