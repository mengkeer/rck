package cc.rck.servlet;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cc.rck.model.Message;
import cc.rck.model.User;
import cc.rck.service.UserLogic;
import cc.rck.service.messageService;

import com.opensymphony.xwork2.ActionSupport;

public class MessageAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	
	ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	
	messageService mgeService = ctx.getBean("messageService", messageService.class);
	
	public String sendMessage() throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		String receiver = ServletActionContext.getRequest().getParameter("receiver");
		String context = ServletActionContext.getRequest().getParameter("sendText");
		
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
		
		User guest = mgeService.findReceiver(receiver);
		
		user = mgeService.findSender(user);
		
		if(guest ==null){
			map.put("type",-1);//鐢ㄦ埛鍚嶄笉鍚堟硶
			JSONObject json = JSONObject.fromObject(map);
			HttpServletResponse  response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter(); 
			out.write(json.toString()); 
			return null;
		}
		if(guest.getNumber().equals(user.getNumber())){
			map.put("type",-2);//鎺ユ敹鑰呬笉鑳戒负鑷繁
			JSONObject json = JSONObject.fromObject(map);
			HttpServletResponse  response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter(); 
			out.write(json.toString()); 
			return null;
		}
			
		Timestamp time = new Timestamp(System.currentTimeMillis()); 
		Message message = new Message(user,guest,context,time,0);//0琛ㄧず鏈
		UserLogic logic = ctx.getBean("userLogic", UserLogic.class);
		map.put("type", logic.updateMessage(message));// 0琛ㄧず鎻掑叆澶辫触锛�琛ㄧず鎻掑叆鎴愬姛
		
		JSONObject json = JSONObject.fromObject(map);
		HttpServletResponse  response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter(); 
		out.write(json.toString()); 
		return null;
	}
	
	public String deleteOne() throws Exception{
		String str= ServletActionContext.getRequest().getParameter("id");
		int id = Integer.parseInt(str);
		mgeService.deleteOneMessage(id);
		return null;
	}
	
	public String deleteAll() throws Exception{
		mgeService.deleteAllMessage();
		return null;
	}
	
	public String readAll() throws Exception{
		mgeService.readAllMessage();
		return null;
	}
	public String readOne() throws Exception{
		String str= ServletActionContext.getRequest().getParameter("id");
		int id = Integer.parseInt(str);
		mgeService.readOneMessage(id);
		return null;
	}
}
