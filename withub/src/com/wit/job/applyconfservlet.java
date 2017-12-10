package com.wit.job;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import withub.DBCon;

/**
 * Servlet implementation class applyconfservlet
 */
@WebServlet("/applyconfservlet")
@MultipartConfig(maxFileSize = 16177215)
public class applyconfservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public applyconfservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String jobID = (String) request.getParameter("jobID");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String phoneno = request.getParameter("phoneno");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zip = request.getParameter("zip");
		InputStream inputStream = null; // input stream of the upload file
        
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("resume");
        if (filePart != null) {
        	inputStream = filePart.getInputStream();
        }
        
        
        
        
		HttpSession session=request.getSession();
		String applicantID =(String) session.getAttribute("employeeID");
		empl m1 = new empl();
		m1.setEmail(email);
		String sqlemail="select * from empluser where email=?";
		ResultSet rs0 = daoempl.checkRegistered(m1,sqlemail);
		try {
			while(rs0.next())
			{
				Connection con = null;
				try {
					con = DBCon.getConnection();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				PreparedStatement ps = con.prepareStatement("delete from applicants where email=?");
				ps.setString(1, email);
				ps.executeUpdate();
				PreparedStatement ps1 = con.prepareStatement("insert into applicants (fname,lname,address,city,state,zip,email,resume_1,jobID,userID,applicantID,phoneno) values (?,?,?,?,?,?,?,?,?,?,?,?)");
				ps1.setString(1, fname);
				ps1.setString(2, lname);
				ps1.setString(3, address);
				ps1.setString(4, city);
				ps1.setString(5, state);
				ps1.setString(6, zip);
				ps1.setString(7, email);
				if (inputStream != null) {
				ps1.setBlob(8, inputStream);
				}
				ps1.setString(9, jobID);
				ps1.setString(10, applicantID);
				ps1.setString(11, applicantID);
				ps1.setString(12, phoneno);
				
				ps1.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		getServletContext().getRequestDispatcher("/jobsearch1.jsp?jobID="+jobID).forward(request, response);
	
	
	}

}
