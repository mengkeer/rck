package cc.rck.servlet;


import java.sql.Timestamp;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cc.rck.DAO.basic.ArticleDAO;
import cc.rck.DAO.basic.RepliesDAO;
import cc.rck.hibernate.HibernateSessionFactory;
import cc.rck.model.Article;
import cc.rck.model.Replies;
import cc.rck.model.User;

import com.opensymphony.xwork2.ActionSupport;

public class ReplyAction extends ActionSupport {

	private Session session = HibernateSessionFactory.getSession();
	private Transaction transaction;
	private User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
	
	private int value;
	
	
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	private static final long serialVersionUID = 1;
	public String addReply() throws Exception {
		String content = ServletActionContext.getRequest().getParameter("content").toString();
		String articleId = ServletActionContext.getRequest().getParameter("articleId").toString();
		int id = Integer.parseInt(articleId);
		
		
		ServletActionContext.getRequest().getSession().setAttribute("currentarticle",id);
		
		Timestamp time = new Timestamp(System.currentTimeMillis()); 
		Replies reply = new Replies();
		transaction = session.beginTransaction();
		ArticleDAO adao = new ArticleDAO();
		Article article = adao.findById(Integer.parseInt(articleId));
		
		reply.setArticle(article);
		reply.setUser(user);
		reply.setReplytime(time);
		reply.setContext(content);
		
		RepliesDAO rdao = new RepliesDAO();
		rdao.save(reply);
		transaction.commit();
		session.close();
		setValue(id);
		
		String type = user.getType();
		if(type.equals("1"))
			return "success_s";
		if(type.equals("2"))
			return "success_t";
		return "error";
	}
	public String deleteReply() throws Exception {
		String replyId = ServletActionContext.getRequest().getParameter("replyId");
		
		RepliesDAO rdao = new RepliesDAO();
		
		transaction = session.beginTransaction();
		Replies reply = rdao.findById(Integer.parseInt(replyId));
	    rdao.delete(reply);
		transaction.commit();
		session.close();
		return null;
	}
	
	public String addArticle() throws Exception {
		String title = ServletActionContext.getRequest().getParameter("title");
		String context = ServletActionContext.getRequest().getParameter("context");
		Timestamp time = new Timestamp(System.currentTimeMillis()); 
		
		ArticleDAO adao = new ArticleDAO();
		Article article = new Article(user,title,context,time,1,null);
		transaction = session.beginTransaction();
		adao.save(article);
		transaction.commit();
		session.close();
		return null;
	}
}
