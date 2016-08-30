package cc.rck.model;

/**
 * Teams entity. @author MyEclipse Persistence Tools
 */

public class Teams implements java.io.Serializable {

	// Fields

	private Integer id;
	private User user;
	private Projects projects;

	// Constructors

	/** default constructor */
	public Teams() {
	}

	/** full constructor */
	public Teams(User user, Projects projects) {
		this.user = user;
		this.projects = projects;
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

	public Projects getProjects() {
		return this.projects;
	}

	public void setProjects(Projects projects) {
		this.projects = projects;
	}

}