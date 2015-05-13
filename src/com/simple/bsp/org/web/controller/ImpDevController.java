package com.simple.bsp.org.web.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.simple.bsp.common.util.GetJDBCConnection;

public class ImpDevController {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		try{
			
			File file = new File("D:\\22.txt");
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
				String devSql = "insert into dev_info (dev_ip, dev_subnet_mask, dev_gateway, dev_mac, dev_org," +
						"dev_type, dev_seq_num, dev_status, supplier, phone, banker, bank_phone, " +
						"submit_by, submit_org, submit_time, remark, higher_org) "
						+ "values (?,?,?,?,?,?,'',?,?,'','','',?,?,?,'',?)";
				
				
				
				String[] myData = new String[12];
				myData = dataList.get(i).toString().split(",");
				myData[0] = myData[0].replaceAll("\"", ""); 
				myData[1] = myData[1].replaceAll("\"", ""); // orgId
				myData[2] = myData[2].replaceAll("\"", ""); // IP
				myData[3] = myData[3].replaceAll("\"", ""); //SUBNET_MASK
				myData[4] = myData[4].replaceAll("\"", ""); //GATEWAY
				myData[5] = myData[5].replaceAll("\"", ""); //MAC
				myData[6] = myData[6].replaceAll("\"", ""); ////type
				myData[7] = myData[7].replaceAll("\"", ""); // supplier
				/*myData[8] = myData[8].replaceAll("\"", ""); //devCode
				myData[9] = myData[9].replaceAll("\"", ""); //devgroup屏幕编号
				myData[10] = myData[10].replaceAll("\"", ""); //dev_name lcd或者Tv、PC
*/				
					SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String date = dateformat.format(new Date());
					String submit_by = "admin";
					String submit_org = "org0000";
					String submit_time = date;
					//String devGroup = myData[9];屏幕编号
					String devIp = myData[2];
					String Supplier = myData[7];
					String status = "1";
					String devType = myData[6];
					String devGateway = myData[4];
					String mac = myData[5];
					String id = myData[1];
					String subnet_mask = myData[3];
					//String dev_name = myData[10];
					System.out.println("id=" + myData[1]);
					String supplier = "";
					if(Supplier.equals("奥拓公司") || Supplier.equals("奥拓") || Supplier.equals("AOTO") || Supplier.equals("auto")){
						supplier = "1";
					}else if(Supplier.equals("欣瑞公司") || Supplier.equals("欣瑞") || Supplier.equals("xinrui") || Supplier.equals("XINRUI")){
						supplier = "0";
					}
					String orgSql = "select org_id from pub_org_desc where pub_org_desc.id like '%" + id+"%'";
					PreparedStatement pstmt2 = conn.prepareStatement(orgSql);
					ResultSet rs = pstmt2.executeQuery();
					String org_id = "";
					while(rs.next()){
						org_id = rs.getString("org_id");
					}
					
					System.out.println("org_id=" + org_id);
					PreparedStatement pstmt1 = conn.prepareStatement(devSql);
					pstmt1.setString(1, devIp);
					pstmt1.setString(2, subnet_mask);
					pstmt1.setString(3, devGateway);
					pstmt1.setString(4, mac);
					pstmt1.setString(5, org_id);
					pstmt1.setString(6, devType);
					pstmt1.setString(7, status);
					pstmt1.setString(8, supplier);
					pstmt1.setString(9, submit_by);
					pstmt1.setString(10, submit_org);
					pstmt1.setString(11, submit_time);
					pstmt1.setString(12, org_id);
					System.out.println("devIp=" + devIp + "subnet_mask=" + subnet_mask + "devGateway=" + devGateway + "mac=" + mac
							+ "org_id= " + org_id + "devType=" + devType + "status=" + status + "supplier=" + supplier + "submit_by=" + submit_by
							+ "submit_org" + submit_org + "submit_time" + submit_time);
					pstmt1.executeUpdate();
					
		
				}
		
				conn.close();

		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
