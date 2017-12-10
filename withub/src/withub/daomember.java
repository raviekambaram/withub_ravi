package withub;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import withub.member;

public class daomember {
	private static Connection connect() {
		Connection con=null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/withub","root","root");
			//con=DriverManager.getConnection("jdbc:mysql://mhub.co22bzlmbxnt.us-west-2.rds.amazonaws.com/withubdb","withubse","withubse");
			System.out.println("connected");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
public static ResultSet LoginUser(member m, String sql) {
		
		ResultSet rs = null;
		Connection con = connect();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, m.getEmail());
			ps.setString(2, m.getPassword());
			
			
			rs= ps.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return rs;
	}
public static ResultSet profiles(member m, String sql) {
	
	ResultSet rs = null;
	Connection con = connect();
	try {
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, Integer.toString(m.getMID()));
		
		
		
		rs= ps.executeQuery();
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	
	return rs;
}

public static int updatemember(member m, String sql) {
	int i=0;
	//sql="update mtor set insurances_covered=?,specialization=?,addressline1=?,addressline2=?,city=?,state=?,country=?,zipcode=?,phone_number=? where email_id=?";
	Connection con=connect();
	try {
		PreparedStatement ps=con.prepareStatement(sql);
		
		ps.setLong(1, m.getMID());
		ps.setString(2, m.getFname());
		ps.setString(3, m.getLname());
		ps.setString(4, m.getEmail());
		ps.setString(5, m.getPassword());
		ps.setString(6, m.getPhone());
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
		ps.setString(18, m.getAddress());
		ps.setString(19, m.getProject_description());
		ps.setString(20, m.getIndustry());
		ps.setString(21, m.getQualification());
		ps.setString(22, m.getExpertise_areas());
		ps.setString(23, m.getExperience());
		ps.setString(24, m.getSalary_expected());
		ps.setString(25, m.getPrefered_location());
		ps.setString(26, m.getGender());
		ps.setString(27, m.getFile_path());
		
		
		
		ps.execute();
		i=1;
	} catch (SQLException e) {
	
		System.out.println(e);
	}
	
	return i;
}

public static int updatemember1(member m, String sql) {
	int i=0;
	//sql="update mtor set insurances_covered=?,specialization=?,addressline1=?,addressline2=?,city=?,state=?,country=?,zipcode=?,phone_number=? where email_id=?";
	Connection con=connect();
	try {
		PreparedStatement ps=con.prepareStatement(sql);
		
		//fname=?,lname=?,email=?,phone=?,address=?,project_description=?,industry=?,qualification=?,expertise_areas=?,experience=?,salary_expected=?,prefered_location=?,password=?,gender=? where MID=?
	 	ps.setString(1, m.getFname());
		ps.setString(2, m.getLname());
		ps.setString(3, m.getPhone());
		ps.setString(4, m.getAddress());
		ps.setString(5, m.getProject_description());
		ps.setString(6, m.getIndustry());
		ps.setString(7, m.getQualification());
		ps.setString(8, m.getExpertise_areas());
		ps.setString(9, m.getExperience());
		ps.setString(10, m.getSalary_expected());
		ps.setString(11, m.getPrefered_location());
		
		ps.setString(12, m.getEmail());
		
		/*
		String query=StringFormatting.stringFormat("update member set fname='{0}',lname='{1}',phone='{2}',address='{3}',project_description='{4}',industry='{5}',qualification='{6}',expertise_areas='{7}',experience='{8}',salary_expected='{9}',prefered_location='{10}',password='{11}',gender='{12}' where MID='{13}'", new Object[]{m.getFname(),m.getLname(),m.getPhone(),m.getAddress(),m.getProject_description(),m.getIndustry(),m.getQualification(),m.getExpertise_areas(),m.getExperience(),m.getSalary_expected(),m.getPrefered_location(),m.getPassword(),m.getGender(),m.getMID()});
		PreparedStatement ps=con.prepareStatement(query);
		*/
		System.out.println(sql);
		
		ps.execute();
		i=1;
	} catch (SQLException e) {
	
		System.out.println(e);
	}
	
	return i;
}


}
