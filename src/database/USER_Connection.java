package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class USER_Connection {

	public static void main(String[] args) {
		USER_Connection obj_USER_Connection = new USER_Connection();
		
		System.out.println(obj_USER_Connection.get_connection());
	}
	
	public Connection get_connection() {
		Connection connection=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/users_ISVP?serverTimezone=Europe/Moscow&useSSL=false&characterEncoding=UTF-8", "root", "root");
		} catch (Exception e) {
			System.out.println(e);
		}
		return connection;
	}

}
