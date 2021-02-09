package bean;

public class Login_Bean {
	private String user_name;
	private String password;
	private String role;
	private String FIO;
	
	public String getFIO() {
		return FIO;
	}
	public void setFIO(String fIO) {
		FIO = fIO;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
}
