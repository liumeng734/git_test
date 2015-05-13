package com.rainbow.customer.service.impl;

import java.math.BigDecimal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.customer.dao.CustomerRechargeDao;
import com.rainbow.customer.po.CustomerRecharge;
import com.rainbow.customer.service.CustomerRechargeService;
import com.simple.bsp.common.util.DataGridModel;

@Service("customerRechargeService")
public class customerRechargeServiceImpl implements CustomerRechargeService{

	@Autowired
	private CustomerRechargeDao customerRechargeDao;

	@Override
	public int saveMoney(CustomerRecharge customerRecharge, BigDecimal balance) {
		// TODO Auto-generated method stub
		return customerRechargeDao.savePayDestail(customerRecharge, balance);
	}

	@Override
	public Map<String, Object> queryCustomerRechargeInfo(DataGridModel dgm,
			CustomerRecharge customerRecharge) {
		// TODO Auto-generated method stub
		return customerRechargeDao.queryCustomerRechargeInfo(dgm, customerRecharge);
	}
}
