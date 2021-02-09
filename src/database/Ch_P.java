package database;

public class Ch_P {
	
	private String ID;
	private String Name_dejurniy;
	private String Date;
	private String Shirota;
	private String Dolgota;
	private String Type_of_ch_p;
	private String Zh_d_objects;
	private String Hoz_objects;
	private int ID_vosst_poezd;
	private int ID_poezd;
	private boolean VP_naznachen;
	private boolean Vizov_prinyat;
	private String Nach_VP;
	
	
	public String getNach_VP() {
		return Nach_VP;
	}

	public void setNach_VP(String nach_VP) {
		Nach_VP = nach_VP;
	}

	public boolean isVizov_prinyat() {
		return Vizov_prinyat;
	}

	public void setVizov_prinyat(boolean vizov_prinyat) {
		Vizov_prinyat = vizov_prinyat;
	}

	public String getID() {
		return ID;
	}
	
	public void setID(String iD) {
		ID = iD;
	}
	
	public String getShirota() {
		return Shirota;
	}
	
	public void setShirota(String shirota) {
		Shirota = shirota;
	}
	
	public String getDolgota() {
		return Dolgota;
	}
	
	public void setDolgota(String dolgota) {
		Dolgota = dolgota;
	}
	
	public String getType_of_ch_p() {
		return Type_of_ch_p;
	}
	
	public void setType_of_ch_p(String type_of_ch_p) {
		Type_of_ch_p = type_of_ch_p;
	}

	public String getName_dejurniy() {
		return Name_dejurniy;
	}

	public void setName_dejurniy(String name_dejurniy) {
		Name_dejurniy = name_dejurniy;
	}

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	public String getZh_d_objects() {
		return Zh_d_objects;
	}

	public void setZh_d_objects(String zh_d_objects) {
		Zh_d_objects = zh_d_objects;
	}

	public String getHoz_objects() {
		return Hoz_objects;
	}

	public void setHoz_objects(String hoz_objects) {
		Hoz_objects = hoz_objects;
	}

	public int getID_vosst_poezd() {
		return ID_vosst_poezd;
	}

	public void setID_vosst_poezd(int iD_vosst_poezd) {
		ID_vosst_poezd = iD_vosst_poezd;
	}

	public int getID_poezd() {
		return ID_poezd;
	}

	public void setID_poezd(int iD_poezd) {
		ID_poezd = iD_poezd;
	}

	public boolean isVP_naznachen() {
		return VP_naznachen;
	}

	public void setVP_naznachen(boolean vP_naznachen) {
		VP_naznachen = vP_naznachen;
	}
	
}
