package withub;

import java.sql.*;
public class RegisterDAO {
	
	public boolean emailCheck(String email,String user)
	{
		String sql;
		boolean isExist=false;
		try
		{
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/withub", "root", "root");
		
		//con=DriverManager.getConnection("jdbc:mysql://withub.co22bzlmbxnt.us-west-2.rds.amazonaws.com/withubdb","withubse","withubse");
		if(user.equals("member"))
			sql="select email from member where email=?";
		else
			sql="select email from member where email=?";
		
		PreparedStatement preparedStmt = con.prepareStatement(sql);
		preparedStmt.setString(1, email);
		
		ResultSet rs=preparedStmt.executeQuery();
		if(rs.next())
			isExist=true;
		else
			isExist=false;
		
		con.close();
		
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return isExist;
	}
	
	public void insertmember(member p)
	{
		try
		{
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/witHub", "root", "root");
		//con=DriverManager.getConnection("jdbc:mysql://withub.co22bzlmbxnt.us-west-2.rds.amazonaws.com/withubdb","withubse","withubse");
		
		String sql="insert into member(MID,fname,lname,email,password,phone,dob,doj.yop,current_status,college name,occupation,company,designation,city,security_question,security_answer)"+"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement preparedStmt = con.prepareStatement(sql);
		preparedStmt.setLong(1, p.getMID());
		preparedStmt.setString(2, p.getFname());
		preparedStmt.setString(3, p.getLname());
		preparedStmt.setString(4, p.getEmail());
		preparedStmt.setString(5, p.getPassword());
		preparedStmt.setString(6, p.getPhone());		
		preparedStmt.setString(7, p.getDob());
		preparedStmt.setString(8, p.getDoj());
		preparedStmt.setString(9, p.getYop());
		preparedStmt.setString(10, p.getCurrent_status());
		preparedStmt.setString(11, p.getCollege_name());
		preparedStmt.setString(12, p.getOccupation());
		preparedStmt.setString(13, p.getCompany());
		preparedStmt.setString(14, p.getDesignation());
		preparedStmt.setString(15, p.getCity());
		preparedStmt.setString(16, p.getSecurity_question());
		preparedStmt.setString(17, p.getSecurity_answer());

		
		
		preparedStmt.execute();
	    con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	public void insertmember1(member p) {
		// TODO Auto-generated method stub
		try
		{
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/witHub", "root", "root");
		//con=DriverManager.getConnection("jdbc:mysql://withub.co22bzlmbxnt.us-west-2.rds.amazonaws.com/withubdb","withubse","withubse");
		
		String sql="insert into member(fname,lname,email,password,security_question,security_answer,Profile_Pic)"+"values(?,?,?,?,?,?,?)";
		PreparedStatement preparedStmt = con.prepareStatement(sql);
		
		preparedStmt.setString(1, p.getFname());
		preparedStmt.setString(2, p.getLname());
		preparedStmt.setString(3, p.getEmail());
		preparedStmt.setString(4, p.getPassword());
				
		//preparedStmt.setString(6, p.getDob());

		preparedStmt.setString(5, p.getSecurity_question());
		preparedStmt.setString(6, p.getSecurity_answer());
		preparedStmt.setString(7, p.getFile_path());
		
		
		preparedStmt.execute();
	    con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}

		
	}

}
