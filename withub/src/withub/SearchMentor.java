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
 * Servlet implementation class SearchMentor
 */
//@WebServlet("/SearchMentor")
public class SearchMentor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMentor() {
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
		
	public static ArrayList<ArrayList<String>> fetchMentorProfile(String specialization) throws SQLException, ClassNotFoundException {
		
		Connection con = SearchMentor.getConnection();
		ArrayList<ArrayList<String>> mentorProfileList = new ArrayList<ArrayList<String>>();
		ArrayList<String> nameList = new ArrayList<>();
		ArrayList<String> idList = new ArrayList<>();
		ArrayList<String> imageList = new ArrayList<>();
		ArrayList<String> specializationList = new ArrayList<>();

		idList.add(null);
		nameList.add(null);
		imageList.add(null);
		specializationList.add(null);
		int count = 0;
		
		try{
				PreparedStatement get_data = con.prepareStatement("SELECT member.MID, CONCAT(member.Fname, ' ' ,member.Lname) AS Member_Name, member.Profile_Pic, mentor_mentee.Specialization FROM member INNER JOIN withub.mentor_mentee ON member.MID=mentor_mentee.MID AND mentor_mentee.Role='mentor' AND mentor_mentee.Specialization LIKE '%"+specialization+"%'");
				ResultSet result = get_data.executeQuery();
				while(result.next()) {
						idList.add(Integer.toString(result.getInt("MID")));
						nameList.add(result.getString("Member_Name"));
						imageList.add(result.getString("Profile_Pic"));
						specializationList.add(result.getString("Specialization"));
						++count;
				}
				nameList.set(0, Integer.toString(count));
				mentorProfileList.add(idList);
				mentorProfileList.add(nameList);
				mentorProfileList.add(imageList);
				mentorProfileList.add(specializationList);
				System.out.println("Retrieved Data successfully!");
				
				return mentorProfileList;
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
		
		try {
		String specialization = request.getParameter("specialization");
		HttpSession session = request.getSession();
		ArrayList<ArrayList<String>> mentorProfileList = new ArrayList<ArrayList<String>>();
		
		mentorProfileList = SearchMentor.fetchMentorProfile(specialization);
			
			session.setAttribute("mentorProfileList", mentorProfileList);
			request.getRequestDispatcher("/menteeHome.jsp").forward(request, response);	
			
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
