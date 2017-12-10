package withub;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchProfile
 */
//@WebServlet("/SearchProfile")
public class SearchProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchProfile() {
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
	
	
	public static int enterTable(String fname, String lname, String file_path) throws SQLException, ClassNotFoundException {
		
		Connection con = SearchProfile.getConnection();
		int memberID = 0;
		
		try{
				PreparedStatement insert_data = con.prepareStatement("INSERT INTO member (Fname, Lname, Profile_Pic) VALUES ('"+fname+"', '"+lname+"', '"+file_path+"')");
				insert_data.executeUpdate();
				System.out.println("Inserted Data successfully!");
				
				PreparedStatement get_data = con.prepareStatement("SELECT MID FROM member WHERE Fname='"+fname+"' AND Lname='"+lname+"'");
				ResultSet result = get_data.executeQuery();
				if(result.next())
					memberID = result.getInt("MID");
				
				return memberID;
		}
		catch(SQLException e) {
				System.out.println(e);
		}
		finally {
				System.out.println("Insert Completed!");
				con.close();
		}
		return 0;
	}
	
	public static ArrayList<ArrayList<String>> fetchProfile(String pattern) throws SQLException, ClassNotFoundException {
		
		Connection con = getConnection();
		ArrayList<ArrayList<String>> profileList = new ArrayList<ArrayList<String>>();
		ArrayList<String> nameList = new ArrayList<>();
		ArrayList<String> idList = new ArrayList<>();
		idList.add(null);
		nameList.add(null);
		int count = 0;
		
		try{
				PreparedStatement get_data = con.prepareStatement("SELECT MID, CONCAT(Fname, ' ' ,Lname) AS Member_Name FROM member WHERE Fname LIKE '%"+pattern+"%' OR Lname LIKE '%"+pattern+"%'");
				ResultSet result = get_data.executeQuery();
				while(result.next()) {
						idList.add(Integer.toString(result.getInt("MID")));
						nameList.add(result.getString("Member_Name"));
						++count;
				}
				nameList.set(0, Integer.toString(count));
				profileList.add(idList);
				profileList.add(nameList);
				System.out.println("Retrieved Data successfully!");
				
				return profileList;
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
		String pattern = request.getParameter("pattern");
//		String fname = "";
//		String lname = "";
		ArrayList<ArrayList<String>> profileList = new ArrayList<ArrayList<String>>();
		
//			SearchProfile.createTable();
//			SearchProfile.enterTable(fname, lname);
			profileList = SearchProfile.fetchProfile(pattern);
			
			request.setAttribute("profileList", profileList);
			request.getRequestDispatcher("/searchProfile.jsp").forward(request,response);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}


//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
