package cc.rck.servlet;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cc.rck.DAO.basic.ProjectsDAO;
import cc.rck.DAO.basic.TeamsDAO;
import cc.rck.hibernate.HibernateSessionFactory;
import cc.rck.model.Projects;
import cc.rck.model.Teams;
import cc.rck.model.User;
import cc.rck.service.messageService;
import cc.rck.service.projectService;
import cc.rck.service.teamService;

import com.opensymphony.xwork2.ActionSupport;

public class ProjectAction extends ActionSupport {

	/**
	 * 
	 */
	ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	private static final long serialVersionUID = 1L;
	private projectService proService = ctx.getBean("projectService", projectService.class);
	private teamService tmService = ctx.getBean("teamService", teamService.class);
	
	public String addProject() throws Exception {
		
		String name= ServletActionContext.getRequest().getParameter("name");
		String rank= ServletActionContext.getRequest().getParameter("rank");
		String begin_time= ServletActionContext.getRequest().getParameter("begin_time");
		String end_time= ServletActionContext.getRequest().getParameter("end_time");
		String max= ServletActionContext.getRequest().getParameter("max");
		String teacher= ServletActionContext.getRequest().getParameter("teacher");
		String teamname= ServletActionContext.getRequest().getParameter("teamname");
		String context= ServletActionContext.getRequest().getParameter("context");
		
		Projects project = new Projects(name,rank,begin_time,end_time,teacher,teamname,Integer.parseInt(max),context,null);
		proService.addProject(project);
		return null;
	}
	
	public String applyProject() throws Exception {
		String idproject= ServletActionContext.getRequest().getParameter("idproject");
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("type","-1");//-1表示插入失败
		
		Projects project = new Projects();
		project.setIdprojects(Integer.parseInt(idproject) );
		Teams team = new Teams(user,project);
		List<Teams> list = tmService.findTeams(user);
		if(list.size()==0){
			tmService.saveTeam(team);
			map.put("type","1");//1表示申报成功
		}else
			map.put("type","0");//0表示失败，该用户已经报名过该项目
		JSONObject json = JSONObject.fromObject(map);
		HttpServletResponse  response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter(); 
		out.write(json.toString()); 
		return null;
	}
}
