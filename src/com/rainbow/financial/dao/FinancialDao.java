package com.rainbow.financial.dao;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rainbow.financial.po.CustomerWinningDetail;
import com.simple.bsp.common.util.DataGridModel;

/**
 * 财务中心Dao层接口 
 * 
 */
public interface FinancialDao {

	public Map<String, Object> queryCustomerWinningDetail(DataGridModel dgm, CustomerWinningDetail customerWinningDetail, HttpServletRequest request, HttpServletResponse response);
}
