package com.rainbow.server.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rainbow.server.po.CustomerDstill;
import com.rainbow.server.po.HandleCustomerAccount;
import com.simple.bsp.common.util.DataGridModel;

public interface serverSupportCenterService {

	Map<String, Object> queryCustomerRechargeInfo(DataGridModel dgm, HandleCustomerAccount customerRecharge, HttpServletRequest request, HttpServletResponse response);
	
	Map<String, Object> queryCustomerDistill(DataGridModel dgm, CustomerDstill customerDistill);
	
	int[] deleteHandleAccountInfo(List<String> idList);
	
	int handleCustomerDistill(String id, String result, String money, String user_id, String freeze_money);
	
	List<HandleCustomerAccount> queryCustomerRecharge(HandleCustomerAccount customerRecharge);
}
