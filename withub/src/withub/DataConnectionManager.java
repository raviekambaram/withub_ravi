package withub;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataConnectionManager {

	public static final String URL = "jdbc:mysql://localhost/withub";
	public static final String USER = "root";
	public static final String PASSWORD = "root";
	//public static final String URL = "jdbc:mysql://withub.co22bzlmbxnt.us-west-2.rds.amazonaws.com/withubdb";
	//public static final String USER = "withubse";
	//public static final String PASSWORD = "withubse";
	
	public static final String DRIVER_CLASS = "com.mysql.jdbc.Driver";
	private static Connection c=null;
	
	public DataConnectionManager() {
		try {
			Class.forName(DRIVER_CLASS);
		} catch (ClassNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
			System.out.println("In driver-CLASS");
		}
	}
	
	public Connection getConnection() {
		try {
			c = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch(SQLException e) {
			System.out.println("couldn't connect to database");
			e.printStackTrace();
		}
		return c;
	}
	
	public void close() {
		if(c!=null) {
			try {
				c.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
