package com.wit.job;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import withub.DBCon;

/**
 * Servlet implementation class jobCreation
 */
@WebServlet("/jobCreation")
public class jobCreation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public jobCreation() {
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
		String jname = request.getParameter("jname");
		String jdesc = request.getParameter("jdesc");
		String djdesc = request.getParameter("djdesc");
		String djreq = request.getParameter("djreq");
		String location = request.getParameter("location");
		String contact = request.getParameter("contact");
		String emprname = request.getParameter("emprname");
	HttpSession session = request.getSession();
	int userID1 = (Integer) session.getAttribute("userid");
	String userID =  Integer.toString(userID1);
		try
		{
		Connection myConn = null;
			try {
				myConn = DBCon.getConnection();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String sql1 = "insert into withub.jobs (jname,jdesc,employer,job_requirement,job_location,contact_details,detailed_job_description,empID) values (?,?,?,?,?,?,?,?)";
			PreparedStatement ps = myConn.prepareStatement(sql1);
			ps.setString(1, jname);
			ps.setString(2, jdesc);
			ps.setString(3, emprname);
			ps.setString(4, djreq);
			ps.setString(5, location);
			ps.setString(6, contact);
			ps.setString(7, djdesc);
			ps.setString(8, userID);
			ps.executeUpdate();
			getServletContext().getRequestDispatcher("/jobemployer1.jsp").forward(request, response);
		
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	
	

		
	}
}
