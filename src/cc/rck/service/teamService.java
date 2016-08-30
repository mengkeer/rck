package cc.rck.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cc.rck.DAO.basic.TeamsDAO;
import cc.rck.hibernate.HibernateSessionFactory;
import cc.rck.model.Teams;
import cc.rck.model.User;

public class teamService {
	
	private Session session = HibernateSessionFactory.getSession();
	private Transaction transaction;
	private TeamsDAO tdao;
	
	public TeamsDAO getTdao() {
		return tdao;
	}

	public void setTdao(TeamsDAO tdao) {
		this.tdao = tdao;
	}

	public teamService() {
		// TODO Auto-generated constructor stub
	}
	public List<Teams> findTeams(User user){	
		return tdao.findByProperty("user", user);
	}
	
	public void saveTeam(Teams team){
		transaction =session.beginTransaction();
		tdao.save(team);
		transaction.commit();
		session.close();
	}
}
