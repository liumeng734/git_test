package com.simple.bsp.org.web.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import com.simple.bsp.common.util.GetJDBCConnection;

public class LedScreenData {

	/**
	 * @param args
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws SQLException {
		createLedScreen();
		//test();
	}

	public static void createLedScreen() throws SQLException{
		String [] Company = {"ybbx","visionshow"};
		String [] Ctl_type = {"onbon_3m","onbon_4m",""};
		String [] Port = {"1024","6666"};
		String Height = "32";
		String Width = "16";
		String Submit_by = "admin";
		String Submit_org = "org0000";
		SimpleDateFormat DateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		ArrayList<String> orgList = getOrgIdList();
		ArrayList<String> ipList = getIp();
		Connection conn = GetJDBCConnection.getJDBCConnection();
		String sql = "insert into led_screen(ip,led_org,led_company,ctl_type,port,heigth,width,submit_by,submit_org,submit_time) " +
				"values(?,?,?,?,?,?,?,?,?,?);";
		String Sql = "insert into led_ybbx(ip,screen_no,screen_type,pixel_mode,data_da,data_oe,font_name,font_size,bold,play_type," +
				"run_speed,stop_time) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		String visionSql = "in" +
				"sert into led_visionshow(ip,local_port,play_time,play_mode,screen_type,font_name,font_size,font_color," +
				"font_style,word_wrap,alignment,in_method,in_speed,out_method,out_speed,stop_method,stop_speed,stop_time) " +
				"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps1 = conn.prepareStatement(sql);
		PreparedStatement ps2 = conn.prepareStatement(Sql);
		PreparedStatement ps3 = conn.prepareStatement(visionSql);
		for(int i = 0; i < 50; i++){
			String company = Company[0];
			String ctl_type = Ctl_type[0];
			String port = Port[0];
			String ip = ipList.get(i);
			ps1.setString(1, ip);
			ps1.setString(2, orgList.get(i));
			ps1.setString(3, company);
			ps1.setString(4, ctl_type);
			//ps1.setString(4, "");
			ps1.setString(5, port);
			ps1.setString(6, Height);
			ps1.setString(7, Width);
			ps1.setString(8, Submit_by);
			ps1.setString(9, Submit_org);
			ps1.setString(10, DateFormat.format(date));
			if(company.equals("ybbx")){
				ps2.setString(1, ip);
				ps2.setString(2, "1");
				ps2.setString(3, "1");
				ps2.setString(4, "1");
				ps2.setString(5, "0");
				ps2.setString(6, "1");
				ps2.setString(7, "宋体");
				ps2.setString(8, "12");
				ps2.setString(9, "0");
				ps2.setString(10, "4");
				ps2.setString(11, "1");
				ps2.setString(12, "1");
				if(ps1.executeUpdate() > 0){
					System.out.println("这是第[" + i + "]次循环");
					ps2.executeUpdate();
				}
			}else{
				ps3.setString(1, ip);
				ps3.setString(2, "9999");
				ps3.setString(3, "0");
				ps3.setString(4, "34");
				ps3.setString(5, "2");
				ps3.setString(6, "宋体");
				ps3.setString(7, "12");
				ps3.setString(8, "65535");
				ps3.setString(9, "0");
				ps3.setString(10, "0");
				ps3.setString(11, "0");
				ps3.setString(12, "6");
				ps3.setString(13, "1");
				ps3.setString(14, "6");
				ps3.setString(15, "1");
				ps3.setString(16, "0");
				ps3.setString(17, "1");
				ps3.setString(18, "1");
				if(ps1.executeUpdate() > 0){
					ps3.executeUpdate();
				}
			}

			System.out.println("这是第[" + i + "]次循环");
			
		}
		
	}
	public static ArrayList<String> getOrgIdList() throws SQLException{
		Connection conn = GetJDBCConnection.getJDBCConnection();
		String sql = "select org_id from pub_org where org_id != 'org0000'";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<String> orgList = new ArrayList<String>();
		while(rs.next()){
			orgList.add(rs.getString(1));
		}
		return orgList;
	}
	public static ArrayList<String> getIp(){
		ArrayList<String> ipList = new ArrayList<String>();
		for(int i = 1; i < 250; i++){
			String ipnum = String.valueOf(i);
			String ip = "200.168.1." + ipnum ;
			ipList.add(ip);
		}
		return ipList;
	}
	public static void test(){
		ArrayList<String> ipList = getIp();
		for(int i = 0; i < 200; i++){
			System.out.println("ip=" + ipList.get(i));
		}
	}
}
