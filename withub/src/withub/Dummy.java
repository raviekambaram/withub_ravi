package withub;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Dummy
 */
//@WebServlet("/Dummy")
public class Dummy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dummy() {
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
	
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		Connection con = Dummy.getConnection();
		PreparedStatement delete_data = con.prepareStatement("DELETE FROM events WHERE event_name='ram'");
		
			delete_data.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Deleted Data successfully!");
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
