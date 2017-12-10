package com.wit.job;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class jobdescServlet
 */
@WebServlet("/jobdescServlet")
public class jobdescServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public jobdescServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	String jobID = request.getParameter("jobID");
	System.out.println("JOb ID: " +jobID);
	
	HttpSession session = request.getSession();
	String loggedIN = (String) session.getAttribute("jobsessionemployee");
	boolean isLoggedin = false;
	if(loggedIN!=null && loggedIN!="null")
	{
	if(loggedIN.equalsIgnoreCase("SET"))
	{
		isLoggedin = true;
	}
	}
	System.out.println("loggedIN: " +loggedIN);
	
	if(isLoggedin)
	{
        getServletContext().getRequestDispatcher("/jobapplyConf.jsp?jobID="+jobID).forward(request, response);
	
	}
	else
	{
		/*jobdescServlert?jobID=<%=jobID%>*/
		String loginUrl="/jobLogin.html?jobID="+jobID;
        getServletContext().getRequestDispatcher("/jobLogin.html?jobID="+jobID).forward(request, response);

	}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
