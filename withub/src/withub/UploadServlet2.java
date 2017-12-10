package withub;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadServlet2
 */
//@WebServlet("/UploadServlet2")
public class UploadServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private boolean isMultipart;
	private String filePath;
	private int maxFileSize = 5000 * 1024;
	private int maxMemSize = 5000 * 1024;
	private File file;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet2() {
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
		System.out.println("In Upload Servlet 2.");
		String event_name = request.getParameter("event_name");
		String event_fee = request.getParameter("event_fee");
		String event_description = request.getParameter("event_description");
		
		isMultipart = ServletFileUpload.isMultipartContent(request);
		response.setContentType("text/html");
		
		if (!isMultipart) {
			request.setAttribute("posterUploadMessage", "No poster uploaded.");
			request.getRequestDispatcher("/eventCreation.jsp").forward(request, response);
		}
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(maxMemSize);
		factory.setRepository(new File("C:\\temp"));
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(maxFileSize);
		
		try {
				List fileItems = upload.parseRequest(request);
				Iterator i = fileItems.iterator();
				
				while (i.hasNext()) {
					FileItem fi = (FileItem) i.next();
					
					if (!fi.isFormField()) {
						String fileName = fi.getName();
						String file_name = "";
						String file_path = "";
						filePath = request.getServletContext().getRealPath("/") + "eventPosters\\";
						System.out.println(filePath);
						
						if(fileName.lastIndexOf("\\") >= 0) {
							file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));
						}
						else {
							file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")+1));
						}
						fi.write(file);
						
						StringTokenizer st = new StringTokenizer(fileName, "\\");
						while (st.hasMoreElements()) {
							 file_name = st.nextElement().toString();
						}
							System.out.println(file_name);
							
						file_path = filePath + file_name;
						System.out.println(file_path);
							
						
						request.setAttribute("posterUploadMessage", "Event poster uploaded successfully.");
						request.setAttribute("poster_path", file_path);
						request.setAttribute("event_name", event_name);
						request.setAttribute("event_fee", event_fee);
						request.setAttribute("event_description", event_description);
						request.getRequestDispatcher("/eventCreation.jsp").forward(request, response);
					}
				}
		}
		catch(Exception ex) {
			request.setAttribute("posterUploadMessage", "Error uploading event poster. Please try again.");
			request.getRequestDispatcher("/eventCreation.jsp").forward(request, response);
			
			System.out.println(ex);
		}  
	}

}
