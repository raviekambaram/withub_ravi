package withub;

import java.io.IOException;
import java.sql.Time;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EventCreationServlet
 */
//@WebServlet("/EventCreationServlet")
public class EventCreationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventCreationServlet() {
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
		String event_name = request.getParameter("eventname");
		String event_venue = request.getParameter("venue");
		String event_month = request.getParameter("EventMonth");
		String event_day = request.getParameter("EventDay");
		String event_year = request.getParameter("EventYear");
		
		String event_length = request.getParameter("eventlength");
		int eve_len = Integer.parseInt(event_length);
		
		String start_time = request.getParameter("starttime");
		Time st_time = Time.valueOf(start_time);

		String end_time = request.getParameter("endtime");
		Time nd_time = Time.valueOf(end_time);
		
		String description = request.getParameter("description");
		
		String paid = request.getParameter("paid");
		
		String event_fee = request.getParameter("fee");
		int eve_fee = Integer.parseInt(event_fee);
		
		String note = request.getParameter("note");

		

		doGet(request, response);
	}

}
