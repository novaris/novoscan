package ru.novaris.novoscan.domain;

//import java.util.HashSet;
//import java.util.Set;

/**
 * SprvDeparts generated by hbm2java
 */
public class SprvDeparts implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private long spdpId;

	private String spdpName;

//	private Set sprvClientses = new HashSet(0);

	public SprvDeparts() {
	}

	public SprvDeparts(long spdpId, String spdpName) {
		this.spdpId = spdpId;
		this.spdpName = spdpName;
	}

/*	public SprvDeparts(long spdpId, String spdpName, Set sprvClientses) {
		this.spdpId = spdpId;
		this.spdpName = spdpName;
		this.sprvClientses = sprvClientses;
	}*/

	public long getSpdpId() {
		return this.spdpId;
	}

	public void setSpdpId(long spdpId) {
		this.spdpId = spdpId;
	}

	public String getSpdpName() {
		return this.spdpName;
	}

	public void setSpdpName(String spdpName) {
		this.spdpName = spdpName;
	}

/*	public Set getSprvClientses() {
		return this.sprvClientses;
	}

	public void setSprvClientses(Set sprvClientses) {
		this.sprvClientses = sprvClientses;
	}*/

}