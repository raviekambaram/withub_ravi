package withub;

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
 * Servlet implementation class ProfileManager
 */
//@WebServlet("/ProfileManager")
public class ProfileManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String MID = request.getParameter("memberID");
		member m = new member();
		m.setMID(Integer.parseInt(MID));
		String sql="select * from member where MID=? ";
		HttpSession session	= request.getSession();	
		
		ResultSet rs = daomember.profiles(m,sql);
		
		try {
			if(rs.next()){
				session.setAttribute("MID1", rs.getInt(1));
				session.setAttribute("fname1", rs.getString(2));
				session.setAttribute("lname1", rs.getString(3));
				session.setAttribute("email1", rs.getString(4));
				session.setAttribute("password1", rs.getString(5));
				session.setAttribute("phone1", rs.getString(6));
				session.setAttribute("dob1", rs.getString(7));
				session.setAttribute("doj1", rs.getString(8));
				session.setAttribute("yop1", rs.getString(9));
				session.setAttribute("current_status1", rs.getString(10));
				session.setAttribute("college_name1", rs.getString(11));
				session.setAttribute("occupation1", rs.getString(12));
				session.setAttribute("company1", rs.getString(13));
				session.setAttribute("destination1", rs.getString(14));
				session.setAttribute("city1", rs.getString(15));
				session.setAttribute("security_question1", rs.getString(16));
				session.setAttribute("security_answer1", rs.getString(17));
				session.setAttribute("address1", rs.getString(18));
				session.setAttribute("project_description1", rs.getString(19));
				session.setAttribute("industry1", rs.getString(20));
				session.setAttribute("qualification1", rs.getString(21));
				session.setAttribute("expertise_areas1", rs.getString(22));
				session.setAttribute("experience1", rs.getString(23));
				session.setAttribute("salary_expected1", rs.getString(24));
				session.setAttribute("prefered_location1", rs.getString(25));
				session.setAttribute("gender1", rs.getString(26));
				session.setAttribute("File_Path1", rs.getString(27));
				
				getServletContext().getRequestDispatcher("/viewProfile.jsp").forward(request, response);
				
			}else{
				request.setAttribute("msgg", "Member data not found");
				getServletContext().getRequestDispatcher("/searchProfile.jsp").forward(request, response);
				
			}
		} catch (SQLException e) {

			System.out.println(e);
			e.printStackTrace();
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
