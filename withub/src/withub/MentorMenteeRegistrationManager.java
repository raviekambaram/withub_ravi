package withub;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MentorMenteeRegistrationManager
 */
//@WebServlet("/MentorMenteeRegistrationManager")
public class MentorMenteeRegistrationManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MentorMenteeRegistrationManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	public static Connection getConnection() throws SQLException, ClassNotFoundException {   
		
		try {
				String driver = "com.mysql.jdbc.Driver";
				String url = "jdbc:mysql://localhost/withub";
				String user = "root";
				String password = "root";
				Class.forName(driver);
				
				Connection conn = DriverManager.getConnection(url, user, password);
				System.out.println("Connected!");
				return conn;
			}
			catch (SQLException e) {
				System.out.println(e);
			}
			catch (ClassNotFoundException e) {
				System.out.println(e);
			}
			
			return null;
	}
	
	public static void createTable() throws SQLException, ClassNotFoundException {

		Connection con = getConnection();

		try {
				String sqlQuery = "CREATE TABLE IF NOT EXISTS mentor_mentee(MM_ID INT NOT NULL AUTO_INCREMENT, MID INT, Role varchar(255), Specialization varchar(255), PRIMARY KEY(MM_ID))";
				PreparedStatement create = con.prepareStatement(sqlQuery);
				create.executeUpdate();
		}
		catch(SQLException e) {
				System.out.println(e);
		}
		finally {
				System.out.println("Table created!");
				con.close();
		};
	}
	
	
	public static void enterTable(int memberID, String role, String specialization) throws SQLException, ClassNotFoundException {
		
		Connection con = getConnection();
		
		try{
				PreparedStatement insert_data = con.prepareStatement("INSERT INTO mentor_mentee (MID, Role, Specialization) VALUES ("+memberID+", '"+role+"', '"+specialization+"')");
				insert_data.executeUpdate();
				System.out.println("Inserted Data successfully!");
			}
		catch(SQLException e) {
				System.out.println(e);
		}
		finally {
				System.out.println("Insert Completed!");
				con.close();
		}
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int memberID = Integer.parseInt(request.getParameter("memberID"));
		String specialization = request.getParameter("specialization");
		HttpSession session = request.getSession();
		String role = "";
		System.out.println(request.getParameter("mentorRegistration"));
		
		if ((request.getParameter("mentorRegistration")) == null)
			role = "mentee";
		else if ((request.getParameter("mentorRegistration")).equals("Register"))
			role = "mentor";
		
		try {
			MentorMenteeRegistrationManager.createTable();
			MentorMenteeRegistrationManager.enterTable(memberID, role, specialization);
			
			session.setAttribute("role", role);
			
			if (role.equals("mentor"))
				response.sendRedirect("mentorHome.jsp");
			else if (role.equals("mentee"))
				response.sendRedirect("menteeHome.jsp");

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
