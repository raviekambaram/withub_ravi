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
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChatManager
 */
//@WebServlet("/ChatManager")
public class ChatManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatManager() {
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
//				String sqlQuery = "CREATE TABLE IF NOT EXISTS withub.chatdetails(Chat_ID INT NOT NULL AUTO_INCREMENT, Role varchar(20), Comment_Box varchar(255), PRIMARY KEY(Chat_ID))";
//				PreparedStatement create = con.prepareStatement(sqlQuery);
//				PreparedStatement create = con.prepareStatement("ALTER TABLE withub.chatdetails ADD COLUMN Current_Date_Time datetime");
//				PreparedStatement create = con.prepareStatement("ALTER TABLE withub.chatdetails DROP COLUMN Current_Date_Time");
//				PreparedStatement create = con.prepareStatement("ALTER TABLE withub.chatdetails ADD COLUMN Current_Date_Time varchar(100)");
//				PreparedStatement create = con.prepareStatement("ALTER TABLE withub.chatdetails ADD COLUMN MID INT");
				PreparedStatement create = con.prepareStatement("ALTER TABLE withub.chatdetails ADD COLUMN Recipient INT");
			
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
	
	
	public static void enterTable(String role, String commentBox, String from, String to) throws SQLException, ClassNotFoundException {
		
		Connection con = getConnection();
		Format formatter = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
		String current_date_time = formatter.format(new java.util.Date());
		int fromid = Integer.parseInt(from);
		int toid = Integer.parseInt(to);
		
		try{
				PreparedStatement insert_data = con.prepareStatement("INSERT INTO chatdetails (Role, Comment_Box, Current_Date_Time, MID, Recipient) VALUES ('"+role+"', '"+commentBox+"', '"+current_date_time+"', "+fromid+", "+toid+")");
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
	
	public static ArrayList<ArrayList<String>> displayChat(String mentorID, String menteeID) throws SQLException, ClassNotFoundException {
		
		Connection con = ChatManager.getConnection();
		ArrayList<String> chatList = new ArrayList<>(), timeList = new ArrayList<>(), nameList = new ArrayList<>(), imageList = new ArrayList<>(), idList = new ArrayList<>();
		ArrayList<ArrayList<String>> conversation = new ArrayList<ArrayList<String>>();
		nameList.add(null);
		idList.add(null);
		imageList.add(null);
		chatList.add(null);
		timeList.add(null);
		int count = 0;
		
		try{
			PreparedStatement get_data = con.prepareStatement("SELECT member.MID, CONCAT(member.Fname, ' ' ,member.Lname) AS Member_Name, member.Profile_Pic, chatdetails.Current_Date_Time, chatdetails.Comment_Box FROM member INNER JOIN chatdetails ON member.MID=chatdetails.MID AND ((chatdetails.MID='"+mentorID+"' AND chatdetails.Recipient='"+menteeID+"') OR (chatdetails.MID='"+menteeID+"' AND chatdetails.Recipient='"+mentorID+"'))");
			ResultSet result = get_data.executeQuery();
			while(result.next()) {
					idList.add(Integer.toString(result.getInt("MID")));
					nameList.add(result.getString("Member_Name"));
					imageList.add(result.getString("Profile_Pic"));
					chatList.add(result.getString("Comment_Box"));
					timeList.add(result.getString("Current_Date_Time"));
					++count;
			}
			nameList.set(0, Integer.toString(count));
			conversation.add(idList);
			conversation.add(timeList);
			conversation.add(imageList);
			conversation.add(nameList);
			conversation.add(chatList);
			
			System.out.println("Retrieved Data successfully!");
			return conversation;
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
//			ChatManager.createTable();
		String role = request.getParameter("role");
		System.out.println(role);
		String commentBox = request.getParameter("commentBox");
		String send_message = request.getParameter("send_message");
		System.out.println(send_message);
		String mentorID = request.getParameter("mentorID");
		String menteeID = request.getParameter("menteeID");
		String recipient = request.getParameter("recipient");
		
		ArrayList<ArrayList<String>> conversation = new ArrayList<ArrayList<String>>();
		HttpSession session = request.getSession();
		
		if (send_message == null) {
			conversation = ChatManager.displayChat(mentorID, menteeID);
		}
		else if (send_message.equals("Send")) {
			if (role.equals("mentor"))
					ChatManager.enterTable(role, commentBox, mentorID, menteeID);
			else if (role.equals("mentee"))
					ChatManager.enterTable(role, commentBox, menteeID, mentorID);
			
			conversation = ChatManager.displayChat(mentorID, menteeID);
		}
		
			session.setAttribute("conversation", conversation);
			request.setAttribute("mentorID", mentorID);
			request.setAttribute("menteeID", menteeID);
			request.setAttribute("recipient", recipient);
			request.setAttribute("role", role);
			request.getRequestDispatcher("/chatSystem.jsp").forward(request,response);
			
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
		try {
//			ChatManager.createTable();
		String role = request.getParameter("role");
		System.out.println(role);
		String commentBox = request.getParameter("commentBox");
		String send_message = request.getParameter("send_message");
		System.out.println(send_message);
		String mentorID = request.getParameter("mentorID");
		String menteeID = request.getParameter("menteeID");
		String recipient = request.getParameter("recipient");
		String refresh = request.getParameter("refresh");
		
		ArrayList<ArrayList<String>> conversation = new ArrayList<ArrayList<String>>();
		HttpSession session = request.getSession();
		
		if (send_message == null) {
			conversation = ChatManager.displayChat(mentorID, menteeID);
		}
		else if (send_message.equals("Send")) {
			if (role.equals("mentor"))
					ChatManager.enterTable(role, commentBox, mentorID, menteeID);
			else if (role.equals("mentee"))
					ChatManager.enterTable(role, commentBox, menteeID, mentorID);
			
			conversation = ChatManager.displayChat(mentorID, menteeID);
		}
		
			session.setAttribute("conversation", conversation);
			session.setAttribute("mentorID", mentorID);
			session.setAttribute("menteeID", menteeID);
			session.setAttribute("recipient", recipient);
			session.setAttribute("role", role);
//			request.getRequestDispatcher("/chatSystem.jsp").forward(request,response);
			if(refresh.equals("http://localhost:8082/withub/chatSystem.jsp"))
					response.sendRedirect("chatSystemd.jsp");
			else if(refresh.equals("http://localhost:8082/withub/chatSystemd.jsp"))
				response.sendRedirect("chatSystem.jsp");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}


//		doGet(request, response);
	}

}
