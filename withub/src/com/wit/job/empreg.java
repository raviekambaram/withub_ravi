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
 * Servlet implementation class empreg
 */
@WebServlet("/empreg")
public class empreg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public empreg() {
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
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String pass = request.getParameter("pwd");
		String phoneno = request.getParameter("phoneno");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zip = request.getParameter("zip");
	
		
		String loginAs = "employee";
		//check if already registered
		empl m1 = new empl();
		m1.setEmail(email);
		String sqlemail="select * from empluser where email=?";
		ResultSet rs0 = daoempl.checkRegistered(m1,sqlemail);
		try {
			while(rs0.next())
			{
				getServletContext().getRequestDispatcher("/jobLogin2.html").forward(request, response);
				break;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		if(fname.equals(null)||fname.equals("")||lname.equals(null)||lname.equals("")||email.equals(null)||email.equals("")||pass.equals(null)||pass.equals("")){
			//request.setAttribute("msgg", "Please fill in all the mandatory fields");
			getServletContext().getRequestDispatcher("/jobRegistrationEmployee1.jsp").forward(request, response);
		}else
		{
			
			System.out.println("Values retrieved Email = " + email + "pass = " + pass);
			//2.set all values in Model class' object
			empl m = new empl();
			m.setFname(fname);
			m.setLname(lname);
			m.setEmail(email);
			m.setPassword(pass);
			m.loginAs(loginAs);
			m.setaddress(address);
			m.setcity(loginAs);
			m.setstate(loginAs);
			m.setzip(loginAs);
			m.setphoneno(phoneno);
			String sql="insert into empluser (`fname`,`lname`,`email`,`pword`,`login_as`,`address`,`city`,`state`,`zip`,`phoneno`) values (?,?,?,?,?,?,?,?,?,?)";
			
			
			
			//3. call a method in Dao to select data form table
			//also set a session
			HttpSession session	= request.getSession();	
			daoempl.InsertUser(m,sql);
			
			//set session attributes from the database result set 
			
					getServletContext().getRequestDispatcher("/jobLogin.html").forward(request, response);
					//searchdoctor.jsp should have one more navigator (href)for patient to 'update info' and it can link to UpdatePtient.jsp
					//I have sent the my modified searchdoctor.jsp as a reference 
					
					//*request.getRequestDispatcher("/searchdoctor.jsp").forward(request, response);
				
	
	

}
	}
}