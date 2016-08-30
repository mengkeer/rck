package cc.rck.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletOutputStream;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;



import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import cc.rck.service.loginService;
import cc.rck.tools.*;

import com.opensymphony.xwork2.ActionSupport;


public class LoginAction extends ActionSupport {

	private ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String doLogin() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();

		String name = req.getParameter("name");
		String password = req.getParameter("password");
		String codeText = req.getParameter("codeText").toLowerCase();
		Map<String, Integer> map=new HashMap<String, Integer>();
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		String str = session.getAttribute("imageCode").toString().toLowerCase();
		if(!str.equals(codeText)){
			map.put("type",-2);
		}
		else{
			loginService inf = ctx.getBean("loginService", loginService.class);
			int type = inf.queryInfo(name, password,session);//判断用户是否存在，如果存在，保存到session中
			map.put("type",type);
		}
		
		JSONObject json = JSONObject.fromObject(map);
		HttpServletResponse  response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter(); 
		out.write(json.toString()); 
		return null;
	}
	public String doRegister() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		
		loginService inf = ctx.getBean("loginService", loginService.class);
		int type = inf.saveInfo(name, password,"男");
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("type",type);
		
		JSONObject json = JSONObject.fromObject(map);
		HttpServletResponse  response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter(); 
	    out.write(json.toString()); 
		return null;
		
	}
	public String getImageCode() throws IOException {
		HttpServletResponse  response = ServletActionContext.getResponse();
		response.setContentType("image/jpeg");
		// ת��JPEG��ʽ
		ServletOutputStream out = response.getOutputStream();
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
		encoder.encode(imageidentity.getBufferedImage());
		
		out.flush();
		return null;
	}
	public String doLogout() throws IOException {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("user");
		return SUCCESS;
	}
}
