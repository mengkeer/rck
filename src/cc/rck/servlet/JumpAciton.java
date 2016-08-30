package cc.rck.servlet;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cc.rck.DAO.basic.ArticleDAO;
import cc.rck.DAO.basic.UserDAO;
import cc.rck.model.Article;
import cc.rck.model.User;

import com.opensymphony.xwork2.ActionSupport;

public class JumpAciton extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static HttpSession session = ServletActionContext.getRequest().getSession();
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return super.execute();
	}
	public String Jump() throws Exception {
		// TODO Auto-generated method stub
		User user = getUser();
		if(user!=null){
			String type = user.getType();
			if(type.equals("1"))
				return "success_s";
			if(type.equals("2"))
				return "success_t";
			return "error";
		}
		return "error";
	}
	public User getUser(){
		return	(User)session.getAttribute("user");
	}
	
	public String infoJump() throws Exception {
		// TODO Auto-generated method stub
		User user = getUser();
		if(user==null)
			return "error";
		else{
			String number =ServletActionContext.getRequest().getParameter("userid");
			if(number==null)
				ServletActionContext.getRequest().getSession().setAttribute("guest", user);
			else{
				UserDAO userdao = new UserDAO();
				User guest = userdao.findById(number);
				ServletActionContext.getRequest().getSession().setAttribute("guest", guest);
			}
			String type = user.getType();
			if(type.equals("2")&&number==null)
				return "success_t";
			else
				return "success_s";
		}
	}
	public String detailJump() throws Exception {
		// TODO Auto-generated method stub
		User user = getUser();
		if(user==null)
			return "error";
		else{
			String number =ServletActionContext.getRequest().getParameter("article");
			if(number ==null){
				number = ServletActionContext.getRequest().getSession().getAttribute("currentarticle").toString();
			}
			ArticleDAO adao = new ArticleDAO();
			Article article = adao.findById(Integer.parseInt(number));
			ServletActionContext.getRequest().getSession().setAttribute("articledetail", article);
				String type = user.getType();
				if(type.equals("1"))
					return "success_s";
				if(type.equals("2"))
					return "success_t";
				return "error";
		}
	}
}	
