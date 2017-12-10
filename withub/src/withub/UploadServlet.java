package withub;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UploadServlet
 */
//@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		    String eventname = request.getParameter("ename");
	        String eventDesc = request.getParameter("desc");
	        String eventtype = request.getParameter("etype");
	         System.out.println(eventname);
	         System.out.println(eventDesc);
	         System.out.println(eventtype);
	        //InputStream inputStream = null; // input stream of the upload file
	         
	        // obtains the upload file part in this multipart request
	        //Part filePart = request.getPart("photo");
	        //if (filePart != null) {
	            // prints out some information for debugging
	          //  System.out.println(filePart.getName());
	            //System.out.println(filePart.getSize());
	            //System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	        //    inputStream = filePart.getInputStream();
	        //}
	         
	        Connection conn = null; // connection to the database
	        String message = null;  // message will be sent back to client
	         
	        try {
	            // connects to the database
	            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	            try {
					conn = DBCon.getConnection();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	 
	            // constructs SQL statement
	            String sql = "INSERT INTO events (event_name, event_desc, event_type) values (?, ?, ?)";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setString(1, eventname);
	            statement.setString(2, eventDesc);
	            statement.setString(3, eventtype);
	            
	             
	            
	            // sends the statement to the database server
	            int row = statement.executeUpdate();
	            if (row > 0) {
	                message = "File uploaded and saved into database";
	            }
	        } catch (SQLException ex) {
	            message = "ERROR: " + ex.getMessage();
	            ex.printStackTrace();
	        } finally {
	            if (conn != null) {
	                // closes the database connection
	                try {
	                    conn.close();
	                } catch (SQLException ex) {
	                    ex.printStackTrace();
	                }
	            }
	            // sets the message in request scope
	            request.setAttribute("Message", message);
	             
	            // forwards to the message page
	            getServletContext().getRequestDispatcher("/eventlist1.jsp").forward(request, response);
		
		// TODO Auto-generated method stub
	}

		
	}

}
