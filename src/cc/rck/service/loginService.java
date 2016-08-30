package cc.rck.service;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import cc.rck.DAO.basic.UserDAO;
import cc.rck.hibernate.HibernateSessionFactory;
import cc.rck.model.User;

public class loginService {
	
    private Session session = HibernateSessionFactory.getSession();
    private Transaction transaction;
    HibernateSessionFactory getSession;
    
	private UserDAO userDao;
	private User user;
	
	public loginService() {
		// TODO Auto-generated constructor stub

	}
	
    public UserDAO getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}
	
    public int queryInfo(String number,String password, HttpSession se){
//   	 UserDAO userDao = new UserDAO();
   	 try{
   		 	User pl = userDao.findById(number);
   		 	if(pl!=null){
   		 		if(pl.getPassword().equals(password)){
   		 			se.setAttribute("user", pl);
   		 			return 1;
   		 		}
   		 		else
   		 			return -1;
   		 	}else{
   		 		return -1;
   		 	}                                 
            }catch (Exception e) {
           	 e.printStackTrace();
                session.close();
                return -3;
            }              
    }
    
    public int saveInfo(String number,String password,String sex){
        try{
      	   	   transaction = session.beginTransaction();
      	   		user.setNumber(number);
	  			user.setPassword(password);
      			user.setType("1");
      			user.setSex(sex);
      			session.save(user);
      	   		transaction.commit();
      	   		session.close();
               return 1 ;
        }catch (Exception e) {
       	 session.close();
       	 return -1;
        }          
    }

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
