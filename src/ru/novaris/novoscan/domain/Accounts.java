package ru.novaris.novoscan.domain;

import java.util.Date;

/**
 * Accounts generated by hbm2java
 */
public class Accounts implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private long acctId;

	private String acctLogin;

	private String acctPasswd;

	private String acctName;

	private Date acctDt;

	private String acctEmail;

	private String acctName2;

	private String acctName3;

	public Accounts() {
	}

	public Accounts(long acctId, String acctLogin, String acctPasswd,
			String acctName, Date acctDt) {
		this.acctId = acctId;
		this.acctLogin = acctLogin;
		this.acctPasswd = acctPasswd;
		this.acctName = acctName;
		this.acctDt = acctDt;
	}

	public Accounts(long acctId, String acctLogin, String acctPasswd,
			String acctName, Date acctDt, String acctEmail, String acctName2,
			String acctName3) {
		this.acctId = acctId;
		this.acctLogin = acctLogin;
		this.acctPasswd = acctPasswd;
		this.acctName = acctName;
		this.acctDt = acctDt;
		this.acctEmail = acctEmail;
		this.acctName2 = acctName2;
		this.acctName3 = acctName3;
	}

	public long getAcctId() {
		return this.acctId;
	}

	public void setAcctId(long acctId) {
		this.acctId = acctId;
	}

	public String getAcctLogin() {
		return this.acctLogin;
	}

	public void setAcctLogin(String acctLogin) {
		this.acctLogin = acctLogin;
	}

	public String getAcctPasswd() {
		return this.acctPasswd;
	}

	public void setAcctPasswd(String acctPasswd) {
		this.acctPasswd = acctPasswd;
	}

	public String getAcctName() {
		return this.acctName;
	}

	public void setAcctName(String acctName) {
		this.acctName = acctName;
	}

	public Date getAcctDt() {
		return this.acctDt;
	}

	public void setAcctDt(Date acctDt) {
		this.acctDt = acctDt;
	}

	public String getAcctEmail() {
		return this.acctEmail;
	}

	public void setAcctEmail(String acctEmail) {
		this.acctEmail = acctEmail;
	}

	public String getAcctName2() {
		return this.acctName2;
	}

	public void setAcctName2(String acctName2) {
		this.acctName2 = acctName2;
	}

	public String getAcctName3() {
		return this.acctName3;
	}

	public void setAcctName3(String acctName3) {
		this.acctName3 = acctName3;
	}

}
