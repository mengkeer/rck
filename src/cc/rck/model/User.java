package cc.rck.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private String number;
	private String password;
	private String name;
	private String sex;
	private String phone;
	private String email;
	private String office;
	private String class_;
	private String brief;
	private Timestamp lastTime;
	private String lastIp;
	private String type;
	private String image;
	private Set messagesForSender = new HashSet(0);
	private Set articles = new HashSet(0);
	private Set teamses = new HashSet(0);
	private Set userskills = new HashSet(0);
	private Set messagesForReciver = new HashSet(0);
	private Set replieses = new HashSet(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String number, String password) {
		this.number = number;
		this.password = password;
	}

	/** full constructor */
	public User(String number, String password, String name, String sex,
			String phone, String email, String office, String class_,
			String brief, Timestamp lastTime, String lastIp, String type,
			String image, Set messagesForSender, Set articles, Set teamses,
			Set userskills, Set messagesForReciver, Set replieses) {
		this.number = number;
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.phone = phone;
		this.email = email;
		this.office = office;
		this.class_ = class_;
		this.brief = brief;
		this.lastTime = lastTime;
		this.lastIp = lastIp;
		this.type = type;
		this.image = image;
		this.messagesForSender = messagesForSender;
		this.articles = articles;
		this.teamses = teamses;
		this.userskills = userskills;
		this.messagesForReciver = messagesForReciver;
		this.replieses = replieses;
	}

	// Property accessors

	public String getNumber() {
		return this.number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOffice() {
		return this.office;
	}

	public void setOffice(String office) {
		this.office = office;
	}

	public String getClass_() {
		return this.class_;
	}

	public void setClass_(String class_) {
		this.class_ = class_;
	}

	public String getBrief() {
		return this.brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public Timestamp getLastTime() {
		return this.lastTime;
	}

	public void setLastTime(Timestamp lastTime) {
		this.lastTime = lastTime;
	}

	public String getLastIp() {
		return this.lastIp;
	}

	public void setLastIp(String lastIp) {
		this.lastIp = lastIp;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Set getMessagesForSender() {
		return this.messagesForSender;
	}

	public void setMessagesForSender(Set messagesForSender) {
		this.messagesForSender = messagesForSender;
	}

	public Set getArticles() {
		return this.articles;
	}

	public void setArticles(Set articles) {
		this.articles = articles;
	}

	public Set getTeamses() {
		return this.teamses;
	}

	public void setTeamses(Set teamses) {
		this.teamses = teamses;
	}

	public Set getUserskills() {
		return this.userskills;
	}

	public void setUserskills(Set userskills) {
		this.userskills = userskills;
	}

	public Set getMessagesForReciver() {
		return this.messagesForReciver;
	}

	public void setMessagesForReciver(Set messagesForReciver) {
		this.messagesForReciver = messagesForReciver;
	}

	public Set getReplieses() {
		return this.replieses;
	}

	public void setReplieses(Set replieses) {
		this.replieses = replieses;
	}

}