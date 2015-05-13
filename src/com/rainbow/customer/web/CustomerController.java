package com.rainbow.customer.web;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainbow.customer.po.CustomerInfo;
import com.rainbow.customer.po.CustomerLoginLog;
import com.rainbow.customer.po.CustomerMoneyDetail;
import com.rainbow.customer.po.CustomerRecharge;
import com.rainbow.customer.service.CustomerService;
import com.rainbow.customer.util.RandomUtil;
import com.simple.bsp.common.util.DataGridModel;

/**
 * <description>客户信息处理Controller类</description> 
 * @author Simple
 * @since 1.4
 * @version 1.0
 * 
 */
@Controller
public class CustomerController {

	private static final Logger log = Logger.getLogger(CustomerController.class);
	@Autowired
	private CustomerService customerService;
	/**
	 * 客户信息一览表页面 
	 * 
	 * 
	 */
	@RequestMapping(value="/customerInfo",method=RequestMethod.GET)
	public String queryListWindow(Model model){
		return "rainbow/customer/customerInfo";
	}
	
	/**
	 * 预览客户信息 
	 * 
	 * 
	 */
	@RequestMapping(value="customer/queryCustomerInfo",method=RequestMethod.GET)
	public String queryCustomerInfo(Model model){
		return "rainbow/customer/queryCustomerInfo";
	}
	
	/**
	 * 
	 * 用户账户明细 
	 * 
	 * 
	 */
	@RequestMapping(value="customer/queryCustomerAccountInfo",method=RequestMethod.GET)
	public String queryCustomrAccountInfo(Model model){
		return "rainbow/customer/customerAccountInfo";
	}
	/**
	 * 用户账户充值 页面
	 * 
	 * 
	 */
	@RequestMapping(value="customer/queryCustomerAccountRecharge",method=RequestMethod.GET)
	public String queryCustomerAccountRecharge(Model model){
		return "rainbow/customer/customerAccountRecharge";
	}
	/**
	 * 
	 * 用户登录日志页面 
	 * 
	 * 
	 */
	@RequestMapping(value="customer/queryCustomerLog",method=RequestMethod.GET)
	public String queryCustomerLoginLog(Model model){
		return "rainbow/customer/customerLoginLog";
	}
	
	/**
	 * 
	 * 用户账户明细 
	 * 
	 * 
	 */
	@RequestMapping(value="/customer/queryCustomerMoneyDetailList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryCustomerMoneyDetail(DataGridModel dgm, CustomerMoneyDetail moneyDetail){
		return customerService.queryCustomerMoney(dgm, moneyDetail);
	}
	
	/**
	 * 查询客户信息 
	 * 
	 * 
	 */
	@RequestMapping(value="/customer/queryList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryCustomerInfo(DataGridModel dgm, CustomerInfo customerInfo){
	//	System.out.println("123333");
		return customerService.queryCustomerInfo(dgm, customerInfo);
	}
	
	/**
	 * 
	 *从日志表中查询日志 
	 * 
	 * 
	 */
	@RequestMapping(value="/customer/queryLoginLog",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> queryLoginLog(DataGridModel dgm, CustomerLoginLog loginLog){
		return customerService.queryCustomerLoginLog(dgm, loginLog);
	}
	
	/**
	 * 删除日志信息（支持批量删除） 
	 *  
	 */
	@RequestMapping(value="/customer/deleteCustomerlog",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> deleteCustomerLoginLog(@RequestParam("id")List<String> idList){
		Map<String, String> map = new HashMap<String, String>();
		try{
			if((customerService.deleteCustomerLog(idList).length > 0)){
				map.put("mes", "用户登录日志删除成功!");
			}else{
				map.put("mes", "用户登录日志删除失败!");
			}
		}catch(Exception e){
			e.printStackTrace();
			map.put("mes", "用户登录日志删除失败!");
			log.error("用户登录日志删除失败，详情请看:[" + e.getMessage() + "]");
		}
		return map;
	}
	/**
	 * 用户充值 
	 * 
	 */
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
		Map<String, String> map = new HashMap<String, String>();
		if(customerService.saveCustomerMoney(customerRecharge) > 0){
			map.put("mes", "用户充值成功!");
		}else{
			map.put("mes", "用户充值失败！");
		}
		
		return map;
	}
}
