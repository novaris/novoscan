package ru.novaris.novoscan.domain;

/**
 * SpsnId generated by hbm2java
 */
public class SpsnId implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long coalesce;

	public SpsnId() {
	}

	public SpsnId(Long coalesce) {
		this.coalesce = coalesce;
	}

	public Long getCoalesce() {
		return this.coalesce;
	}

	public void setCoalesce(Long coalesce) {
		this.coalesce = coalesce;
	}

}