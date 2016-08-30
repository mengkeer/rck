package cc.rck.servlet;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cc.rck.model.User;
import cc.rck.service.UserLogic;

import com.opensymphony.xwork2.ActionSupport;


public class UpdateInfAction extends ActionSupport {

	private ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	
	private static final long serialVersionUID = 1L;
	UserLogic userLogic = ctx.getBean("userLogic", UserLogic.class);
	HttpSession session = ServletActionContext.getRequest().getSession();
	User user = (User)session.getAttribute("user");
	
	public String updateMge() throws Exception{
		HttpServletRequest req = ServletActionContext.getRequest();
		String sex = req.getParameter("sex");
		String email = req.getParameter("email");
		String class_ = req.getParameter("class_");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String brief = req.getParameter("brief");
	
		Map<String, Object> map=new HashMap<String, Object>();

		user.setSex(sex);
		user.setEmail(email);
		user.setClass_(class_);
		user.setName(name);
		user.setPhone(phone);
		user.setBrief(brief);
	
		map.put("type", userLogic.updateInf(user));
		map.put("user", JSONObject.fromObject(user));

		
		JSONObject json = JSONObject.fromObject(map);
		HttpServletResponse  response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter(); 
		out.write(json.toString()); 
		return null;
	}
	
	public String doModPwd() throws Exception{
		// TODO Auto-generated method stub
		HttpServletRequest req = ServletActionContext.getRequest();
		String password = req.getParameter("password");
		String new_password = req.getParameter("new_password");
		Map<String, Integer> map=new HashMap<String, Integer>();
		
		if(password.equals(user.getPassword())){
			user.setPassword(new_password);
			map.put("type", userLogic.updateInf(user));
		}else
			map.put("type", -1);
		
		JSONObject json = JSONObject.fromObject(map);
		HttpServletResponse  response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter(); 
		out.write(json.toString()); 
		
		return null;
	}
	public String updateSkill() throws Exception{
		HttpServletRequest req =ServletActionContext.getRequest();
		String[] skillOwn = req.getParameterValues("own");
		if(skillOwn!=null)
			userLogic.updateSkill(user,skillOwn,1);
		
		String[] skillwant = req.getParameterValues("want");
		if(skillwant!=null)
			userLogic.updateSkill(user,skillwant,2);
		return SUCCESS;
	}
}
