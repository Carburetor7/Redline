package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class DBConnection {
	private static Connection conn;
	
	
	public static Connection provideConnection() {
		try {
			if(conn == null || conn.isClosed()) {
				ResourceBundle rb = ResourceBundle.getBundle("application");
				String connectionDatabase = rb.getString("db.connectionDatabase");
				String driverName = rb.getString("db.driverName");
				String username = rb.getString("db.username");
				String password = "";
				
				try {
					Class.forName(driverName);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				conn = DriverManager.getConnection(connectionDatabase, username, password);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	
	public static void closeConnection(Connection con) {
		 try { if (con != null && !con.isClosed()) {
			 con.close(); } 
		 } catch (SQLException e) {
				 e.printStackTrace(); 
			}
	}

	public static void closeConnection(ResultSet rs) {
		try {
			if (rs != null && !rs.isClosed()) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void closeConnection(PreparedStatement ps) {
		try {
			if (ps != null && !ps.isClosed()) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
