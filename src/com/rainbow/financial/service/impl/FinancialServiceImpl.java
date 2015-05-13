package com.rainbow.financial.service.impl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.financial.dao.FinancialDao;
import com.rainbow.financial.po.CustomerWinningDetail;
import com.rainbow.financial.service.FinancialService;
import com.simple.bsp.common.util.DataGridModel;

@Service("financialService")
public class FinancialServiceImpl implements FinancialService{

	@Autowired
	private FinancialDao financialDao;
	@Override
	public Map<String, Object> queryCustomerWinningDetail(DataGridModel dgm,
			CustomerWinningDetail customerWinningDetail, HttpServletRequest request,HttpServletResponse response) {
		// TODO Auto-generated method stub
		return financialDao.queryCustomerWinningDetail(dgm, customerWinningDetail, request, response);
	}

}
