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

import org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EventManager
 */
//@WebServlet("/EventManager")
public class EventManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventManager() {
        super();
        // TODO Auto-generated constructor stub
    }
	public static Connection getConnection() throws SQLException, ClassNotFoundException {   
		
		try {
				String driver = "com.mysql.jdbc.Driver";
				String url = "jdbc:mysql://localhost:3306/withub";
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
	
	
	
	public static ArrayList<String> getEventDetails(String eventID) throws SQLException, ClassNotFoundException {
		
		Connection con = EventManager.getConnection();
		ArrayList<String> eventDetails = new ArrayList<String>();
		eventDetails.add(null);
		
		try{
				PreparedStatement get_data = con.prepareStatement("SELECT * FROM events WHERE event_name='"+eventID+"'");
				ResultSet result = get_data.executeQuery();
				if(result.next()) {
						
						eventDetails.add(result.getString("event_name"));
						eventDetails.add(result.getString("event_type"));
						eventDetails.add(result.getString("event_desc"));
						eventDetails.add(result.getString("event_poster"));
				}

				System.out.println("Retrieved particular Event Details successfully!");
				
				return eventDetails;
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

	
	public static ArrayList<ArrayList<String>> fetchEvents(String pattern) throws SQLException, ClassNotFoundException {
		
		Connection con = ChatManager.getConnection();
		ArrayList<ArrayList<String>> searchEventsList = new ArrayList<ArrayList<String>>();
		ArrayList<String> idList = new ArrayList<>();
		ArrayList<String> nameList = new ArrayList<>();
		ArrayList<String> descList = new ArrayList<>();
		ArrayList<String> posterList = new ArrayList<>();
		ArrayList<String> typeList = new ArrayList<>();
		idList.add(null);
		nameList.add(null);
		descList.add(null);
		posterList.add(null);
		typeList.add(null);
		int count = 0;
		System.out.println(pattern);
		
		try{
				PreparedStatement get_data = con.prepareStatement("SELECT * FROM events WHERE event_name LIKE '%"+pattern+"%' OR event_desc LIKE '%"+pattern+"%'");
				ResultSet result = get_data.executeQuery();
				while(result.next()) {
						
						nameList.add(result.getString("event_name"));
						descList.add(result.getString("event_desc"));
						posterList.add(result.getString("event_poster"));
						typeList.add(result.getString("event_type"));						
						++count;
				}
				nameList.set(0, Integer.toString(count));
				
				searchEventsList.add(nameList);
				searchEventsList.add(descList);
				searchEventsList.add(posterList);
				searchEventsList.add(typeList);
				System.out.println(count);
				System.out.println("Retrieved search Data successfully!");
				
				return searchEventsList;
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

	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ArrayList<String> eventDetails = new ArrayList<String>();
		ArrayList<ArrayList<String>> searchEventsList = new ArrayList<ArrayList<String>>();

		String purpose = request.getParameter("purpose");
		System.out.println(purpose);
		

		try {
			if (purpose == null) {
			
				String name = request.getParameter("event_name");
				System.out.println(name);

				eventDetails = getEventDetails(name);
				
				request.setAttribute("eventDetails", eventDetails);
				request.getRequestDispatcher("/eventdetailsh.jsp").forward(request, response);
			}
			
			else if (purpose.equals("searchEvent")) {
				String search_event = request.getParameter("search_event");
				
				searchEventsList = EventManager.fetchEvents(search_event);
				
				if (searchEventsList.get(0).get(0).equals("0")) {
					request.setAttribute("searchEvents_message", "No results found.");
					request.getRequestDispatcher("/eventlist11.jsp").forward(request,response);
				}
				else {				
					request.setAttribute("searchEventsList", searchEventsList);
					request.getRequestDispatcher("/eventlist11.jsp").forward(request,response);
				}
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
