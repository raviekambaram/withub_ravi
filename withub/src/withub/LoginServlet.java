package withub;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("emailid");
		String pass = request.getParameter("pass");
		
		
		
		if(email.equals(null)||email.equals("")||pass.equals(null)||pass.equals("")){
			request.setAttribute("msgg", "All Fields are mandatory");
			getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
		}else
		{
			
			System.out.println("Values retrieved Email = " + email + "pass = " + pass);
			//2.set all values in Model class' object
			member m = new member();
			
			m.setEmail(email);
			m.setPassword(pass);
		
			String sql="select * from member where email=? and password=? ";
			
			
			
			//3. call a method in Dao to select data form table
			//also set a session
			HttpSession session	= request.getSession();	
			ResultSet rs = daomember.LoginUser(m,sql);
			
			//set session attributes from the database result set 
			try {
				if(rs.next()){
					session.setAttribute("MID", rs.getInt(1));
					session.setAttribute("fname", rs.getString(2));
					session.setAttribute("lname", rs.getString(3));
					session.setAttribute("email", rs.getString(4));
					session.setAttribute("password", rs.getString(5));
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
					session.setAttribute("security_question", rs.getString(16));
					session.setAttribute("security_answer", rs.getString(17));
					session.setAttribute("address", rs.getString(18));
					session.setAttribute("project_description", rs.getString(19));
					session.setAttribute("industry", rs.getString(20));
					session.setAttribute("qualification", rs.getString(21));
					session.setAttribute("expertise_areas", rs.getString(22));
					session.setAttribute("experience", rs.getString(23));
					session.setAttribute("salary_expected", rs.getString(24));
					session.setAttribute("prefered_location", rs.getString(25));
					session.setAttribute("gender", rs.getString(26));
					session.setAttribute("File_Path", rs.getString(27));
					
					//pass session attribute to searchdoctor.jsp
					//use any attributes search page may need
					getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
					//searchdoctor.jsp should have one more navigator (href)for patient to 'update info' and it can link to UpdatePtient.jsp
					//I have sent the my modified searchdoctor.jsp as a reference 
					
					//*request.getRequestDispatcher("/searchdoctor.jsp").forward(request, response);
				}else{
					request.setAttribute("msgg", "E-mail/Password do not match");
					getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
					
				}
			} catch (SQLException e) {
	
				System.out.println(e);
				e.printStackTrace();
			}
		}
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
