package com.rainbow.customer.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import com.rainbow.customer.po.DataBaseProperties;

public class PropertyUtil {

	public  DataBaseProperties getProperty(){
		DataBaseProperties dataBaseProperties = new DataBaseProperties();
		//String configPath = this.getWebInfPath();
		String configPath = "/database.properties";
		Properties pro = new Properties();
		InputStream is = this.getClass().getResourceAsStream(configPath);
		try {
			pro.load(is);
			dataBaseProperties.setDriverClassName(pro.getProperty("mysql.driverClassName"));
			dataBaseProperties.setUrl(pro.getProperty("mysql.url"));
			dataBaseProperties.setUserName(pro.getProperty("mysql.username"));
			dataBaseProperties.setPassWord(pro.getProperty("mysql.password"));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dataBaseProperties;
	}
	
	private String getWebInfPath() {
		String path = getWebClassesPath();
		if (path.indexOf("WEB-INF") > 0) {
			path = path.substring(1, path.indexOf("WEB-INF")+8);
		}
		return path;
	}

	private String getWebClassesPath() {
		String path = "/" + getClass().getProtectionDomain().getCodeSource()
				.getLocation().getPath();
		return path;
	}
}
