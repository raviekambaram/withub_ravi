package withub;

import java.io.IOException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EditServlet
 */
//@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
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
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String project_description = request.getParameter("project_description");
		String industry = request.getParameter("industry");
		String qualification = request.getParameter("qualification");
		String  expertise_areas = request.getParameter("expertise_areas");
		String  experience = request.getParameter("experience");
		String  salary_expected = request.getParameter("salary_expected");
		String  prefered_location = request.getParameter("prefered_location");

		HttpSession session	= request.getSession();
		
		if(request.getParameter("action").equals("save")){
			
		
		
		  member m= new member();
		
		  m.setMID((int)session.getAttribute("MID"));
		  m.setEmail(email);
		  m.setFname(fname);
		  m.setLname(lname);
		  m.setPhone(phone);
		  m.setAddress(address);
		  m.setPrefered_location(prefered_location);
		  m.setIndustry(industry);
		  m.setQualification(qualification);
		  m.setExpertise_areas(expertise_areas);
		  m.setExperience(experience);
		  m.setSalary_expected(salary_expected);

		  
		
		  String sql="update member set fname=?,lname=?,phone=?,address=?,project_description=?,industry=?,qualification=?,expertise_areas=?,experience=?,salary_expected=?,prefered_location=? where email=?";
		
		int i = daomember.updatemember1(m,sql);
		System.out.println("sam:"+i);
		
			if(i!=0){
			session.setAttribute("email", email);
			session.setAttribute("fname", fname);
			session.setAttribute("lname", lname);
			session.setAttribute("phone", phone);
			session.setAttribute("address", address);
			session.setAttribute("project_description", project_description);
			session.setAttribute("industry", industry);
			session.setAttribute("qualification", qualification);
			session.setAttribute("expertise_areas", expertise_areas);
			session.setAttribute("experience", experience);
			session.setAttribute("salary_expected", salary_expected);
			session.setAttribute("prefered_location", prefered_location);

			
			request.setAttribute("SuccessUP", "User Updated secessfully");
			getServletContext().getRequestDispatcher("/profile.jsp").forward(request, response);
			}
			else{
				System.out.println("No");
				request.setAttribute("SuccessUP", "User not Updated");
				getServletContext().getRequestDispatcher("/edit.jsp").forward(request, response);
			}
		
		
		}
		else{
			System.out.println("No");
			request.setAttribute("SuccessUP", "Password don't match");
			getServletContext().getRequestDispatcher("/edit.jsp").forward(request, response);
		}
	}

}
