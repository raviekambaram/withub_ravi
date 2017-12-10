package withub;

import java.io.IOException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
//@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String fname=request.getParameter("firstName");
		String lname=request.getParameter("lastName");
		//String dob=request.getParameter("dob");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String secQuestion=request.getParameter("secQuestion");
		String secAnswer=request.getParameter("secAnswer");
		String file_path = request.getParameter("file_path");
		 String replacedStr = file_path.replace("\\", "\\\\");
		//System.out.println(gender);
		RegisterDAO regdao=new RegisterDAO();
		String user="member";
		boolean alreadyExist=regdao.emailCheck(email, user);
		if(!alreadyExist)
		{
			member m= new member();
			m.setFname(fname);
			m.setLname(lname);
			//m.setDob(dob);
			m.setEmail(email);
			m.setPassword(password);
			m.setSecurity_question(secQuestion);
			m.setSecurity_answer(secAnswer);
			m.setFile_path(replacedStr);
			RegisterDAO r=new RegisterDAO();
			r.insertmember1(m);
			
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			
		}
		else
		{
			request.getRequestDispatcher("Registration.jsp").forward(request, response);
		}
	}

}
