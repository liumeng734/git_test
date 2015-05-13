package com.simple.bsp.common.util;

import java.util.HashMap;

/**
 * @author simple
 * 系统公共数据，系统启动或参数更新时加载至静态变量中
 *
 */
public class PubData {
	
	public static HashMap<String, Object> pubDataMap = new HashMap<String, Object>();		//系统公共数据
	
	public static HashMap<String, Object> sockDataMap = new HashMap<String, Object>();		//通信密钥数据
	public static HashMap<String, Object> apiDataMap = new HashMap<String, Object>();		//短信密钥数据
	
	public static HashMap<String, Object> matchRoleMap = new HashMap<String, Object>();		//赛事身份数据字典
	public static HashMap<String, Object> matchGroupMap = new HashMap<String, Object>();	//赛事分组数据字典
	
	/**
	 * 放值
	 * @param key
	 * @param keyValue
	 */
	public static void setData(String key,String keyValue){
		pubDataMap.put(key,keyValue);
	}
	
	/**
	 * 根据key取对应的值
	 * @param key
	 * @return
	 */
	public static Object getData(String key){
		Object  keyValue = pubDataMap.get(key);
		if(null == keyValue){
		   return ""; 
		}
		return keyValue;
	}
	
	/**
	 * 设置通信密钥相关值
	 * @param key
	 * @param keyValue
	 */
	public static void setSockData(String key,String keyValue){
		sockDataMap.put(key, keyValue);
	}
	
	/**
	 * 获取通信密钥相关值
	 * @param key
	 * @return
	 */
	public static Object getSockData(String key){
		Object keyValue = sockDataMap.get(key);
		if(null == keyValue){
			   return ""; 
		}
		return keyValue;
	}
	
	/**
	 * 设置短信密钥相关值
	 * @param key
	 * @param keyValue
	 */
	public static void setApiData(String key,String keyValue){
		apiDataMap.put(key, keyValue);
	}
	
	/**
	 * 获取通信密钥相关值
	 * @param key
	 * @return
	 */
	public static Object getApiData(String key){
		Object keyValue = apiDataMap.get(key);
		if(null == keyValue){
			   return ""; 
		}
		return keyValue;
	}
	
	/**
	 * 设置赛事身份值
	 * @param key
	 * @param keyValue
	 */
	public static void setMatchRoleData(String key,String keyValue){
		matchRoleMap.put(key, keyValue);
	}
	
	/**
	 * 获取赛事身份值
	 * @param key
	 * @return
	 */
	public static Object getMatchRoleData(String key){
		Object keyValue = matchRoleMap.get(key);
		if(null == keyValue){
			   return ""; 
		}
		return keyValue;
	}
	
	/**
	 * 设置赛事分组值
	 * @param key
	 * @param keyValue
	 */
	public static void setMatchGroupData(String key,String keyValue){
		matchGroupMap.put(key, keyValue);
	}
	
	/**
	 * 获取赛事分组值
	 * @param key
	 * @return
	 */
	public static Object getMatchGroupData(String key){
		Object keyValue = matchGroupMap.get(key);
		if(null == keyValue){
			   return ""; 
		}
		return keyValue;
	}

}
