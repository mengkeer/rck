package cc.rck.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Article entity. @author MyEclipse Persistence Tools
 */

public class Article implements java.io.Serializable {

	// Fields

	private Integer id;
	private User user;
	private String title;
	private String context;
	private Timestamp pubtime;
	private Integer status;
	private Set replieses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Article() {
	}

	/** minimal constructor */
	public Article(User user, String title) {
		this.user = user;
		this.title = title;
	}

	/** full constructor */
	public Article(User user, String title, String context, Timestamp pubtime,
			Integer status, Set replieses) {
		this.user = user;
		this.title = title;
		this.context = context;
		this.pubtime = pubtime;
		this.status = status;
		this.replieses = replieses;
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

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return this.context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Timestamp getPubtime() {
		return this.pubtime;
	}

	public void setPubtime(Timestamp pubtime) {
		this.pubtime = pubtime;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Set getReplieses() {
		return this.replieses;
	}

	public void setReplieses(Set replieses) {
		this.replieses = replieses;
	}

}