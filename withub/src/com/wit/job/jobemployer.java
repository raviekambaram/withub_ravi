package com.wit.job;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class jobemployer
 */
@WebServlet("/jobemployer")
public class jobemployer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public jobemployer() {
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

		// TODO Auto-generated method stub
		String email = request.getParameter("employeremail");
		String pass = request.getParameter("employerpword");
		String loginAs = "employer";
		
		
		if(email.equals(null)||email.equals("")||pass.equals(null)||pass.equals("")){
			request.setAttribute("msgg", "All Fields are mandatory");
			getServletContext().getRequestDispatcher("/jobLogin1.html").forward(request, response);
		}else
		{
			
			System.out.println("Values retrieved Email = " + email + "pass = " + pass);
			//2.set all values in Model class' object
			empl m = new empl();
			
			m.setEmail(email);
			m.setPassword(pass);
			m.loginAs(loginAs);
			String sql="select * from empluser where email=? and pword=? and login_as=?";
			
			
			
			//3. call a method in Dao to select data form table
			//also set a session
			HttpSession session	= request.getSession();	
			ResultSet rs = daoempl.LoginUser(m,sql);
			
			//set session attributes from the database result set 
			try {
				if(rs.next()){
					session.setAttribute("userid", rs.getInt(1));
					session.setAttribute("jobsession", "SET");
					/*					session.setAttribute("fname", rs.getString(2));
					session.setAttribute("lname", rs.getString(3));
					session.setAttribute("email", rs.getString(4));
					session.setAttribute("pass", rs.getString(5));
					session.setAttribute("phone", rs.getString(6));
					session.setAttribute("dob", rs.getString(7));
					session.setAttribute("doj", rs.getString(8));
					session.setAttribute("yop", rs.getString(9));
					session.setAttribute("current_status", rs.getString(10));
					session.setAttribute("college_name", rs.getString(11));
					session.setAttribute("occupation", rs.getString(12));
					session.setAttribute("company", rs.getString(13));
					session.setAttribute("destination", rs.getString(14));
					session.setAttribute("city", rs.getString(15));
					session.setAttribute("seques", rs.getString(16));
					session.setAttribute("seanws", rs.getString(17));
*/					
					
					//pass session attribute to searchdoctor.jsp
					//use any attributes search page may need
					getServletContext().getRequestDispatcher("/jobemployer.jsp").forward(request, response);
					//searchdoctor.jsp should have one more navigator (href)for patient to 'update info' and it can link to UpdatePtient.jsp
					//I have sent the my modified searchdoctor.jsp as a reference 
					
					//*request.getRequestDispatcher("/searchdoctor.jsp").forward(request, response);
				}else{
					request.setAttribute("msgg", "E-mail/Password do not match");
					getServletContext().getRequestDispatcher("/jobLogin1.html").forward(request, response);
					
				}
			} catch (SQLException e) {
	
				System.out.println(e);
				e.printStackTrace();
			}
		}

	
	}

}
