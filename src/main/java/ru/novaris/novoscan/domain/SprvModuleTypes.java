package ru.novaris.novoscan.domain;

//import java.util.HashSet;
//import java.util.Set;

/**
 * SprvModuleTypes generated by hbm2java
 */
public class SprvModuleTypes implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private long spmtId;

	private String spmtName;

	private String spmtDesc;

//	private Set sprvModuleses = new HashSet(0);

	public SprvModuleTypes() {
	}

	public SprvModuleTypes(long spmtId, String spmtName, String spmtDesc) {
		this.spmtId = spmtId;
		this.spmtName = spmtName;
		this.spmtDesc = spmtDesc;
	}

/*	public SprvModuleTypes(long spmtId, String spmtName, String spmtDesc,
			Set sprvModuleses) {
		this.spmtId = spmtId;
		this.spmtName = spmtName;
		this.spmtDesc = spmtDesc;
		this.sprvModuleses = sprvModuleses;
	}*/

	public long getSpmtId() {
		return this.spmtId;
	}

	public void setSpmtId(long spmtId) {
		this.spmtId = spmtId;
	}

	public String getSpmtName() {
		return this.spmtName;
	}

	public void setSpmtName(String spmtName) {
		this.spmtName = spmtName;
	}

	public String getSpmtDesc() {
		return this.spmtDesc;
	}

	public void setSpmtDesc(String spmtDesc) {
		this.spmtDesc = spmtDesc;
	}

/*	public Set getSprvModuleses() {
		return this.sprvModuleses;
	}

	public void setSprvModuleses(Set sprvModuleses) {
		this.sprvModuleses = sprvModuleses;
	}*/

}
