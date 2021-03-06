package ru.novaris.novoscan.domain;

/**
 * AllClientInfoId generated by hbm2java
 */
public class AllClientInfoId implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String objectName;

	private Long objectId;

	private String objectDesc;

	private String clientName;

	private Long clientId;

	private String departName;

	private Long departId;

	private String moduleName;

	private Double moduleUid;

	private Integer countDay;

	public AllClientInfoId() {
	}

	public AllClientInfoId(String objectName, Long objectId, String objectDesc,
			String clientName, Long clientId, String departName, Long departId,
			String moduleName, Double moduleUid, Integer countDay) {
		this.objectName = objectName;
		this.objectId = objectId;
		this.objectDesc = objectDesc;
		this.clientName = clientName;
		this.clientId = clientId;
		this.departName = departName;
		this.departId = departId;
		this.moduleName = moduleName;
		this.moduleUid = moduleUid;
		this.countDay = countDay;
	}

	public String getObjectName() {
		return this.objectName;
	}

	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}

	public Long getObjectId() {
		return this.objectId;
	}

	public void setObjectId(Long objectId) {
		this.objectId = objectId;
	}

	public String getObjectDesc() {
		return this.objectDesc;
	}

	public void setObjectDesc(String objectDesc) {
		this.objectDesc = objectDesc;
	}

	public String getClientName() {
		return this.clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public Long getClientId() {
		return this.clientId;
	}

	public void setClientId(Long clientId) {
		this.clientId = clientId;
	}

	public String getDepartName() {
		return this.departName;
	}

	public void setDepartName(String departName) {
		this.departName = departName;
	}

	public Long getDepartId() {
		return this.departId;
	}

	public void setDepartId(Long departId) {
		this.departId = departId;
	}

	public String getModuleName() {
		return this.moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public Double getModuleUid() {
		return this.moduleUid;
	}

	public void setModuleUid(Double moduleUid) {
		this.moduleUid = moduleUid;
	}

	public Integer getCountDay() {
		return this.countDay;
	}

	public void setCountDay(Integer countDay) {
		this.countDay = countDay;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AllClientInfoId))
			return false;
		AllClientInfoId castOther = (AllClientInfoId) other;

		return ((this.getObjectName() == castOther.getObjectName()) || (this
				.getObjectName() != null && castOther.getObjectName() != null && this
				.getObjectName().equals(castOther.getObjectName())))
				&& ((this.getObjectId() == castOther.getObjectId()) || (this
						.getObjectId() != null
						&& castOther.getObjectId() != null && this
						.getObjectId().equals(castOther.getObjectId())))
				&& ((this.getObjectDesc().equals(castOther.getObjectDesc())) || (this
						.getObjectDesc() != null
						&& castOther.getObjectDesc() != null && this
						.getObjectDesc().equals(castOther.getObjectDesc())))
				&& ((this.getClientName().equals(castOther.getClientName())) || (this
						.getClientName() != null
						&& castOther.getClientName() != null && this
						.getClientName().equals(castOther.getClientName())))
				&& ((this.getClientId().equals(castOther.getClientId())) || (this
						.getClientId() != null
						&& castOther.getClientId() != null && this
						.getClientId().equals(castOther.getClientId())))
				&& ((this.getDepartName().equals(castOther.getDepartName())) || (this
						.getDepartName() != null
						&& castOther.getDepartName() != null && this
						.getDepartName().equals(castOther.getDepartName())))
				&& ((this.getDepartId().equals(castOther.getDepartId())) || (this
						.getDepartId() != null
						&& castOther.getDepartId() != null && this
						.getDepartId().equals(castOther.getDepartId())))
				&& ((this.getModuleName().equals(castOther.getModuleName())) || (this
						.getModuleName() != null
						&& castOther.getModuleName() != null && this
						.getModuleName().equals(castOther.getModuleName())))
				&& ((this.getModuleUid() == castOther.getModuleUid()) || (this
						.getModuleUid() != null
						&& castOther.getModuleUid() != null && this
						.getModuleUid().equals(castOther.getModuleUid())))
				&& ((this.getCountDay() == castOther.getCountDay()) || (this
						.getCountDay() != null
						&& castOther.getCountDay() != null && this
						.getCountDay().equals(castOther.getCountDay())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getObjectName() == null ? 0 : this.getObjectName()
						.hashCode());
		result = 37 * result
				+ (getObjectId() == null ? 0 : this.getObjectId().hashCode());
		result = 37
				* result
				+ (getObjectDesc() == null ? 0 : this.getObjectDesc()
						.hashCode());
		result = 37
				* result
				+ (getClientName() == null ? 0 : this.getClientName()
						.hashCode());
		result = 37 * result
				+ (getClientId() == null ? 0 : this.getClientId().hashCode());
		result = 37
				* result
				+ (getDepartName() == null ? 0 : this.getDepartName()
						.hashCode());
		result = 37 * result
				+ (getDepartId() == null ? 0 : this.getDepartId().hashCode());
		result = 37
				* result
				+ (getModuleName() == null ? 0 : this.getModuleName()
						.hashCode());
		result = 37 * result
				+ (getModuleUid() == null ? 0 : this.getModuleUid().hashCode());
		result = 37 * result
				+ (getCountDay() == null ? 0 : this.getCountDay().hashCode());
		return result;
	}

}
