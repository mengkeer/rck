package cc.rck.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transaction;

import org.apache.struts2.ServletActionContext;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.hibernate.Session;

import cc.rck.DAO.basic.UserDAO;
import cc.rck.hibernate.HibernateSessionFactory;
import cc.rck.model.User;
import cc.rck.tools.ImageCut;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport {
	
	static HttpSession session = ServletActionContext.getRequest().getSession();

	private HttpServletRequest request;
	private HttpServletResponse response;
	private File image; // 上传的文件
	private String imageFileName; // 文件名称
	private String imageContentType; // 文件类型
	
	private Session sess = HibernateSessionFactory.getSession();
	private org.hibernate.Transaction transaction ;

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}
	
	public User getUser(){
		return	(User)session.getAttribute("user");
	}

	public String uploadBigImage() throws Exception {
		
		User user = getUser();
		if(user==null)	return "error";

		request = ServletActionContext.getRequest();

		String realpath = ServletActionContext.getServletContext().getRealPath("/upload/BigImage");
        //D:\apache-tomcat-6.0.18\webapps\struts2_upload\images
        System.out.println("realpath: "+realpath);
        
        
        File file =new File("");//传入的文件
        File files=new File("");//保存的文件目录和文件名
        InputStream streamIn = null; 
        OutputStream streamOut = null; 
        if(!files.exists()){
        try {
        	streamIn = new FileInputStream(file);
        	streamOut = new FileOutputStream(files); 
        	int bytesRead = 0; 
        	byte[] buffer = new byte[81920]; 
        	while ((bytesRead = streamIn.read(buffer, 0, 81920)) != -1) { 
        		streamOut.write(buffer, 0, bytesRead); 
        } 
        streamOut.close(); 
        streamIn.close(); 
        } catch (IOException e) {
        	e.printStackTrace();
        }
        }
        
        
        
        if (image != null) {
        	System.out.println("开始上传大图片");
        	String name = user.getNumber()+imageFileName.substring(imageFileName.lastIndexOf('.'));
        	System.out.println(name);
            File savefile = new File(new File(realpath), name);
            if (!savefile.getParentFile().exists())
                savefile.getParentFile().mkdirs();
            FileUtils.copyFile(image, savefile);
            
            String str ="upload/BigImage/"+name;
            ServletActionContext.getRequest().getSession().setAttribute("bigimage", str);
        }
    
    	String type = user.getType();
        if(type.equals("2"))
			return "success_t";
		else
			return "success_s";
	}
	

	public String cutBigImage() throws Exception {
		
		System.out.println("开始剪裁头像");
		
		User user = getUser();
		if(user==null)	return "error";
			
			request = ServletActionContext.getRequest();
	        String bigImage = request.getParameter("bigImage");          
	        if(bigImage==null || bigImage.isEmpty())
	        	return ERROR;
	        int x = Integer.valueOf(request.getParameter("x"));
	        int y = Integer.valueOf(request.getParameter("y"));
	        int w = Integer.valueOf(request.getParameter("w"));
	        int h = Integer.valueOf(request.getParameter("h"));
	        int bw = Integer.valueOf(request.getParameter("bw"));
	        int bh = Integer.valueOf(request.getParameter("bh"));
	        
//	        String[] imageNameS = bigImage.split("/");
//	        String imageName = imageNameS[imageNameS.length-1];
	        
	        String imageName  = bigImage.substring(bigImage.lastIndexOf('/')+1);
	        
	        String imagePath = ServletActionContext.getServletContext().getRealPath("/upload/BigImage/")+imageName;
	        String destImagePath = ServletActionContext.getServletContext().getRealPath("/upload/avatar/")+imageName;
	        System.out.println("源地址:"+imagePath);
	        System.out.println("源地址:"+destImagePath);
	        ImageCut imageCut = new ImageCut();
	        imageCut.cutImage(imagePath, x, y, w, h,bw,bh,destImagePath);
	        String path = "upload/avatar/"+imageName;
	        transaction = sess.beginTransaction();
	        UserDAO udao = new UserDAO();
	        user = udao.findById(user.getNumber());
	        user.setImage(path);
	        udao.save(user);
	        transaction.commit();
	        sess.close();
	        session.setAttribute("user", user);
    	String type = user.getType();
        if(type.equals("2"))
			return "success_t";
		else
			return "success_s";
	}
	
}