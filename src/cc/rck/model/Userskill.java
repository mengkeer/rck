package cc.rck.model;

/**
 * Userskill entity. @author MyEclipse Persistence Tools
 */

public class Userskill implements java.io.Serializable {

	// Fields

	private Integer id;
	private User user;
	private Skills skills;
	private Integer type;

	// Constructors

	/** default constructor */
	public Userskill() {
	}

	/** full constructor */
	public Userskill(User user, Skills skills, Integer type) {
		this.user = user;
		this.skills = skills;
		this.type = type;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Skills getSkills() {
		return this.skills;
	}

	public void setSkills(Skills skills) {
		this.skills = skills;
	}

	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

}