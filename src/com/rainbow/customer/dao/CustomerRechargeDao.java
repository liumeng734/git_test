package com.rainbow.customer.dao;

import java.math.BigDecimal;
import java.util.Map;

import com.rainbow.customer.po.CustomerRecharge;
import com.simple.bsp.common.util.DataGridModel;

public interface CustomerRechargeDao {

	public int savePayDestail(CustomerRecharge customerRecharge, BigDecimal balance);
	public Map<String, Object> queryCustomerRechargeInfo(DataGridModel dgm,CustomerRecharge customerRecharge);
}
