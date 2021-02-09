package database;

public class Poezd {
	private String ID;
	private String Tab_num;
	private String Mashinist;
	private String type_poezd;
	private String vagon;
	private int Kolichestvo_vagonov;
	private String gruz;
	
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getTab_num() {
		return Tab_num;
	}
	public void setTab_num(String tab_num) {
		Tab_num = tab_num;
	}
	public String getMashinist() {
		return Mashinist;
	}
	public void setMashinist(String mashinist) {
		Mashinist = mashinist;
	}
	public int getKolichestvo_vagonov() {
		return Kolichestvo_vagonov;
	}
	public void setKolichestvo_vagonov(int kolichestvo_vagonov) {
		Kolichestvo_vagonov = kolichestvo_vagonov;
	}
	public String getType_poezd() {
		return type_poezd;
	}
	public void setType_poezd(String type_poezd) {
		this.type_poezd = type_poezd;
	}
	public String getGruz() {
		return gruz;
	}
	public void setGruz(String gruz) {
		this.gruz = gruz;
	}
	public String getVagon() {
		return vagon;
	}
	public void setVagon(String vagon) {
		this.vagon = vagon;
	}
	
}
