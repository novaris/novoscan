package ru.novaris.novoscan.domain;
// Generated 06.09.2013 13:10:53 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * EventLogId generated by hbm2java
 */
public class EventLog implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8346871261755393116L;
	private Long evlgId;
	private int evlgType;
	private String evlgUser;
	private String evlgScheme;
	private String evlgVersion;
	private int evlgModtype;
	private String evlgModname;
	private String evlgPrefixCode;
	private long evlgCode;
	private String evlgText;
	private String evlgInfo;
	private int evlgRepeat;
	private Date evlgDt;

	public EventLog() {
	}

	public EventLog(int evlgType, String evlgUser, String evlgScheme,
			String evlgVersion, int evlgModtype, String evlgModname,
			String evlgPrefixCode, long evlgCode, String evlgText,
			int evlgRepeat, Date evlgDt) {
		this.evlgType = evlgType;
		this.evlgUser = evlgUser;
		this.evlgScheme = evlgScheme;
		this.evlgVersion = evlgVersion;
		this.evlgModtype = evlgModtype;
		this.evlgModname = evlgModname;
		this.evlgPrefixCode = evlgPrefixCode;
		this.evlgCode = evlgCode;
		this.evlgText = evlgText;
		this.evlgRepeat = evlgRepeat;
		this.evlgDt = evlgDt;
	}

	public EventLog(Long evlgId, int evlgType, String evlgUser,
			String evlgScheme, String evlgVersion, int evlgModtype,
			String evlgModname, String evlgPrefixCode, long evlgCode,
			String evlgText, String evlgInfo, int evlgRepeat, Date evlgDt) {
		this.evlgId = evlgId;
		this.evlgType = evlgType;
		this.evlgUser = evlgUser;
		this.evlgScheme = evlgScheme;
		this.evlgVersion = evlgVersion;
		this.evlgModtype = evlgModtype;
		this.evlgModname = evlgModname;
		this.evlgPrefixCode = evlgPrefixCode;
		this.evlgCode = evlgCode;
		this.evlgText = evlgText;
		this.evlgInfo = evlgInfo;
		this.evlgRepeat = evlgRepeat;
		this.evlgDt = evlgDt;
	}

	public Long getEvlgId() {
		return this.evlgId;
	}

	public void setEvlgId(Long evlgId) {
		this.evlgId = evlgId;
	}

	public int getEvlgType() {
		return this.evlgType;
	}

	public void setEvlgType(int evlgType) {
		this.evlgType = evlgType;
	}

	public String getEvlgUser() {
		return this.evlgUser;
	}

	public void setEvlgUser(String evlgUser) {
		this.evlgUser = evlgUser;
	}

	public String getEvlgScheme() {
		return this.evlgScheme;
	}

	public void setEvlgScheme(String evlgScheme) {
		this.evlgScheme = evlgScheme;
	}

	public String getEvlgVersion() {
		return this.evlgVersion;
	}

	public void setEvlgVersion(String evlgVersion) {
		this.evlgVersion = evlgVersion;
	}

	public int getEvlgModtype() {
		return this.evlgModtype;
	}

	public void setEvlgModtype(int evlgModtype) {
		this.evlgModtype = evlgModtype;
	}

	public String getEvlgModname() {
		return this.evlgModname;
	}

	public void setEvlgModname(String evlgModname) {
		this.evlgModname = evlgModname;
	}

	public String getEvlgPrefixCode() {
		return this.evlgPrefixCode;
	}

	public void setEvlgPrefixCode(String evlgPrefixCode) {
		this.evlgPrefixCode = evlgPrefixCode;
	}

	public long getEvlgCode() {
		return this.evlgCode;
	}

	public void setEvlgCode(long evlgCode) {
		this.evlgCode = evlgCode;
	}

	public String getEvlgText() {
		return this.evlgText;
	}

	public void setEvlgText(String evlgText) {
		this.evlgText = evlgText;
	}

	public String getEvlgInfo() {
		return this.evlgInfo;
	}

	public void setEvlgInfo(String evlgInfo) {
		this.evlgInfo = evlgInfo;
	}

	public int getEvlgRepeat() {
		return this.evlgRepeat;
	}

	public void setEvlgRepeat(int evlgRepeat) {
		this.evlgRepeat = evlgRepeat;
	}

	public Date getEvlgDt() {
		return this.evlgDt;
	}

	public void setEvlgDt(Date evlgDt) {
		this.evlgDt = evlgDt;
	}

}