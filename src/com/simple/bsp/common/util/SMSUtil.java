package com.simple.bsp.common.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.GZIPInputStream;

import org.apache.http.Header;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.protocol.HttpContext;
import org.apache.log4j.Logger;

/**
 * @author simple
 *
 */
public class SMSUtil {
	
	private static Logger logger = Logger.getLogger(SMSUtil.class);
	
	/**
	 * 发送短信
	 * @param mobile
	 * @param msgStr
	 * @return
	 * @throws Exception
	 */
	public static String msgSend(String mobile, String msgStr) throws Exception {
		
		//直接运行使用如下配置
		//String apiKey="b832f01bb37905df13affa7a93350b31"; 	//密钥
		//String apiStatus = "1";						   		//状态开关
		
		//在应用中运行使用如下配置
		String apiKey = (PubData.getApiData("value") == null)?"":PubData.getApiData("value").toString();
		String apiStatus = (PubData.getApiData("status") == null)?"":PubData.getApiData("status").toString();
		logger.info("获取短信API-KEY为:["+apiKey+"]，状态status为["+apiStatus+"]");
		
		if(apiKey.equals("") || apiStatus.equals("")){
			logger.error("获取短信API-KEY或status异常，退出短信程序！");
			return "";
		}else{
			if(apiStatus.equals("0")){
				logger.info("短信API关闭，无法发送短信！");
				return "";
			}else{
				DefaultHttpClient client = new DefaultHttpClient();
		        client.addRequestInterceptor(new HttpRequestInterceptor() {
		            @Override
		            public void process(HttpRequest request, HttpContext context) throws HttpException, IOException {
		                request.addHeader("Accept-Encoding", "gzip");
		                //直接运行使用如下配置
		                //String key = "b832f01bb37905df13affa7a93350b31";
		                //在应用中运行使用如下配置
		                String key = PubData.getApiData("value").toString();
		        //        request.addHeader("Authorization", "Basic " + new BASE64Encoder().encode(("api:"+key).getBytes("utf-8")));
		            }
		        });
		        client.getParams().setIntParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 30000);
		        client.getParams().setIntParameter(CoreConnectionPNames.SO_TIMEOUT, 30000);
		        HttpPost request = new HttpPost("https://sms-api.luosimao.com/v1/send.json");
		        ByteArrayOutputStream bos = null;
		        InputStream bis = null;
		        byte[] buf = new byte[10240];
		        String content = null;
		        try {
		            List<NameValuePair> params = new ArrayList<NameValuePair>();
		            params.add(new BasicNameValuePair("mobile", mobile));
		            params.add(new BasicNameValuePair("message", msgStr));
		            request.setEntity(new UrlEncodedFormEntity(params, "utf-8"));
		            HttpResponse response = client.execute(request);
		            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
		                bis = response.getEntity().getContent();
		                Header[] gzip = response.getHeaders("Content-Encoding");
		                bos = new ByteArrayOutputStream();
		                int count;
		                while ((count = bis.read(buf)) != -1) {
		                    bos.write(buf, 0, count);
		                }
		                bis.close();
		                if (gzip.length > 0 && gzip[0].getValue().equalsIgnoreCase("gzip")) {
		                    GZIPInputStream gzin = new GZIPInputStream(new ByteArrayInputStream(bos.toByteArray()));
		                    StringBuffer sb = new StringBuffer();
		                    int size;
		                    while ((size = gzin.read(buf)) != -1) {
		                        sb.append(new String(buf, 0, size, "utf-8"));
		                    }
		                    gzin.close();
		                    bos.close();
		                    content = sb.toString();
		                } else {
		                    content = bos.toString();
		                }
		                logger.info("发送返回内容为：["+content+"]");
		            } else {
		            	logger.error("错误代码为：[" + response.getStatusLine().getStatusCode()+"]");
		            }
		            return content;
		        } finally {
		            if (bis != null) {
		                try {
		                	// 最后要关闭BufferedReader
		                    bis.close();
		                    
		                } catch (Exception e) {
		                	
		                }
		            }
		        }
			}
		}
    }
	
	/**
	 * 查询账户余额
	 * @return
	 * @throws Exception
	 */
    public static String msgStatus() throws Exception {
    	
    	//直接运行使用如下配置
    	//String apiKey="b832f01bb37905df13affa7a93350b31"; 	//密钥
		//String apiStatus = "1";						   		//状态开关
		
		//在应用中运行使用如下配置
		String apiKey = (PubData.getApiData("value") == null)?"":PubData.getApiData("value").toString();
		String apiStatus = (PubData.getApiData("status") == null)?"":PubData.getApiData("status").toString();
		logger.info("获取短信API-KEY为:["+apiKey+"]，状态status为["+apiStatus+"]");
		
		if(apiKey.equals("") || apiStatus.equals("")){
			logger.error("获取短信API-KEY或status异常，退出短信程序！");
			return "";
		}else{
			if(apiStatus.equals("0")){
				logger.info("短信API关闭，无法查询账户余额！");
				return "";
			}else{
				DefaultHttpClient client = new DefaultHttpClient();
		        client.addRequestInterceptor(new HttpRequestInterceptor() {
		            @Override
		            public void process(HttpRequest request, HttpContext context) throws HttpException, IOException {
		                request.addHeader("Accept-Encoding", "gzip");
		                //直接运行使用如下配置
		                //String key = "b832f01bb37905df13affa7a93350b31";
		                //在应用中运行使用如下配置
		                String key = PubData.getApiData("value").toString();
		            //    request.addHeader("Authorization", "Basic " + new BASE64Encoder().encode(("api:"+key).getBytes("utf-8")));
		            }
		        });
		        client.getParams().setIntParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 30000);
		        client.getParams().setIntParameter(CoreConnectionPNames.SO_TIMEOUT, 30000);
		        HttpGet request = new HttpGet("https://sms-api.luosimao.com/v1/status.json");
		        ByteArrayOutputStream bos = null;
		        InputStream bis = null;
		        byte[] buf = new byte[10240];
		        String content = null;
		        try {
		            HttpResponse response = client.execute(request);
		            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
		                bis = response.getEntity().getContent();
		                Header[] gzip = response.getHeaders("Content-Encoding");
		                bos = new ByteArrayOutputStream();
		                int count;
		                while ((count = bis.read(buf)) != -1) {
		                    bos.write(buf, 0, count);
		                }
		                bis.close();
		                if (gzip.length > 0 && gzip[0].getValue().equalsIgnoreCase("gzip")) {
		                    GZIPInputStream gzin = new GZIPInputStream(new ByteArrayInputStream(bos.toByteArray()));
		                    StringBuffer sb = new StringBuffer();
		                    int size;
		                    while ((size = gzin.read(buf)) != -1) {
		                        sb.append(new String(buf, 0, size, "utf-8"));
		                    }
		                    gzin.close();
		                    bos.close();
		                    content = sb.toString();
		                } else {
		                    content = bos.toString();
		                }
		                logger.info("查询余额返回内容为：["+content+"]");
		            } else {
		            	logger.error("错误代码为：["+response.getStatusLine().getStatusCode()+"]");
		            }
		            return content;
		        } finally {
		            if (bis != null) {
		                try {
		                	//最后要关闭BufferedReader
		                    bis.close();
		                } catch (Exception e) {
		                	
		                }
		            }
		        }
			}
		}
    }

}
