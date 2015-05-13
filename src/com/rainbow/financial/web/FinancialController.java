package com.rainbow.financial.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainbow.financial.po.CustomerWinningDetail;
import com.rainbow.financial.service.FinancialService;
import com.simple.bsp.common.util.DataGridModel;

@Controller
public class FinancialController {

	@Autowired
	private FinancialService financialService;
	/**
	 * 打开用户充值明细页面 
	 * 
	 * 
	 */
	@RequestMapping(value="/financial/customerRechargeInfo",method=RequestMethod.GET)
	public String popCustomerRechargeInfo(Model model){
		return "rainbow/financial/customerRechargeInfo";
	}
	
	/**
	 * 打开用户中奖明细表 
	 * 
	 * 
	 */
	@RequestMapping(value="/financial/customerWinningDetail",method=RequestMethod.GET)
	public String popCustomerWinningDetail(Model model){
		return "rainbow/financial/customerWinningDetail";
	}
	
	/**
	 * 用户提款明细表 
	 * 
	 * 
	 */
	@RequestMapping(value="/financial/customerDrawDetail",method=RequestMethod.GET)
	public String popCustomerDrawDetail(Model model){
		return "rainbow/financial/customerDrawDetail";
	}
	
	
	/**
	 * 代付款用户一览表
	 * 
	 * 
	 */
	@RequestMapping(value="/financial/customerGenerationOfPayment",method=RequestMethod.GET)
	public String popCustomerGenerationOfPayment(Model model){
		return "rainbow/financial/customerGenerationOfPayment";
	}
	
	
	/**
	 * 提款成功用户一览表
	 * 
	 * 
	 */
	@RequestMapping(value="/financial/customerSuccessfulPayment",method=RequestMethod.GET)
	public String popCustomerSuccessfulPayment(Model model){
		return "rainbow/financial/customerSuccessfulPayment";
	}
	
	/**
	 * 打开用户方案查询页面 
	 * 
	 * 
	 */
	@RequestMapping(value="/financial/queryCustomerScheme",method=RequestMethod.GET)
	public String popCustomerScheme(Model model){
		return "rainbow/financial/queryCustomerScheme";
	}
	
	/**
	 * 预览用户中奖明细页面
	 *  
	 * 
	 */
	@RequestMapping(value="/financial/queryCustomerWinningDetail",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> queryCustomerWinningDetail(DataGridModel dgm, CustomerWinningDetail customerWinningDetail, 
			HttpServletRequest request, HttpServletResponse response){
		//System.out.println("121111111111111111111111111111111");
		return financialService.queryCustomerWinningDetail(dgm, customerWinningDetail, request, response);
	}
}
