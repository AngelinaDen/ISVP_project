package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

public class Insert_Values {

	public void insert_values(String ID_poezd, String Shirota, String Dolgota, String Type_of_ch_p, String Name_dejurniy, Timestamp date, int ID_objects) {
		DB_Connection obj_DB_Connection=new DB_Connection();
		Connection connection=obj_DB_Connection.get_connection();
		
		PreparedStatement ps=null;
		
		try {
		String query="insert into Ch_P(Name_Dejurniy, date, Shirota, Dolgota, Type_of_ch_p, ID_poezd, ID_objects) values(?,?,?,?,?,?,?)";
		ps=connection.prepareStatement(query);
		
		ps.setString(1, Name_dejurniy);
		ps.setTimestamp(2, date);
		ps.setString(3, Shirota);
		ps.setString(4, Dolgota);
		ps.setString(5, Type_of_ch_p);
		ps.setString(6, ID_poezd);
		ps.setInt(7, ID_objects);
		
		ps.executeUpdate();
		
		
		} catch (Exception e) {
			System.err.println(e);
		}
	}
	
	public void insert_VP_into_Ch_P(String ID, String ID_vosst_poezd) {
		DB_Connection obj_DB_Connection=new DB_Connection();
		Connection connection=obj_DB_Connection.get_connection();
		
		PreparedStatement ps=null;
		
		try {
		String query="update Ch_P SET ID_vosst_poezd=?, VP_naznachen=?  WHERE ID=?";
		ps=connection.prepareStatement(query);
		
		ps.setString(1, ID_vosst_poezd);
		ps.setInt(2, 1);
		ps.setString(3, ID);
		
		
		ps.executeUpdate();
		
		
		} catch (Exception e) {
			System.err.println(e);
		}
	}
	
	public void insert_vizov_prinyat(String ID) {
		DB_Connection obj_DB_Connection=new DB_Connection();
		Connection connection=obj_DB_Connection.get_connection();
		
		PreparedStatement ps=null;
		
		try {
		String query="update Ch_P SET Vizov_prinyat=? WHERE ID=?";
		// String query="insert into Ch_P(ID_vosst_poezd) values(?)";
		ps=connection.prepareStatement(query);
		
		ps.setInt(1, 1);
		ps.setString(2, ID);
		
		
		ps.executeUpdate();
		
		
		} catch (Exception e) {
			System.err.println(e);
		}
	}
}
