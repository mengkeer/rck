package cc.rck.service;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cc.rck.DAO.basic.ProjectsDAO;
import cc.rck.hibernate.HibernateSessionFactory;
import cc.rck.model.Projects;

public class projectService {
	
	private Session session = HibernateSessionFactory.getSession();
	private Transaction transaction;
	private ProjectsDAO pdao;
	
	public ProjectsDAO getPdao() {
		return pdao;
	}
	public void setPdao(ProjectsDAO pdao) {
		this.pdao = pdao;
	}
	public projectService() {
		// TODO Auto-generated constructor stub
	}
	public void addProject(Projects project){
		transaction = session.beginTransaction();
		pdao.save(project);
		transaction.commit();
		session.close();
	}
}
