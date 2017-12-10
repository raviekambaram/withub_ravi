package com.wit.job;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import withub.DBCon;
import  withub.member;

public class daoempl {
	
	
	/*private static Connection connect() {
		Connection con=null;
		String driver="com.mysql.jdbc.Driver";
		
		try {
			try {
				//Class.forName("com.mysql.jdbc.Driver");
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("aft class for name");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/withub","root","root");
			//con=DriverManager.getConnection("jdbc:mysql://mhub.co22bzlmbxnt.us-west-2.rds.amazonaws.com/withubdb","withubse","withubse");
			System.out.println("connected");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}*/
	
public static ResultSet LoginUser(empl m, String sql) {
		
		ResultSet rs = null;
		Connection con = null;
		try {
			con = DBCon.getConnection();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, m.getEmail());
			ps.setString(2, m.getPassword());
			ps.setString(3, m.loginAs());
			
			rs= ps.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return rs;
	}

public static void InsertUser(empl m, String sql) {
	
	ResultSet rs = null;
	Connection con = null;
	try {
		con = DBCon.getConnection();
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	try {
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, m.getFname());
		ps.setString(2, m.getLname());
		ps.setString(3, m.getEmail());
		ps.setString(4, m.getPassword());
		ps.setString(5, m.loginAs());
		ps.setString(6, m.getaddress());
		ps.setString(7, m.getcity());
		ps.setString(8, m.getstate());
		ps.setString(9, m.getzip());
		ps.setString(10, m.getphoneno());
		
		
		ps.execute();
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	
	//return rs;
}


public static ResultSet checkRegistered(empl m, String sql) {
	
	ResultSet rs = null;
	Connection con = null;
	try {
		con = DBCon.getConnection();
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	try {
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, m.getEmail());
		
		rs= ps.executeQuery();
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	
	return rs;
}


public static int updatemember(empl m, String sql) {
	int i=0;
	//sql="update mtor set insurances_covered=?,specialization=?,addressline1=?,addressline2=?,city=?,state=?,country=?,zipcode=?,phone_number=? where email_id=?";
	Connection con = null;
	try {
		con = DBCon.getConnection();
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	try {
		PreparedStatement ps=con.prepareStatement(sql);
		
		ps.setLong(1, m.getMID());
		ps.setString(2, m.getFname());
		ps.setString(3, m.getLname());
		ps.setString(4, m.getEmail());
		ps.setString(5, m.getPassword());
		ps.setLong(6, m.getPhone());
		ps.setString(7, m.getDob());
		ps.setString(8, m.getDoj());
		ps.setString(9, m.getYop());
		ps.setString(10, m.getCurrent_status());
		ps.setString(11, m.getCollege_name());
		ps.setString(12, m.getOccupation());
		ps.setString(13, m.getCompany());
		ps.setString(14, m.getDesignation());
		ps.setString(15, m.getCity());
		ps.setString(16, m.getSecurity_question());
		ps.setString(17, m.getSecurity_answer());

		
		
		
		ps.execute();
		i=1;
	} catch (SQLException e) {
	
		System.out.println(e);
	}
	
	return i;
}


}
