package database;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;

public class JavaDatabase {
	
	public static Connection getConnection(){
		Connection con = null;
		String user = "root";
		String password = "Root@7668";
		String url = "jdbc:mysql://localhost:3306/healthdatabase";
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con =  (Connection) DriverManager.getConnection(url, user, password);
			
		}catch(Exception e) {
			
			System.out.println(e);
		
		}
		
		return con;
		
	}
	
	
	
	public static void saveDetails() {
	
		String query = "insert into userlogindetails values()";
	
	}
	
}
