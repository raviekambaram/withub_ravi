package com.wit.job;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class applicationSessionCheck
 */
@WebServlet("/applicationSessionCheck")
public class applicationSessionCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public applicationSessionCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		HttpSession newsess =request.getSession(false);
		if(newsess!=null)
		{
			System.out.println("session valid");
			System.out.println(newsess.getAttribute("employeeID"));
			System.out.println(" jobsessionemployee "+newsess.getAttribute("jobsessionemployee"));
			System.out.println("LoginSession "+newsess.getAttribute("LoginSession"));
			newsess.invalidate();
		}
		else
		{
			System.out.println("session invalid");
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	
	}

}
