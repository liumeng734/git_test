package com.rainbow.lottery.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainbow.lottery.po.Isuse;
import com.rainbow.lottery.po.IsuseClass;
import com.rainbow.lottery.po.Lottery;
import com.rainbow.lottery.service.LotteryService;
import com.rainbow.lottery.util.IsuseUtil;
import com.simple.bsp.common.util.DataGridModel;

/**
 * <description>彩票业务中心页面展示</description> 
 * @author li-jx
 * @since 1.4
 * @version 1.0
 * @data 2015.04.25
 * 
 */
@Controller
public class LotteryController {

	private static final Logger log = Logger.getLogger(LotteryController.class);
	
	@Autowired
	private LotteryService lotteryService;
	
	private static  List<IsuseClass> isuseList = null;
	
	static{
		
	}
	
	/**
	 * 各种玩法时间设置页面跳转
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/lottery/playTimeSetting", method=RequestMethod.GET)
	public String popPlayTimeSettingWindow(Model model){
		return "rainbow/lottery/playTimeSettings";
	}
	
	/**
	 * 期号管理页面跳转
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/lottery/issueManager", method=RequestMethod.GET)
	public String popIssueManagerWindow(Model model){
		return "rainbow/lottery/issueManager";
	}
	
	/**
	 * 录入开奖号码页面跳转
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/lottery/loadWiningNumber", method=RequestMethod.GET)
	public String popLoadWiningNumberWindow(Model model){
		return "rainbow/lottery/loadWiningNumber";
	}
	
	/**
	 * 中奖查询页面跳转
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/lottery/winningQueryInfo", method=RequestMethod.GET)
	public String popwinningQueryInfoWindow(Model model){
		return "rainbow/lottery/winningQueryInfo";
	}
	
	/**
	 * 进入期号添加页面
	 * @return
	 */
	@RequestMapping(value="/lottery/popWinAddIsuse",method=RequestMethod.GET)
	public String popWinAddIsuse(Model model,HttpServletRequest request, HttpServletResponse response){
		String id = (String) request.getParameter("id");
		return "rainbow/lottery/popWinAddIsuse";
	}
	
