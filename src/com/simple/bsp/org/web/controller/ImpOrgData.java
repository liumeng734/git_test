/**
 * 
 */
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

/**
 * @author Administrator
 *
 */
public class ImpOrgData {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		try{
			
			File file = new File("D:\\org1.txt");
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
			
			String orgSql = "insert into pub_org (org_id, org_code, org_name, enable, org_address, org_desc, org_reserve1, org_reserve2) " +
					 "values (?, '', ?, '1', '', '', '', '')";
			String descSql = "insert into pub_org_desc (id, org_id, org_level, parent_id, is_parent, open) values " +
					 "(?, ?, ?, ?, ?, '')";
			
			PreparedStatement pstmt1 = conn.prepareStatement(orgSql);
			PreparedStatement pstmt2 = conn.prepareStatement(descSql);
			
			for(int i = 0; i < dataList.size(); i++){
				
				String[] myData = new String[3];
				myData = dataList.get(i).toString().split(",");
				myData[0] = myData[0].replaceAll("\"", "");//ORG_ID
				myData[1] = myData[1].replaceAll("\"", "");//org_name
				myData[2] = myData[2].replaceAll("\"", "");//org_desc
				
				String orgId = NextID.getNextID("org");
				String orgName = myData[1];
				String id = myData[0];
				String orgLevel = id.length()/4+"";
				String pId = id.substring(0, id.length()-4);
				String isParent = "";
				String myId = id;	//用于判断是否叶节点
				
				pstmt1.setString(1, orgId);
				pstmt1.setString(2, orgName);
				
				pstmt2.setString(1, id);
				pstmt2.setString(2, orgId);
				pstmt2.setString(3, orgLevel);
				pstmt2.setString(4, pId);
				if(myId.length()!= 16){
					isParent = "1";
				}else{
					isParent = "0";
				}
				pstmt2.setString(5, isParent);
				
				if(pstmt1.executeUpdate() > 0){
					pstmt2.executeUpdate();
				}
				
				
			}
			
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
