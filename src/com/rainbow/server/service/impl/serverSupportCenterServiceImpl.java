package com.rainbow.server.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.server.dao.serverSupportCenterDao;
import com.rainbow.server.po.CustomerDstill;
import com.rainbow.server.po.HandleCustomerAccount;
import com.rainbow.server.service.serverSupportCenterService;
import com.simple.bsp.common.util.DataGridModel;

@Service("serverService")
public class serverSupportCenterServiceImpl implements serverSupportCenterService{

	@Autowired
	private serverSupportCenterDao serverDao;
	@Override
	public Map<String, Object> queryCustomerRechargeInfo(DataGridModel dgm,
			HandleCustomerAccount customerRecharge, HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return serverDao.queryCustomerRechargeInfo(dgm, customerRecharge,request, response);
	}
	@Override
	public int[] deleteHandleAccountInfo(List<String> idList) {
		// TODO Auto-generated method stub
		return serverDao.deleteHandleAccountInfo(idList);
	}
	@Override
	public Map<String, Object> queryCustomerDistill(DataGridModel dgm,
			CustomerDstill customerDistill) {
		// TODO Auto-generated method stub
		return serverDao.queryCustomerDistill(dgm, customerDistill);
	}
	@Override
	public int handleCustomerDistill(String id, String result, String money,String user_id, String freeze_money) {
		// TODO Auto-generated method stub
		return serverDao.handleCustomerDistill(id, result, money, user_id, freeze_money);
	}
	@Override
	public List<HandleCustomerAccount> queryCustomerRecharge(
			HandleCustomerAccount customerRecharge) {
		// TODO Auto-generated method stub
		return serverDao.queryCustomerRecharge(customerRecharge);
	}

}