	/**
	 * 默认分页查询期号信息
	 * @param dgm
	 * @param org
	 * @return
	 */
	@RequestMapping(value="/lottery/queryList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryList(DataGridModel dgm, Isuse isuse){
		return lotteryService.getPageList(dgm, isuse);
	}
	

	
	/**
	 * 保存后的开奖号码（录入开奖号码）
	 * @param lottery
	 * @return
	 */
	@RequestMapping(value="/lottery/updateWiningNumber",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> updateWiningNumber(Isuse isuse){
		
		Map<String, String> map = new HashMap<String, String>();
		try {
			
			if(lotteryService.updateLottery(isuse) > 0){
				map.put("mes", "录入开奖号码成功");
			}else{
				map.put("mes", "录入开奖号码失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("mes", "录入开奖号码失败");
		}
		return map; 
	}
	
	/**
	 * 得到彩种下拉列表框的值（录入开奖号码）
	 * @param lottery
	 * @return
	 */
	@RequestMapping(value="/lottery/getLotteryId", method=RequestMethod.GET)
	@ResponseBody
	public String queryLotteryList(Isuse isuse){
		List lotteryList = lotteryService.getLotteryList(isuse);
		//将LIST转化为json类型
		String jsonString = this.encodeListJson(lotteryList);
		return jsonString;
	}
	
	/**
	 * 得到期号下拉列表框的值（录入开奖号码）
	 * @param lottery
	 * @return
	 */
	@RequestMapping(value="/lottery/getIsuse", method=RequestMethod.GET)
	@ResponseBody
	public String querygetIsuseList(Isuse isuse){
		List isuseList = lotteryService.getIsuseList(isuse);
		//将LIST转化为json类型
		String jsonString = this.encodeListJson(isuseList);
		return jsonString;
	}
	
	/**
	 * 得到彩种下拉列表框的值（中奖查询）
	 * @param lottery
	 * @return
	 */
	@RequestMapping(value="/lottery/winningGetLotteryId", method=RequestMethod.GET)
	@ResponseBody
	public String queryWinningLotteryList(Lottery lottery){
		List lotteryList = lotteryService.getLotteryList(lottery);
		//将LIST转化为json类型
		String jsonString = this.encodeListJson(lotteryList);
		return jsonString;
	}
	
	/**
	 * 得到期号下拉列表框的值（中奖查询）
	 * @param lottery
	 * @return
	 */
	@RequestMapping(value="/lottery/winningGetIsuseId", method=RequestMethod.GET)
	@ResponseBody
	public String queryWinningIsuseList(Lottery lottery){
		List lotteryList = lotteryService.getIsuseList(lottery);
		//将LIST转化为json类型
		String jsonString = this.encodeListJson(lotteryList);
		return jsonString;
	}
	
	/**
	 * 直接将List转为分页所需要的Json资料格式
	 * 
	 * @param list
	 *            需要编码的List对象
	 */
	public String encodeListJson(List list) {
		String jsonString = "[]";
		if (list == null) {
			// log.warn("传入的Java对象为空,不能将其序列化为Json资料格式.请检查!");
		} else {
			if (list instanceof ArrayList) {
				JSONArray jsonArray = JSONArray.fromObject(list);
				jsonString = jsonArray.toString();
			} else {
				JSONObject jsonObject = JSONObject.fromObject(list);
				jsonString = jsonObject.toString();
			}
		}
		return jsonString;
	}
	
	/**
	 * 保存添加期号信息
	 * @param isuse
	 * @return
	 */
	@RequestMapping(value="/lottery/addIsuse",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> saveIsuse(Isuse isuse){
		//从数据库获取期号表
		List<IsuseClass> isuseClass = IsuseUtil.getIsuseList();
		//获取材种ID
		String lottery_id = isuse.getLottery_Id();
		isuse.setLottery_id(Integer.valueOf(lottery_id));
		//获取录入天数
		int days = isuse.getDays();
		//获取开始日期
		String start_datetime = isuse.getStart_datetime();
		//System.out.println("start_datetime=" + start_datetime);
		//获取截至日期
		//String end_date = DateToString(getNextDay(StringToDate(start_datetime),days));
		String stringDate = null;
		List<IsuseClass> insertList = new ArrayList<IsuseClass>();
		for(int i = 0; i < days; i++){
			//获得期号
			if(i == 0){
				stringDate = getStringDate(start_datetime);
			}else{
				stringDate =  getStringDate(DateToString(getNextDay(StringToDate(start_datetime), i)));
			}
			
			for(int k =0 ; k < 120; k++){
				IsuseClass isus = isuseClass.get(k);
				IsuseClass isuse1 = new IsuseClass();
				//假如添加一天，将开始期号和截至期号相同
				isuse1.setId(stringDate + isus.getId());
				isuse1.setStart_datetime(getString(stringDate) + " " + isus.getStart_datetime());
				isuse1.setEnd_datetime(getString(stringDate) + " " + isus.getEnd_datetime());
				insertList.add(isuse1);
				
			}
				
		}
		/*for(int i = 0; i < insertList.size(); i ++){
			System.out.println(insertList.get(i).getId() + " " + insertList.get(i).getStart_datetime() + " "+ insertList.get(i).getEnd_datetime());
		}
		*/
		//放入isuse类
		//isuse.setEnd_datetime(end_date);
		Map<String, String> map = new HashMap<String, String>();
		try {
			if(lotteryService.saveIsuse(isuse,insertList) > 0){
				map.put("mes", "添加期号信息成功");
			}else{
				map.put("mes", "添加期号信息失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("mes", "添加期号信息失败");
		}
		return map; 
	}
	/**
	 * String转换成Date类型 
	 * 
	 * 
	 */
	public static Date StringToDate(String time){
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sim.parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
		//	log.error("日期转换出错：" + e.getMessage());
			e.printStackTrace();
		}
		return date;
	}
	
	/**
	 * Date to String 
	 * 
	 */
	public static String DateToString(Date date){
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
		return sim.format(date);
	}
	
	/**
	 * get future date 
	 * 
	 * 
	 */
	public static Date getNextDay(Date date, int days){
		//Date date=new Date();//取时间 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Calendar rightNow = Calendar.getInstance();
	    rightNow.add(Calendar.DATE,days);//日期加10天
	    Date dt1=rightNow.getTime();
	   // String reStr = sdf.format(dt1);  
	    return dt1;
	}
	
	/**
	 * 获取期号 前面日期码
	 * 
	 */
	public static String getStringDate(String start_datetime){
		//System.out.println("start_datetime=" +start_datetime);
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sf1 = new SimpleDateFormat("yyyyMMdd");
		Date date = null;
		try {
			date = sf.parse(start_datetime);
			//System.out.println(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sf1.format(date);
	}
	
	public static String getString(String time){
		//System.out.println("start_datetime=" +start_datetime);
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sf1 = new SimpleDateFormat("yyyyMMdd");
				Date date = null;
				try {
					date = sf1.parse(time);
					//System.out.println(date);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sf.format(date);
	}
	
	
	/**
	 *  
	 * 检查日期
	 * 
	 * 
	 */
	@RequestMapping(value="/lottery/checkTime",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> checkTime(HttpServletRequest request, HttpServletResponse response){
		String inputTime = request.getParameter("start_datetime");
		String lottery_id = request.getParameter("id");
		Map<String,String> map = new HashMap<String,String>();
		Isuse isuse = lotteryService.getLastTime(lottery_id);
		//System.out.println("isuse starttime=" + isuse.getStart_datetime());
		if(isuse.getStart_datetime() != null  && !("").equals(isuse.getStart_datetime())){
			String lastStart_Time = isuse.getStart_datetime().substring(0, 10);
			if(inputTime.compareTo(lastStart_Time) > 0){
				map.put("mes", "1");
			}else{
				map.put("mes", lastStart_Time);
			}
		}else{
			map.put("mes", "1");
		}
		
		return map;
	}
}
