package com.wit.job;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import withub.DBCon;

/**
 * Servlet implementation class displayResume
 */
@WebServlet("/displayResume")
public class displayResume extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public displayResume() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
// 1. Get a connection to database
		try{
			myConn = DBCon.getConnection();
		
		// 2. Execute statement
		myStmt = myConn.createStatement();
		String applicationID = request.getParameter("applicationID");
		System.out.println("HI"+applicationID);
		String sql = "select resume_1 from withub.applicants where applicantID="+applicationID;
		myRs = myStmt.executeQuery(sql);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

//response.setContentType("image/jpeg");
		response.setContentType("application/pdf");
ServletOutputStream out;
Blob img ;
out = response.getOutputStream();
FileInputStream fin = null;
try {
	while(myRs.next())
	{
		img = myRs.getBlob(1);
		byte[] imgData = img.getBytes(1,(int)img.length());
		OutputStream o = response.getOutputStream();
	       o.write(imgData);
	       o.flush(); 
	       o.close();
//fin = new FileInputStream("photo");  
	}
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} 
//BufferedInputStream bin = new BufferedInputStream(fin);  
// BufferedOutputStream bout = new BufferedOutputStream(out);  
// int ch =0; ;  
// while((ch=bin.read())!=-1)  
// {  
//bout.write(ch);  
//}  
  
//bin.close();  
//fin.close();  
//bout.close();

out.close();  

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
