package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB_Connection {

	public static void main(String[] args) {
		DB_Connection obj_DB_Connection = new DB_Connection();
		
		System.out.println(obj_DB_Connection.get_connection());
	}
	
	public Connection get_connection() {
		Connection connection=null;
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/Vosst_poezdDB?serverTimezone=Europe/Moscow&useSSL=false&characterEncoding=UTF-8", "root", "root");
		} catch (Exception e) {
			System.out.println(e);
		}
		return connection;
	}

}
