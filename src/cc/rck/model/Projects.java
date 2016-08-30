package cc.rck.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Projects entity. @author MyEclipse Persistence Tools
 */

public class Projects implements java.io.Serializable {

	// Fields

	private Integer idprojects;
	private String name;
	private String rank;
	private String beginTime;
	private String endTime;
	private String teacher;
	private String teamname;
	private Integer max;
	private String context;
	private Set teamses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Projects() {
	}

	/** minimal constructor */
	public Projects(String name, String rank, String beginTime, String endTime,
			String teamname, Integer max) {
		this.name = name;
		this.rank = rank;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.teamname = teamname;
		this.max = max;
	}

	/** full constructor */
	public Projects(String name, String rank, String beginTime, String endTime,
			String teacher, String teamname, Integer max, String context,
			Set teamses) {
		this.name = name;
		this.rank = rank;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.teacher = teacher;
		this.teamname = teamname;
		this.max = max;
		this.context = context;
		this.teamses = teamses;
	}

	// Property accessors

	public Integer getIdprojects() {
		return this.idprojects;
	}

	public void setIdprojects(Integer idprojects) {
		this.idprojects = idprojects;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRank() {
		return this.rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getBeginTime() {
		return this.beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return this.endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getTeacher() {
		return this.teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public String getTeamname() {
		return this.teamname;
	}

	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}

	public Integer getMax() {
		return this.max;
	}

	public void setMax(Integer max) {
		this.max = max;
	}

	public String getContext() {
		return this.context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Set getTeamses() {
		return this.teamses;
	}

	public void setTeamses(Set teamses) {
		this.teamses = teamses;
	}

}