package ru.novaris.novoscan.domain;

import java.util.Date;
/*import java.util.HashSet;
import java.util.Set;
*/
/**
 * GisTypes generated by hbm2java
 */
public class GisTypes implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int gstpId;

	private String gstpCode;

	private String gstpName;

	private String gstpDesc;

	private Date gstpDt;

/*	private Set sprvCisInfos = new HashSet(0);

	private Set gisObjectses = new HashSet(0);*/

	public GisTypes() {
	}

	public GisTypes(int gstpId, String gstpCode, String gstpName, Date gstpDt) {
		this.gstpId = gstpId;
		this.gstpCode = gstpCode;
		this.gstpName = gstpName;
		this.gstpDt = gstpDt;
	}

/*	public GisTypes(int gstpId, String gstpCode, String gstpName,
			String gstpDesc, Date gstpDt, Set sprvCisInfos, Set gisObjectses) {
		this.gstpId = gstpId;
		this.gstpCode = gstpCode;
		this.gstpName = gstpName;
		this.gstpDesc = gstpDesc;
		this.gstpDt = gstpDt;
		this.sprvCisInfos = sprvCisInfos;
		this.gisObjectses = gisObjectses;
	}*/

	public int getGstpId() {
		return this.gstpId;
	}

	public void setGstpId(int gstpId) {
		this.gstpId = gstpId;
	}

	public String getGstpCode() {
		return this.gstpCode;
	}

	public void setGstpCode(String gstpCode) {
		this.gstpCode = gstpCode;
	}

	public String getGstpName() {
		return this.gstpName;
	}

	public void setGstpName(String gstpName) {
		this.gstpName = gstpName;
	}

	public String getGstpDesc() {
		return this.gstpDesc;
	}

	public void setGstpDesc(String gstpDesc) {
		this.gstpDesc = gstpDesc;
	}

	public Date getGstpDt() {
		return this.gstpDt;
	}

	public void setGstpDt(Date gstpDt) {
		this.gstpDt = gstpDt;
	}

/*	public Set getSprvCisInfos() {
		return this.sprvCisInfos;
	}

	public void setSprvCisInfos(Set sprvCisInfos) {
		this.sprvCisInfos = sprvCisInfos;
	}

	public Set getGisObjectses() {
		return this.gisObjectses;
	}

	public void setGisObjectses(Set gisObjectses) {
		this.gisObjectses = gisObjectses;
	}*/

}
