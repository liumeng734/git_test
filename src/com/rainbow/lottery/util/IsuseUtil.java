package com.rainbow.lottery.util;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.rainbow.customer.po.DataBaseProperties;
import com.rainbow.customer.util.PropertyUtil;
import com.rainbow.lottery.po.IsuseClass;

public class IsuseUtil {

	private static Connection con = getConnection();
	private static List<IsuseClass> isuseList= null;
	//用来办理用户提款的
	private static Connection getConnection(){
		Connection conn = null;
		PropertyUtil propetyUtil = new PropertyUtil();		
		try {			
			DataBaseProperties dataBase = propetyUtil.getProperty();
			//Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection(dataBase.getUrl(), dataBase.getUserName(), dataBase.getPassWord());
			//conn = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/simple?useUnicode=true&characterEncoding=UTF-8", "root", "root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	public static List<IsuseClass> getIsuseList() {
		//
		String sql = "select id, start_datetime, end_datetime from isuse_class where 1=1 ";
		List<IsuseClass> isuseLists = new ArrayList<IsuseClass>();
		try {
			Statement st =  (Statement) con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				IsuseClass ic = new IsuseClass();
				//System.out.println(rs.getString("id"));
				ic.setId(rs.getString("id"));
				ic.setStart_datetime(rs.getString("start_datetime"));
				ic.setEnd_datetime(rs.getString("end_datetime"));
				isuseLists.add(ic);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		isuseList = isuseLists;
		return isuseList;
	}
	
}
