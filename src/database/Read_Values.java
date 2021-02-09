package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Read_Values {
	public List<Ch_P> get_values() {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection=obj_DB_Connection.get_connection();
		
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<Ch_P> list=new ArrayList<Ch_P>();
		
		try {
			String querry="select * from Ch_P";
			ps=connection.prepareStatement(querry);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				if(rs.getBoolean("VP_naznachen")==false) {
					Ch_P obj_Ch_P=new Ch_P();
					System.out.println(rs.getString("ID"));
					System.out.println(rs.getString("Shirota"));
					System.out.println(rs.getString("Dolgota"));
					System.out.println(rs.getString("Type_of_ch_p"));
					
					obj_Ch_P.setID(rs.getString("ID"));
					obj_Ch_P.setShirota(rs.getString("Shirota"));
					obj_Ch_P.setDolgota(rs.getString("Dolgota"));
					obj_Ch_P.setType_of_ch_p(rs.getString("Type_of_ch_p"));
					obj_Ch_P.setID_poezd(rs.getInt("ID_poezd"));

					list.add(obj_Ch_P);
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public List<Ch_P> get_1_Ch_P(String ID) {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection=obj_DB_Connection.get_connection();
		
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<Ch_P> list=new ArrayList<Ch_P>();
		
		try {
			String querry="SELECT Ch_P.ID, Ch_P.Name_dejurniy, Ch_P.Date, Ch_P.Shirota, Ch_P.Dolgota, Ch_P.Type_of_ch_p,\r\n"
					+ "Zh_d_objects.Name_zh_d, hoz_objects.Name_hoz, Ch_P.ID_poezd FROM Ch_P\r\n"
					+ "LEFT JOIN objects ON Ch_P.ID_objects = objects.ID\r\n"
					+ "LEFT JOIN Zh_d_objects ON objects.ID_zh_d_object = Zh_d_objects.ID\r\n"
					+ "LEFT JOIN hoz_objects ON objects.ID_hoz_object=Hoz_objects.ID\r\n"
					+ "WHERE Ch_P.ID=?;";
			ps=connection.prepareStatement(querry);
			ps.setString(1, ID);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				Ch_P obj_Ch_P=new Ch_P();
				System.out.println(rs.getString("ID"));
				System.out.println(rs.getString("Name_dejurniy"));
				System.out.println(rs.getDate("Date"));
				System.out.println(rs.getString("Shirota"));
				System.out.println(rs.getString("Dolgota"));
				System.out.println(rs.getString("Type_of_ch_p"));
				// System.out.println(rs.getInt("ID_objects"));
				System.out.println(rs.getInt("ID_poezd"));
				System.out.println(rs.getString("Name_zh_d"));
				System.out.println(rs.getString("Name_hoz"));
				
				obj_Ch_P.setID(rs.getString("ID"));
				obj_Ch_P.setName_dejurniy(rs.getString("Name_dejurniy"));
				obj_Ch_P.setDate(rs.getString("Date"));
				obj_Ch_P.setShirota(rs.getString("Shirota"));
				obj_Ch_P.setDolgota(rs.getString("Dolgota"));
				obj_Ch_P.setType_of_ch_p(rs.getString("Type_of_ch_p"));
				obj_Ch_P.setHoz_objects(rs.getString("Name_zh_d"));
				obj_Ch_P.setZh_d_objects(rs.getString("Name_hoz"));
				obj_Ch_P.setID_poezd(rs.getInt("ID_poezd"));
				
				list.add(obj_Ch_P);
				
			}
		} catch (Exception e) {
			System.out.println(e);
		} 
		
		return list;
	}
	
	public List<Poezd> get_poezd(String ID_poezd) {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection=obj_DB_Connection.get_connection();
		
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<Poezd> list=new ArrayList<Poezd>();
		
		try {
			String querry="SELECT poezd.ID, poezd.Tab_number_mashinist, poezd.Mashinist, type_poezd.Name_type,\r\n"
					+ "type_vagon.Name_vagon, poezd.Kolichestvo_vagonov, gruz.Name_gruz FROM poezd\r\n"
					+ "LEFT JOIN type_poezd ON poezd.ID_type_poezd = type_poezd.ID\r\n"
					+ "LEFT JOIN vagon ON poezd.ID_vagon = vagon.ID\r\n"
					+ "LEFT JOIN type_vagon ON vagon.ID_type_vagon = type_vagon.ID\r\n"
					+ "LEFT JOIN gruz ON poezd.ID_gruza = gruz.ID\r\n"
					+ "WHERE poezd.ID=?;";
			ps=connection.prepareStatement(querry);
			ps.setString(1, ID_poezd);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				Poezd obj_Poezd=new Poezd();
				System.out.println(rs.getString("ID"));
				System.out.println(rs.getString("Tab_number_mashinist"));
				System.out.println(rs.getString("Mashinist"));
				System.out.println(rs.getString("Name_type"));
				System.out.println(rs.getString("Name_vagon"));
				System.out.println(rs.getInt("Kolichestvo_vagonov"));
				System.out.println(rs.getString("Name_gruz"));
				
				obj_Poezd.setID(rs.getString("ID"));
				obj_Poezd.setTab_num(rs.getString("Tab_number_mashinist"));
				obj_Poezd.setMashinist(rs.getString("Mashinist"));
				obj_Poezd.setType_poezd(rs.getString("Name_type"));
				obj_Poezd.setVagon(rs.getString("Name_vagon"));
				obj_Poezd.setKolichestvo_vagonov(rs.getInt("Kolichestvo_vagonov"));
				obj_Poezd.setGruz(rs.getString("Name_gruz"));
				
				list.add(obj_Poezd);
				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return list;
	}
	
	public List<Vosst_Poezd> get_vosst_poezda() {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection=obj_DB_Connection.get_connection();
		
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<Vosst_Poezd> list=new ArrayList<Vosst_Poezd>();
		
		try {
			String querry="SELECT vosst_poezd.ID, vosst_poezd.Number_poezd, \r\n"
					+ "vosst_poezd.Name_nachalnik_poezda, type_vosst_poezd.Name FROM vosst_poezd\r\n"
					+ "LEFT JOIN type_vosst_poezd ON vosst_poezd.ID_type_poezd=type_vosst_poezd.ID;";
			ps=connection.prepareStatement(querry);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				Vosst_Poezd obj_Vosst_Poezd=new Vosst_Poezd();
				System.out.println(rs.getString("ID"));
				System.out.println(rs.getString("Number_poezd"));
				System.out.println(rs.getString("Name_nachalnik_poezda"));
				System.out.println(rs.getString("Name"));
				
				obj_Vosst_Poezd.setID(rs.getString("ID"));
				obj_Vosst_Poezd.setNumber_poezd(rs.getString("Number_poezd"));
				obj_Vosst_Poezd.setName_nachalnik_poezda(rs.getString("Name_nachalnik_poezda"));
				obj_Vosst_Poezd.setType_poezd(rs.getString("Name"));
				
				list.add(obj_Vosst_Poezd);
				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public List<Ch_P> get_unanswered_values(String FIO) {
		DB_Connection obj_DB_Connection = new DB_Connection();
		Connection connection=obj_DB_Connection.get_connection();
		
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<Ch_P> list=new ArrayList<Ch_P>();
		
		try {
			String querry="SELECT Ch_P.ID, Ch_P.Shirota, Ch_P.Dolgota, Ch_P.Type_of_ch_p, Ch_P.Vizov_prinyat, \r\n"
					+ "Ch_P.ID_poezd, vosst_poezd.Name_nachalnik_poezda FROM Ch_P\r\n"
					+ "LEFT JOIN vosst_poezd ON Ch_P.ID_vosst_poezd=vosst_poezd.ID;";
			ps=connection.prepareStatement(querry);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				if(rs.getBoolean("Vizov_prinyat")==false && rs.getString("Name_nachalnik_poezda").equals(FIO)) {
					Ch_P obj_Ch_P=new Ch_P();
					System.out.println(rs.getString("ID"));
					System.out.println(rs.getString("Shirota"));
					System.out.println(rs.getString("Dolgota"));
					System.out.println(rs.getString("Type_of_ch_p"));
					
					obj_Ch_P.setID(rs.getString("ID"));
					obj_Ch_P.setShirota(rs.getString("Shirota"));
					obj_Ch_P.setDolgota(rs.getString("Dolgota"));
					obj_Ch_P.setType_of_ch_p(rs.getString("Type_of_ch_p"));
					obj_Ch_P.setNach_VP(rs.getString("Name_nachalnik_poezda"));
					obj_Ch_P.setID_poezd(rs.getInt("ID_poezd"));

					list.add(obj_Ch_P);
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
}
