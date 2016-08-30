package cc.rck.service;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cc.rck.DAO.basic.MessageDAO;
import cc.rck.DAO.basic.UserDAO;
import cc.rck.hibernate.HibernateSessionFactory;
import cc.rck.model.Message;
import cc.rck.model.User;

public class messageService {

	private UserDAO udao;
	private MessageDAO mdao;;
	
    private Session session = HibernateSessionFactory.getSession();
    private Transaction transaction ;
    HibernateSessionFactory getSession;
	
	public UserDAO getUdao() {
		return udao;
	}
	public void setUdao(UserDAO udao) {
		this.udao = udao;
	}
	public MessageDAO getMdao() {
		return mdao;
	}
	public void setMdao(MessageDAO mdao) {
		this.mdao = mdao;
	}
	
	public messageService() {
		// TODO Auto-generated constructor stub
	}
	public User findReceiver(String receiver){
		User guest = udao.findById(receiver);
		return guest;
	}
	
	public User findSender(User user){
		User guest = udao.findById(user.getNumber());
		return guest;
	}
	
	public void deleteOneMessage(int id){
		transaction = session.beginTransaction();
		Message message = mdao.findById(id);
		mdao.delete(message);
		transaction.commit();
		session.close();
	}
	public void deleteAllMessage(){
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
		transaction = session.beginTransaction();
		List<Message>  messages = mdao.findByProperty("userBySender", user);
		messages.addAll(mdao.findByProperty("userByReciver", user));
		for(int i = 0;i<messages.size();i++){
			mdao.delete(messages.get(i));
		}
		transaction.commit();
		session.close();
	}
	
	public void readAllMessage(){
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
		List<Message>  messages = mdao.findByProperty("userByReciver", user);
		transaction = session.beginTransaction();
		for(int i = 0;i<messages.size();i++){
			Message message = messages.get(i);
			message.setFlag(1);
			mdao.save(message);
		}
		transaction.commit();
		session.close();
	}
	public void readOneMessage(int id){
		transaction = session.beginTransaction();
		Message message = mdao.findById(id);
		message.setFlag(1);
		mdao.save(message);
		transaction.commit();
		session.close();
	}
}
