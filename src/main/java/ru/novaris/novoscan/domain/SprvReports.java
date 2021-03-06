package ru.novaris.novoscan.domain;

//import java.util.HashSet;
//import java.util.Set;

/**
 * SprvClients generated by hbm2java
 */
public class SprvReports implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private long sprpId;

	private String sprpName;

	private String sprpDesc;

	private String sprpSource;
	
	private long sprpSprtId;
	
	

	public SprvReports() {
	}

	public SprvReports(long sprpId, long sprpSprtId, String sprpName, String sprpSource,
			String sprpDesc) {
		this.sprpId = sprpId;
		this.sprpName = sprpDesc;
		this.setSprpSource(sprpSource);
		this.sprpDesc = sprpDesc;
		this.sprpSprtId = sprpSprtId;
	}




	public long getSprpId() {
		return sprpId;
	}

	public void setSprpId(long sprpId) {
		this.sprpId = sprpId;
	}

	public String getSprpName() {
		return sprpName;
	}

	public void setSprpName(String sprpName) {
		this.sprpName = sprpName;
	}

	public String getSprpDesc() {
		return sprpDesc;
	}

	public void setSprpDesc(String sprpDesc) {
		this.sprpDesc = sprpDesc;
	}

	public String getSprpSource() {
		return sprpSource;
	}

	public void setSprpSource(String sprpSource) {
		this.sprpSource = sprpSource;
	}

	public long getSprpSprtId() {
		return sprpSprtId;
	}

	public void setSprpSprtId(long sprpSprtId) {
		this.sprpSprtId = sprpSprtId;
	}

}
