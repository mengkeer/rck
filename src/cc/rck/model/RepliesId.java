package cc.rck.model;

/**
 * RepliesId entity. @author MyEclipse Persistence Tools
 */

public class RepliesId implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer article;

	// Constructors

	/** default constructor */
	public RepliesId() {
	}

	/** full constructor */
	public RepliesId(Integer id, Integer article) {
		this.id = id;
		this.article = article;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getArticle() {
		return this.article;
	}

	public void setArticle(Integer article) {
		this.article = article;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof RepliesId))
			return false;
		RepliesId castOther = (RepliesId) other;

		return ((this.getId() == castOther.getId()) || (this.getId() != null
				&& castOther.getId() != null && this.getId().equals(
				castOther.getId())))
				&& ((this.getArticle() == castOther.getArticle()) || (this
						.getArticle() != null && castOther.getArticle() != null && this
						.getArticle().equals(castOther.getArticle())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getId() == null ? 0 : this.getId().hashCode());
		result = 37 * result
				+ (getArticle() == null ? 0 : this.getArticle().hashCode());
		return result;
	}

}