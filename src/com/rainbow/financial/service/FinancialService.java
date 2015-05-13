package com.rainbow.financial.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rainbow.financial.po.CustomerWinningDetail;
import com.simple.bsp.common.util.DataGridModel;

/**
 * 财务中心service层接口 
 * 
 */
public interface FinancialService {

	public Map<String, Object> queryCustomerWinningDetail(DataGridModel dgm, CustomerWinningDetail customerWinningDetail,
			HttpServletRequest request, HttpServletResponse response);
}
