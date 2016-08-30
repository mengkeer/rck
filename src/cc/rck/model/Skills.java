package cc.rck.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Skills entity. @author MyEclipse Persistence Tools
 */

public class Skills implements java.io.Serializable {

	// Fields

	private Integer idSkiil;
	private String name;
	private Integer type;
	private Set userskills = new HashSet(0);

	// Constructors

	/** default constructor */
	public Skills() {
	}

	/** minimal constructor */
	public Skills(String name) {
		this.name = name;
	}

	/** full constructor */
	public Skills(String name, Integer type, Set userskills) {
		this.name = name;
		this.type = type;
		this.userskills = userskills;
	}

	// Property accessors

	public Integer getIdSkiil() {
		return this.idSkiil;
	}

	public void setIdSkiil(Integer idSkiil) {
		this.idSkiil = idSkiil;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Set getUserskills() {
		return this.userskills;
	}

	public void setUserskills(Set userskills) {
		this.userskills = userskills;
	}

}