package withub;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBCon {
public static void main(String[] args) throws Exception {
		
		getConnection();
		
	}
		public static Connection getConnection() throws Exception{
			try{
			String driver = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/withub?autoReconnect=true&useSSL=false";
			String username = "root";
			String password = "root";
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url,username,password);
			System.out.println("Connected");
			return conn;
			}
			catch(Exception e){System.out.println(e);} return null;
			}

}
