package com.rainbow.customer.web;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainbow.customer.po.CustomerInfo;
import com.rainbow.customer.po.CustomerRecharge;
import com.rainbow.customer.service.CustomerRechargeService;
import com.rainbow.customer.service.CustomerService;
import com.rainbow.customer.util.RandomUtil;
import com.simple.bsp.common.util.DataGridModel;

@Controller
public class CustomerRechargeController {

	@Autowired
	private CustomerRechargeService customerRechargeService;
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value="/customer/customerRechargeInfo", method= RequestMethod.GET)
	public String rechargeWindow(Model model){
		return "rainbow/customer/customerAccountRecharge";
	}
	
	@RequestMapping(value="/customer/showCustomerRechargeWindow", method= RequestMethod.GET)
	public String showRechargeWindow(Model model){
		return "rainbow/customer/customerAccountRecharge";
	}
	
	/**
	 * 
	 * 
	 * 
	 */
	@RequestMapping(value="/customer/queryCustomerRecharge", method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryCustomerRecharge(DataGridModel dgm, CustomerRecharge customerRecharge){
		return customerRechargeService.queryCustomerRechargeInfo(dgm, customerRecharge);
	}
	
	/**
	 * 用户充值 
	 * 
	 */
	@RequestMapping(value="/customer/customerRecharge",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> customerRecharge(DataGridModel dgm, CustomerRecharge customerRecharge){
		System.out.println(customerRecharge.getName());
		CustomerInfo customerInfo = customerService.queryCustomerBalance(customerRecharge.getName());
		BigDecimal balance = customerRecharge.getMoney().add(customerInfo.getBalance());
		customerRecharge.setUser_id(customerInfo.getId());
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		customerRecharge.setDatetime(ts);
		customerRecharge.setId(System.currentTimeMillis());
		SimpleDateFormat s = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        String time = s.format(date); //获取当前系统时间
        String count = String.valueOf(RandomUtil.getRandom());
        customerRecharge.setPay_code(time+count);
        customerRecharge.setResult(3);
		Map<String, String> map = new HashMap<String, String>();
		if(customerRechargeService.saveMoney(customerRecharge, balance) > 0){
			map.put("mes", "用户充值成功!");
		}else{
			map.put("mes", "用户充值失败！");
		}
		
		return map;
	}
}
