package cc.rck.model;

import java.sql.Timestamp;

/**
 * Replies entity. @author MyEclipse Persistence Tools
 */

public class Replies implements java.io.Serializable {

	// Fields

	private Integer id;
	private User user;
	private Article article;
	private Timestamp replytime;
	private String context;

	// Constructors

	/** default constructor */
	public Replies() {
	}

	/** minimal constructor */
	public Replies(User user, Article article, Timestamp replytime) {
		this.user = user;
		this.article = article;
		this.replytime = replytime;
	}

	/** full constructor */
	public Replies(User user, Article article, Timestamp replytime,
			String context) {
		this.user = user;
		this.article = article;
		this.replytime = replytime;
		this.context = context;
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

	public Article getArticle() {
		return this.article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public Timestamp getReplytime() {
		return this.replytime;
	}

	public void setReplytime(Timestamp replytime) {
		this.replytime = replytime;
	}

	public String getContext() {
		return this.context;
	}

	public void setContext(String context) {
		this.context = context;
	}

}