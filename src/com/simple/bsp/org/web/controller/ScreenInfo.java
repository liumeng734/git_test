package com.simple.bsp.org.web.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import com.simple.bsp.common.util.GetJDBCConnection;
import com.simple.bsp.common.util.NextID;

public class ScreenInfo {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	try{
			
			File file = new File("D:\\555.txt");
			FileReader fr = new FileReader(file);
			BufferedReader br = new BufferedReader(fr);
			
			List<String> dataList = new ArrayList<String>();
			String ss = null;
			br.readLine();	//跳过第一行
			ss = br.readLine();
			while(ss != null && !ss.trim().equals("")){
				//System.out.println(ss);
				dataList.add(ss);
				ss = br.readLine();
			}
			
			br.close();
			fr.close();
			
			
			Connection conn = GetJDBCConnection.getJDBCConnection();
			
			for(int i = 0; i < dataList.size(); i ++){
				String devSql = "insert into screen_info (screen_id, screen_code,screen_name, screen_group, screen_type,screen_status, dev_ip) "
						+ "values (?,?,?,?,?,?,?)";
				
				
				
				String[] myData = new String[12];
				myData = dataList.get(i).toString().split(",");
				myData[0] = myData[0].replaceAll("\"", ""); 
				myData[1] = myData[1].replaceAll("\"", ""); // dev_code
				myData[2] = myData[2].replaceAll("\"", ""); // dev_name
				myData[3] = myData[3].replaceAll("\"", ""); //pc_ip
				myData[4] = myData[4].replaceAll("\"", ""); //dev_group
				myData[5] = myData[5].replaceAll("\"", ""); //type
				
				String screen_id = NextID.getNextID("screen");
				String screen_code = myData[1];
				String screen_name = myData[2];
				String Screen_group = myData[4];
				String screen_type = myData[5];
				String status = "1";
				String dev_ip = myData[3];
				
				String screen_group = "";
				if(Screen_group.equals("1") || Screen_group.equals("3") || Screen_group.equals("5") || Screen_group.equals("4")){
					screen_group = "0";
				}else if(Screen_group.equals("2") || Screen_group.equals("6")){
					screen_group = "1";
				}
				PreparedStatement pstmt1 = conn.prepareStatement(devSql);
				pstmt1.setString(1, screen_id);
				pstmt1.setString(2, screen_code);
				pstmt1.setString(3, screen_name);
				pstmt1.setString(4, screen_group);
				pstmt1.setString(5, screen_type);
				pstmt1.setString(6, status);
				pstmt1.setString(7, dev_ip);
				
				
					System.out.println("screen_id=" + screen_id + "screen_code=" + screen_code + "screen_group=" + screen_group + "screen_type=" + screen_type
							+ "dev_ip= " + dev_ip );
					pstmt1.executeUpdate();
					
		
				}
		
				conn.close();


		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
