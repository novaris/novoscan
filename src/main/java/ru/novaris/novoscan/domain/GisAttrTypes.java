package ru.novaris.novoscan.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * GisAttrTypes generated by hbm2java
 */
public class GisAttrTypes implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int gsttId;

	private String gsttName;

	private String gsttDesc;

	@SuppressWarnings("rawtypes")
	private Set<?> gisObjectsAttrs = new HashSet(0);

	public GisAttrTypes() {
	}

	public GisAttrTypes(int gsttId, String gsttName, String gsttDesc) {
		this.gsttId = gsttId;
		this.gsttName = gsttName;
		this.gsttDesc = gsttDesc;
	}

	public GisAttrTypes(int gsttId, String gsttName, String gsttDesc,
			Set<?> gisObjectsAttrs) {
		this.gsttId = gsttId;
		this.gsttName = gsttName;
		this.gsttDesc = gsttDesc;
		this.gisObjectsAttrs = gisObjectsAttrs;
	}

	public int getGsttId() {
		return this.gsttId;
	}

	public void setGsttId(int gsttId) {
		this.gsttId = gsttId;
	}

	public String getGsttName() {
		return this.gsttName;
	}

	public void setGsttName(String gsttName) {
		this.gsttName = gsttName;
	}

	public String getGsttDesc() {
		return this.gsttDesc;
	}

	public void setGsttDesc(String gsttDesc) {
		this.gsttDesc = gsttDesc;
	}

	public Set<?> getGisObjectsAttrs() {
		return this.gisObjectsAttrs;
	}

	public void setGisObjectsAttrs(Set<?> gisObjectsAttrs) {
		this.gisObjectsAttrs = gisObjectsAttrs;
	}

}
