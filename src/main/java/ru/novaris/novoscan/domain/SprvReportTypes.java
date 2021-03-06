package ru.novaris.novoscan.domain;

//import java.util.HashSet;
//import java.util.Set;

/**
 * SprvObjectTypes generated by hbm2java
 */
public class SprvReportTypes implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private long sprtId;

	private String sprtName;

	private String sprtDesc;

//	private Set sprvObjectses = new HashSet(0);

	public SprvReportTypes() {
	}

	public SprvReportTypes(long sprtId, String sprtName, String sprtDesc) {
		this.setSprtId(sprtId);
		this.setSprtName(sprtName);
		this.setSprtDesc(sprtDesc);
	}

	public long getSprtId() {
		return sprtId;
	}

	public void setSprtId(long sprtId) {
		this.sprtId = sprtId;
	}

	public String getSprtName() {
		return sprtName;
	}

	public void setSprtName(String sprtName) {
		this.sprtName = sprtName;
	}

	public String getSprtDesc() {
		return sprtDesc;
	}

	public void setSprtDesc(String sprtDesc) {
		this.sprtDesc = sprtDesc;
	}



}
