package com.rainbow.customer.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.customer.dao.CustomerDao;
import com.rainbow.customer.po.CustomerInfo;
import com.rainbow.customer.po.CustomerLoginLog;
import com.rainbow.customer.po.CustomerMoneyDetail;
import com.rainbow.customer.po.CustomerRecharge;
import com.rainbow.customer.service.CustomerService;
import com.simple.bsp.common.util.DataGridModel;

/**
 * <description>客户信息处理service层<description> 
 * @author Simple
 * @since 1.4
 * @version 1.0
 * 
 */
@Service("customerService")
public class CustomerServiceImpl implements CustomerService{

	private static final Logger log = Logger.getLogger(CustomerServiceImpl.class);
	
	@Autowired
	private CustomerDao customerDao;
	
	/**
	 * <function>查询客户信息界面实现类 </function>
	 * @param DataGridModel dgm
	 * @param CustomerInfo customerInfo
	 * @return Map<String,Object>
	 * 
	 */
	@Override
	public Map<String, Object> queryCustomerInfo(DataGridModel dgm,
			CustomerInfo customerInfo) {
		// TODO Auto-generated method stub
		return customerDao.queryCustomerInfo(dgm, customerInfo);
	}
	
	/**
	 * <function>查询客户登录信息实现类 </function>
	 * @param DataGridModel dgm
	 * @param CustomerLoginLog loginLog
	 * @return Map<String,Object>
	 * 
	 */
	@Override
	public Map<String, Object> queryCustomerLoginLog(DataGridModel dgm,
			CustomerLoginLog loginLog) {
		// TODO Auto-generated method stub
		return customerDao.queryCustomerLoginLog(dgm, loginLog);
	}

	@Override
	public int[] deleteCustomerLog(List<String> idList) {
		// TODO Auto-generated method stub
		return customerDao.deleteCustomerLog(idList);
	}

	@Override
	public int saveCustomerMoney(CustomerRecharge customerRecharge) {
		// TODO Auto-generated method stub
		return customerDao.saveCustomerMoney(customerRecharge);
	}

	@Override
	public CustomerInfo queryCustomerBalance(String Name) {
		// TODO Auto-generated method stub
		return customerDao.queryCustomerBalance(Name);
	}

	@Override
	public Map<String, Object> queryCustomerMoney(DataGridModel dgm,
			CustomerMoneyDetail moneyDetail) {
		// TODO Auto-generated method stub
		return customerDao.queryCustomerMoney(dgm, moneyDetail);
	}

}
