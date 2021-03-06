package ru.novaris.novoscan.domain;

//import java.util.HashSet;
//import java.util.Set;

/**
 * SprvClients generated by hbm2java
 */
public class SprvClients implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private long spclId;

	private String spclName;

	private int spclType;

	private String spclDesc;

	private long spclSpdpId;
	
	private String spclSpdpName;
	
	private String spclTypeName;
	
	

	public SprvClients() {
	}

	public SprvClients(long spclId, SprvDeparts sprvDeparts, String spclName,
			int spclType, long spclSpdpId) {
		this.spclId = spclId;
		this.spclName = spclName;
		this.spclType = spclType;
		this.spclSpdpId = spclSpdpId;
	}


	public long getSpclId() {
		return this.spclId;
	}

	public void setSpclId(long spclId) {
		this.spclId = spclId;
	}

	public String getSpclName() {
		return this.spclName;
	}

	public void setSpclName(String spclName) {
		this.spclName = spclName;
	}

	public int getSpclType() {
		return this.spclType;
	}

	public void setSpclType(int spclType) {
		this.spclType = spclType;
	}

	public String getSpclDesc() {
		return this.spclDesc;
	}

	public void setSpclDesc(String spclDesc) {
		this.spclDesc = spclDesc;
	}

	public long getSpclSpdpId() {
		return this.spclSpdpId;
	}

	public void setSpclSpdpId(long spclSpdpId) {
		this.spclSpdpId = spclSpdpId;
	}
	
	public String getSpclSpdpName() {
		return this.spclSpdpName;
	}
	
	public void setSpclSpdpName(String spclSpdpName) {
		this.spclSpdpName = spclSpdpName;
	}

	public String getSpclTypeName() {
		return this.spclTypeName;
	}

	public void setSpclTypeName(String spclTypeName) {
		this.spclTypeName = spclTypeName;
	}

}
