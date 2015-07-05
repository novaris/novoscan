package ru.novaris.novoscan.domain;

import java.util.Date;
/*import java.util.HashSet;
import java.util.Set;*/

/**
 * GisObjects generated by hbm2java
 */
public class GisObjects implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int gsobId;

	private GisTypes gisTypes;

	private GisErrors gisErrors;

	private String gsobName;

	private String gsobDesc;

	private Date gsobDt;

	private Date gsobDtClose;

	private String gsobCode;

/*	private Set gisObjectsAttrs = new HashSet(0);

	private Set gisDatas = new HashSet(0);*/

	public GisObjects() {
	}

	public GisObjects(int gsobId, String gsobName, String gsobDesc, Date gsobDt) {
		this.gsobId = gsobId;
		this.gsobName = gsobName;
		this.gsobDesc = gsobDesc;
		this.gsobDt = gsobDt;
	}

/*	public GisObjects(int gsobId, GisTypes gisTypes, GisErrors gisErrors,
			String gsobName, String gsobDesc, Date gsobDt, Date gsobDtClose,
			String gsobCode, Set gisObjectsAttrs, Set gisDatas) {
		this.gsobId = gsobId;
		this.gisTypes = gisTypes;
		this.gisErrors = gisErrors;
		this.gsobName = gsobName;
		this.gsobDesc = gsobDesc;
		this.gsobDt = gsobDt;
		this.gsobDtClose = gsobDtClose;
		this.gsobCode = gsobCode;
		this.gisObjectsAttrs = gisObjectsAttrs;
		this.gisDatas = gisDatas;
	}*/

	public int getGsobId() {
		return this.gsobId;
	}

	public void setGsobId(int gsobId) {
		this.gsobId = gsobId;
	}

	public GisTypes getGisTypes() {
		return this.gisTypes;
	}

	public void setGisTypes(GisTypes gisTypes) {
		this.gisTypes = gisTypes;
	}

	public GisErrors getGisErrors() {
		return this.gisErrors;
	}

	public void setGisErrors(GisErrors gisErrors) {
		this.gisErrors = gisErrors;
	}

	public String getGsobName() {
		return this.gsobName;
	}

	public void setGsobName(String gsobName) {
		this.gsobName = gsobName;
	}

	public String getGsobDesc() {
		return this.gsobDesc;
	}

	public void setGsobDesc(String gsobDesc) {
		this.gsobDesc = gsobDesc;
	}

	public Date getGsobDt() {
		return this.gsobDt;
	}

	public void setGsobDt(Date gsobDt) {
		this.gsobDt = gsobDt;
	}

	public Date getGsobDtClose() {
		return this.gsobDtClose;
	}

	public void setGsobDtClose(Date gsobDtClose) {
		this.gsobDtClose = gsobDtClose;
	}

	public String getGsobCode() {
		return this.gsobCode;
	}

	public void setGsobCode(String gsobCode) {
		this.gsobCode = gsobCode;
	}

/*	public Set getGisObjectsAttrs() {
		return this.gisObjectsAttrs;
	}

	public void setGisObjectsAttrs(Set gisObjectsAttrs) {
		this.gisObjectsAttrs = gisObjectsAttrs;
	}

	public Set getGisDatas() {
		return this.gisDatas;
	}

	public void setGisDatas(Set gisDatas) {
		this.gisDatas = gisDatas;
	}*/

}
