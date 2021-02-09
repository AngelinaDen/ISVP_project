package modal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Login_Bean;
import database.USER_Connection;

public class Login_Modal {
	public boolean check_user_name(Login_Bean Obj_Login_Bean) {
		
		boolean flag=false;
		
		USER_Connection obj_DB_Connection=new USER_Connection();
		Connection connection=obj_DB_Connection.get_connection();
		
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try{
			
			String qurey="select * from users where Login=? and Password=?";
			ps=connection.prepareStatement(qurey);
			ps.setString(1,  Obj_Login_Bean.getUser_name());
			ps.setString(2,  Obj_Login_Bean.getPassword());
			rs=ps.executeQuery();

			
			if(rs.next()) {
				flag=true;
				String role=rs.getString("Role");
				String FIO=rs.getString("FIO");
				System.out.println(role);
				Obj_Login_Bean.setRole(role);
				Obj_Login_Bean.setFIO(FIO);
			}
			
		} catch (Exception e) {
			
		}finally {
			try {
				if(connection!=null) {
					connection.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		
		return flag;
	}
}
