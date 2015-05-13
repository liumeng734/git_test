package com.simple.bsp.common.util;

import org.apache.log4j.Logger;

/**
 * @author simple
 *
 */
public class Encrypt {
	
	private static Logger logger = Logger.getLogger(Encrypt.class);
	
	/**
	 * 加密通信字符串
	 * @param sockStr
	 * @return
	 */
	public static String getSockEncryptByInt(String sockStr){
		
		String result="";
		
		//直接运行使用如下配置
		//String sockKey="1234567890abcdef0abcdef123456789"; 	//密钥
		//String sockStatus = "1";						   	//状态开关
		
		//在应用中运行使用如下配置
		String sockKey = (PubData.getSockData("value") == null)?"":PubData.getSockData("value").toString();
		String sockStatus = (PubData.getSockData("status") == null)?"":PubData.getSockData("status").toString();
		logger.info("获取通信加密KEY为:["+sockKey+"]，状态status为["+sockStatus+"]");
		
		if(sockKey.equals("") || sockStatus.equals("")){
			logger.error("获取通信加密KEY或status异常，退出加密程序！");
		}else{
			if(sockStatus.equals("0")){
				result = sockStr;
				logger.info("通信加密关闭，无法加密，返回原始字符串:["+result+"]");
			}else{
				logger.info("待加密字符串为:["+sockStr+"]");
				int[] snNum=new int[sockStr.length()];
		        String temp="";

		        for(int i=0,j=0;i<sockStr.length();i++,j++){
		            if(j==sockKey.length()){
		            	j=0;
		            }
		            snNum[i]=sockStr.charAt(i)^sockKey.charAt(j);
		        }
		        
		        for(int k=0;k<sockStr.length();k++){
		        	//logger.info("["+k+"]->["+snNum[k]+"]");
		            if(snNum[k]<10){
		                temp="000"+snNum[k];
		            }else if(snNum[k] >= 10 && snNum[k]<100){
		            	temp="00"+snNum[k];
		            }else if(snNum[k] >= 100 && snNum[k]<1000){
		            	temp="0"+snNum[k];
		            }else{
		            	logger.error("加密运算过程中生成的中间值["+snNum[k]+"]超过限制，请联系开发人员进行修改！");
		            }
		            result+=temp;
		        }
		        logger.info("加密后的字符串为:["+result+"]");
			}
		}
        return result;
	}
	
	/**
	 * 解密通信字符串
	 * @param encryptStr
	 * @return
	 */
	public static String getSockDecryptByInt(String encryptStr){
		
		String result="";
		
		//直接运行使用如下配置
		//String sockKey="1234567890abcdef0abcdef123456789"; 	//密钥
		//String sockStatus = "1";						   		//状态开关
		
		//在应用中运行使用如下配置
		String sockKey = (PubData.getSockData("value") == null)?"":PubData.getSockData("value").toString();
		String sockStatus = (PubData.getSockData("status") == null)?"":PubData.getSockData("status").toString();
		logger.info("获取通信解密KEY为:["+sockKey+"]，状态status为["+sockStatus+"]");
		
		if(sockKey.equals("") || sockStatus.equals("")){
			logger.error("获取通信解密KEY或status异常，退出解密程序！");
		}else{
			if(sockStatus.equals("0")){
				result = encryptStr;
				logger.info("通信解密关闭，无法解密，返回原始字符串:["+result+"]");
			}else{
				logger.info("待解密字符串为:["+encryptStr+"]");
				char[] snNum=new char[encryptStr.length()/4];

		        for(int i=0,j=0;i<encryptStr.length()/4;i++,j++){
		            if(j==sockKey.length()){
		            	j=0;
		            }
		            int n=Integer.parseInt(encryptStr.substring(i*4,i*4+4));
		            snNum[i]=(char)((char)n^sockKey.charAt(j));
		        }

		        for(int k=0;k<encryptStr.length()/4;k++){
		            result+=snNum[k];
		        }
		        logger.info("解密后的字符串为:["+result+"]");
			}
		}
        return result;
	}
	
	/**
	 * 加密通信字符串
	 * @param sockStr
	 * @return
	 */
	public static String getSockEncrypt(String sockStr){
		
		String result="";
		
		//直接运行使用如下配置
		String sockKey="1234567890abcdef0abcdef123456789"; 	//密钥
		String sockStatus = "1";						   	//状态开关
		
		//在应用中运行使用如下配置
		//String sockKey = (PubData.getSockData("value") == null)?"":PubData.getSockData("value").toString();
		//String sockStatus = (PubData.getSockData("status") == null)?"":PubData.getSockData("status").toString();
		logger.info("获取通信加密KEY为:["+sockKey+"]，状态status为["+sockStatus+"]");
		
		if(sockKey.equals("") || sockStatus.equals("")){
			logger.error("获取通信加密KEY或status异常，退出加密程序！");
		}else{
			if(sockStatus.equals("0")){
				result = sockStr;
				logger.info("通信加密关闭，无法加密，返回原始字符串:["+result+"]");
			}else{
				logger.info("待加密字符串为:["+sockStr+"]");
				char[] data = sockStr.toCharArray();
				//byte[] keyData = sockKey.getBytes();
				char[] key = HexString2Bytes(sockKey);
				
				for(int i = 0; i < sockStr.length(); i++) {
					data[i] ^= key[i % 16];
				}
				result = new String(data);
		        logger.info("加密后的字符串为:["+result+"]");
			}
		}
        return result;
	}
	
	/**
	 * 每两个字符分割转换为16进制形式，如"1234abcd"-->byte[]{0x12,0x34,0xab,0xcd}
	 * @param srcStr
	 * @return
	 */
	private static char[] HexString2Bytes(String keyStr){
		byte[] keyByte = keyStr.getBytes();
		char[] ret = new char[keyByte.length/2];
		
		for(int i = 0; i < keyByte.length/2; i = i+2){
			char tmp1 = (char)keyByte[i];
			char tmp2 = (char)keyByte[i+1];
			char high = (char)(0xFF00 & (tmp1 << 8));
			char low = (char)(0x00FF & tmp2);
			ret[i] = (char)(high ^ low);
		}
		return ret;
	}
	
	public static void main(String[] args){
		
		getSockEncrypt(getSockEncrypt("This is my phone!"));
	
	}

}
