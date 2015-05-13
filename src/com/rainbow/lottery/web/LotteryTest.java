package com.rainbow.lottery.web;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import com.rainbow.lottery.po.IsuseClass;
import com.rainbow.lottery.util.IsuseUtil;

public class LotteryTest {
	private static Calendar now;
	public static void main(String[] args) {
		/*String time = "2015-05-08 10:00:00";
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date date = null;
		try {
			date = sim.parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			//log.error("日期转换出错：" + e.getMessage());
			e.printStackTrace();
		}
		Date date1 = new Date();
	
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-mm-HH");
		System.out.println(sf.format(date1));
		System.out.println(sf.format(getNextDay(date1, 2)));*/
		 /* SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
	        String str="20110823";
	        Date dt = null;
			try {
				dt = sdf.parse(str);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
		/*Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      Calendar rightNow = Calendar.getInstance();
	        rightNow.add(Calendar.DAY_OF_YEAR,25);//日期加10天
	        Date dt1=rightNow.getTime();
	        String reStr = sdf.format(dt1);
	        System.out.println(reStr);*/
	        
	      /*  List<IsuseClass> list = IsuseUtil.getIsuseList();
	        for(int i = 0; i < list.size(); i++){
	        	System.out.println(list.get(i).getId() + "  " + list.get(i).getStart_datetime() + "  " + list.get(i).getEnd_datetime());
	        }*/
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		String str = "2015-05-09";
		/*java.util.Date date = null;
		try {
			date = sf.parse(str);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(sf.format(date));*/
		//System.out.println(getNextDay(StringToDate(str), 1));
		//System.out.println(DateToString(getNextDay(StringToDate(str), 1)));
		/*String stringDate = getStringDate(DateToString(getNextDay(StringToDate(str), 1)));
		System.out.println(stringDate);
		System.out.println(System.currentTimeMillis());
		String str3 = "2015-09-08";
		String str1 = "2015-05-11 23:55:00";
		String str2 = str1.substring(0, 10);
		if(str2.compareTo(str3) > 0){
			System.out.println("hello kitty");
		}else{
			System.out.println("hello world");
		}*/
		int a= 7;
		BigDecimal b = new BigDecimal(a);
		String c = "8";
		BigDecimal d = new BigDecimal(c);
		if(b.compareTo(d) > 0){
			System.out.println("hello kitty");
		}else{
			System.out.println("hello tiger");
		}
		//System.out.println(now.getTimeInMillis());
		//System.out.println(Integer.valueOf(str2));
}
	/*		public static Date getNextDay(Date date, int days){
		//Date date=new Date();//取时间 
	     Calendar   calendar   =   new   GregorianCalendar(); 
	     calendar.setTime(date); 
	     calendar.add(calendar.DATE,days);//把日期往后增加一天.整数往后推,负数往前移动 
	     date=calendar.getTime();   
	     return date;
	}
	*/
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

	
}
