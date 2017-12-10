package withub;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
 * Servlet implementation class MentorMenteeManager
 */
//@WebServlet("/MentorMenteeManager")
public class MentorMenteeManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public MentorMenteeManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
//				String sqlQuery = "CREATE TABLE IF NOT EXISTS withub.member(MID INT NOT NULL AUTO_INCREMENT, Fname varchar(255), Lname varchar(255), PRIMARY KEY(MID))";
//				PreparedStatement create = con.prepareStatement(sqlQuery);
				PreparedStatement create = con.prepareStatement("ALTER TABLE member ADD COLUMN Profile_Pic varchar(255)");
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
	
	public static String getRole(String memberID) throws SQLException, ClassNotFoundException {
		
		Connection con = getConnection();
		try{
				PreparedStatement get_data = con.prepareStatement("SELECT Role FROM mentor_mentee WHERE MID='"+memberID+"'");
				ResultSet result = get_data.executeQuery();
				if(result.next())
					return result.getString("Role");
		}
		catch(SQLException e) {
				System.out.println(e);
		}
		finally {
				System.out.println("Insert Completed!");
				con.close();
		}
		return null;
	}
public static boolean isMentorMentee(String memberID) throws SQLException, ClassNotFoundException {
		
		Connection con = getConnection();
		try{
				PreparedStatement get_data = con.prepareStatement("SELECT * FROM mentor_mentee WHERE MID='"+memberID+"'");
				ResultSet result = get_data.executeQuery();
				if(result.next())
					return true;
				else
					return false;
		}
		catch(SQLException e) {
				System.out.println(e);
		}
		finally {
				System.out.println("Insert Completed!");
				con.close();
		}
		return false;
	}
	
public static ArrayList<ArrayList<String>> fetchMenteeProfile(String memberID) throws SQLException, ClassNotFoundException {
		
		Connection con = MentorMenteeManager.getConnection();
		ArrayList<ArrayList<String>> menteeProfileList = new ArrayList<ArrayList<String>>();
		ArrayList<String> nameList = new ArrayList<>();
		ArrayList<String> idList = new ArrayList<>();
		ArrayList<String> imageList = new ArrayList<>();

		idList.add(null);
		nameList.add(null);
		imageList.add(null);
		int count = 0;
		
		try{
				PreparedStatement get_data = con.prepareStatement("SELECT MID, CONCAT(Fname, ' ' ,Lname) AS Member_Name, Profile_Pic FROM member WHERE MID IN (SELECT MID FROM chatdetails WHERE Recipient='"+memberID+"')");
				ResultSet result = get_data.executeQuery();
				while(result.next()) {
						idList.add(Integer.toString(result.getInt("MID")));
						nameList.add(result.getString("Member_Name"));
						imageList.add(result.getString("Profile_Pic"));
						++count;
				}
				nameList.set(0, Integer.toString(count));
				menteeProfileList.add(idList);
				menteeProfileList.add(nameList);
				menteeProfileList.add(imageList);
				System.out.println("Retrieved Data successfully!");
				
				return menteeProfileList;
		}
		catch(SQLException e) {
				System.out.println(e);
		}
		finally {
				System.out.println("Insert Completed!");
				con.close();
		}
		return null;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String memberID = request.getParameter("memberID");
		ArrayList<ArrayList<String>> menteeProfileList = new ArrayList<ArrayList<String>>();
		String role = "";
		HttpSession session = request.getSession();
		
		try {
			if(!isMentorMentee(memberID))
				response.sendRedirect("mm_choose.jsp");
			else {
				role = MentorMenteeManager.getRole(memberID);
				session.setAttribute("role", role);
					
				if (role.equals("mentor")) {					
						menteeProfileList = MentorMenteeManager.fetchMenteeProfile(memberID);
						session.setAttribute("menteeProfileList", menteeProfileList);					
						request.getRequestDispatcher("/mentorHome.jsp").forward(request,response);
				}
				else if (role.equals("mentee"))
						request.getRequestDispatcher("/menteeHome.jsp").forward(request,response);
			}
				
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
