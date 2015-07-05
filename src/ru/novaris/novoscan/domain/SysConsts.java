package ru.novaris.novoscan.domain;

import java.util.Date;

/**
 * SysConsts generated by hbm2java
 */
public class SysConsts implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private long scId;

	private String scName;

	private Double scNvalue;

	private String scCvalue;

	private Date scDvalue;

	private Date scDtCreate;

	private String scDesc;

	public SysConsts() {
	}

	public SysConsts(long scId, String scName, Date scDtCreate, String scDesc) {
		this.scId = scId;
		this.scName = scName;
		this.scDtCreate = scDtCreate;
		this.scDesc = scDesc;
	}

	public SysConsts(long scId, String scName, Double scNvalue,
			String scCvalue, Date scDvalue, Date scDtCreate, String scDesc) {
		this.scId = scId;
		this.scName = scName;
		this.scNvalue = scNvalue;
		this.scCvalue = scCvalue;
		this.scDvalue = scDvalue;
		this.scDtCreate = scDtCreate;
		this.scDesc = scDesc;
	}

	public long getScId() {
		return this.scId;
	}

	public void setScId(long scId) {
		this.scId = scId;
	}

	public String getScName() {
		return this.scName;
	}

	public void setScName(String scName) {
		this.scName = scName;
	}

	public Double getScNvalue() {
		return this.scNvalue;
	}

	public void setScNvalue(Double scNvalue) {
		this.scNvalue = scNvalue;
	}

	public String getScCvalue() {
		return this.scCvalue;
	}

	public void setScCvalue(String scCvalue) {
		this.scCvalue = scCvalue;
	}

	public Date getScDvalue() {
		return this.scDvalue;
	}

	public void setScDvalue(Date scDvalue) {
		this.scDvalue = scDvalue;
	}

	public Date getScDtCreate() {
		return this.scDtCreate;
	}

	public void setScDtCreate(Date scDtCreate) {
		this.scDtCreate = scDtCreate;
	}

	public String getScDesc() {
		return this.scDesc;
	}

	public void setScDesc(String scDesc) {
		this.scDesc = scDesc;
	}

}
