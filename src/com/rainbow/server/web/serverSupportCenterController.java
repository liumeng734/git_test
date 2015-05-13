package com.rainbow.server.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainbow.server.po.CustomerDstill;
import com.rainbow.server.po.HandleCustomerAccount;
import com.rainbow.server.service.serverSupportCenterService;
import com.simple.bsp.common.util.DataGridModel;

/**
 * 服务与支持中心处理类 
 * 
 * 
 */
@Controller
public class serverSupportCenterController {

	@Autowired
	private serverSupportCenterService serverService;
	
	private static Logger log = Logger.getLogger(serverSupportCenterController.class);
	
	@RequestMapping(value="/server/showHandleUserRecharge",method=RequestMethod.GET)
	public String popWindow(Model model){
		return "rainbow/server/handleUserRechare";
	}
	
	@RequestMapping(value="/server/customerDistill",method=RequestMethod.GET)
	public String popCustomerDistillWindow(Model model){
		return "rainbow/server/refuseCustomerDraw";
	}
	
	@RequestMapping(value="/server/queryHandleUserRecharge",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryHandleUserRecharge(DataGridModel dgm, HandleCustomerAccount customerRecharge, HttpServletRequest request, HttpServletResponse response){
		return serverService.queryCustomerRechargeInfo(dgm, customerRecharge, request, response);
	}
	
	@RequestMapping(value="/server/queryCustomerDistill", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> queryCustomerDistill(DataGridModel dgm, CustomerDstill customerDistill, HttpServletRequest request, HttpServletResponse response){
		String result = request.getParameter("result");
		System.out.println("result=" +result);
		if(!("").equals(result) && result != null){
			if(result.equals("0")){
				
			}else if(result.equals("6")){
				customerDistill.setResult(result);
			}else if(customerDistill.equals("3")){
				customerDistill.setResult(result);
			}
		}
		System.out.println("customerDistill=" + customerDistill.getResult());
		return serverService.queryCustomerDistill(dgm, customerDistill);
	}
	
	
	@RequestMapping(value="/server/deleteHandlerCustomerAccount",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> deleteCustomerLoginLog(@RequestParam("id")List<String> idList){
		Map<String, String> map = new HashMap<String, String>();
		try{
			if((serverService.deleteHandleAccountInfo(idList).length > 0)){
				map.put("mes", "用户充值信息删除成功!");
			}else{
				map.put("mes", "用户充值日志删除失败!");
			}
		}catch(Exception e){
			e.printStackTrace();
			map.put("mes", "用户充值删除失败!");
			log.error("用户充值删除失败，详情请看:[" + e.getMessage() + "]");
		}
		return map;
	}
	
	@RequestMapping(value="/server/handleUserDistill",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> handleCustomerDistill(@RequestParam("id")List<String> idList,HttpServletRequest request, HttpServletResponse response){
		String id = idList.get(0);
		String result = request.getParameter("result");
		String money = request.getParameter("money");
		String user_id = request.getParameter("user_id");
		String freeze_money = request.getParameter("freeze_money");
		System.out.println("result=" + result);
		Map<String, String> map = new HashMap<String, String>();
		if(result.equals("3")){
			try{
				
				if((serverService.handleCustomerDistill(id, result, money,user_id, freeze_money) >= 0)){
					map.put("mes", "处理用户提款申请成功!");
				}else{
					map.put("mes", "处理用户提款申请失败!");
				}
			}catch(Exception e){
				e.printStackTrace();
				map.put("mes", "处理用户提款申请失败!");
				log.error("处理用户提款申请失败，详情请看:[" + e.getMessage() + "]");
			}
		}else{
			try{
				
				if((serverService.handleCustomerDistill(id, result, money, user_id, freeze_money) >= 0)){
					map.put("mes", "已成功拒绝用户提款申请!");
				}else{
					map.put("mes", "拒绝用户提款申请失败!");
				}
			}catch(Exception e){
				e.printStackTrace();
				map.put("mes", "拒绝用户提款申请失败!");
				log.error("拒绝用户提款申请失败，详情请看:[" + e.getMessage() + "]");
			}
		}
		
		return map;
	}
	
	/**
	 * 导出led节目单发布监控 
	 * @param HttpServletRequest
	 * @param HttpServletResponse
	 * @param LedProgList
	 * 
	 */
	@RequestMapping(value="/server/downloadCustomerRechargeExcel")
	@ResponseBody
	public void createLedProgListExcel(HttpServletRequest request,HttpServletResponse response,
			HandleCustomerAccount customerRecharge) throws Exception{
		/** 构建文件保存的目录 **/
		SimpleDateFormat dateformatPath = new SimpleDateFormat("yyyyMMdd");
		String logoPathDir = "/resource/file/"
				+ dateformatPath.format(new Date());
		/** 得到文件保存目录的真实路径 **/
		String logoRealPathDir = request.getSession().getServletContext()
				.getRealPath(logoPathDir);
		/** 根据真实路径创建目录 **/
		File logoSaveFile = new File(logoRealPathDir);
		if (!logoSaveFile.exists()) {
			logoSaveFile.mkdirs();
		}
		/** 获取文件名 **/
		String fileName = "";
		String file = "";
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMddhhmmss");
		fileName = "用户充值明细表" + dateformat.format(new Date()) + ".xls";
		file = logoSaveFile + "\\" + fileName;
		
		/** 下载文件和写文件 **/
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		OutputStream fos = null;
		InputStream fis = null;
		try {
			if (!"".equals(file) && file != null) {
				response.reset();
				response.setHeader("Content-disposition", "attachment;filename="
						+ new String(fileName.getBytes("gb2312"), "iso8859-1"));
				response.setContentType("application/vnd.ms-excel");
				// 写入EXCEL
				List<HandleCustomerAccount> downCustomerRecharge = serverService.queryCustomerRecharge(customerRecharge);
				
				if(null!=downCustomerRecharge && downCustomerRecharge.size()>0) {
					createExcel(downCustomerRecharge,file);
				}
				
				File fileExcel = new File(file);
				if (fileExcel.exists()) {
					fis = new FileInputStream(file);
					bis = new BufferedInputStream(fis);
					fos = response.getOutputStream();
					bos = new BufferedOutputStream(fos);

					int bytesRead = 0;
					byte[] buffer = new byte[5 * 1024];
					while ((bytesRead = bis.read(buffer)) != -1) {
						bos.write(buffer, 0, bytesRead);// 将文件发送到客户端
						bos.flush();
					}
				}
			}
		} catch (IOException e) {
			log.error("downloadExcel() error:"+e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (fos != null) {
					fos.close();
				}
				if (bos != null) {
					bos.close();
				}
				if (fis != null) {
					fis.close();
				}
				if (bis != null) {
					bis.close();
				}
			} catch (IOException e) {
				log.error("downloadExcel() error:"+e.getMessage());
				e.printStackTrace();
			}

		}
	}
	//创建和初始化Excel表格
	public void createExcel(List<HandleCustomerAccount> customerRecharges, String file){
				
		WritableWorkbook wwb = null;
		try{
			//创建可写入的Excel工作簿
			wwb = Workbook.createWorkbook(new File(file));
			//创建Excel工作表
			WritableSheet ws = wwb.createSheet("用户充值明细表", 0);
					
			int row = 0;
			for(HandleCustomerAccount customerRecharge : customerRecharges){
				//System.out.println(customerRecharge.getBalance());		
				if (row == 0) {
					Label number = new Label(0, row, "序号");
					ws.addCell(number);
					Label name = new Label(1, row, "用户昵称");
					ws.addCell(name);
					Label reality_name= new Label(2, row, "用户真实姓名");
					ws.addCell(reality_name);
					Label province = new Label(3, row, "省份");
					ws.addCell(province);
					Label city = new Label(4, row, "城市");
					ws.addCell(city);
					Label pay_type = new Label(5, row, "充值方式");
					ws.addCell(pay_type);
					Label money = new Label(6, row, "充值金额");
					ws.addCell(money);
					Label datetime = new Label(7, row, "充值时间");
					ws.addCell(datetime);
					Label result = new Label(8, row, "充值状态");
					ws.addCell(result);
					Label balance = new Label(8, row, "账户余额");
					ws.addCell(balance);
					Label description = new Label(9, row, "描述信息");
					ws.addCell(description);
					row++;
				}
					Label number = new Label(0, row, "" + row);
					ws.addCell(number);
					Label name = new Label(1, row,customerRecharge.getName());
					ws.addCell(name);
					Label reality_name = new Label(2, row, customerRecharge.getReality_name());
					ws.addCell(reality_name);
					Label province = new Label(3, row, customerRecharge.getProvince());
					ws.addCell(province);
					Label city = new Label(4, row, customerRecharge.getCity());
					ws.addCell(city);
					if(customerRecharge.getPay_type().equals("1")){
						Label pay_type = new Label(5, row, "正常手动充值");
						ws.addCell(pay_type);
					}else if(customerRecharge.getPay_type().equals("2")){
						Label pay_type = new Label(5, row, "奖励");
						ws.addCell(pay_type);
					}else if(customerRecharge.getPay_type().equals("3")){
						Label pay_type = new Label(5, row, "购彩");
						ws.addCell(pay_type);
					}else if(customerRecharge.getPay_type().equals("4")){
						Label pay_type = new Label(5, row, "预付款");
						ws.addCell(pay_type);
					}else if(customerRecharge.getPay_type().equals("5")){
						Label pay_type = new Label(5, row, "转账户");
						ws.addCell(pay_type);
					}else if(customerRecharge.getPay_type().equals("6")){
						Label pay_type = new Label(5, row, "其他");
						ws.addCell(pay_type);
					}
					Label money = new Label(6, row, customerRecharge.getMoney().toString());
					ws.addCell(money);
					if(customerRecharge.getResult().equals("1")){
						Label result = new Label(7, row, "充值成功");
						ws.addCell(result);
					}else if(customerRecharge.getResult().equals("2")){
						Label result = new Label(7, row, "充值失败");
						ws.addCell(result);
					}
					Label balance = new Label(8, row, customerRecharge.getBalance().toString());
					ws.addCell(balance);
					Label description = new Label(9, row, customerRecharge.getDescription());
					ws.addCell(description);
					row++;
				}
			wwb.write();
		}catch(Exception e){
			log.error("导出用户明细表excel出错：" + e.getMessage());
			e.printStackTrace();
		}
		finally{		
			try {
				wwb.close();
			} catch (WriteException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
