package cc.rck.service;


import cc.rck.DAO.basic.MessageDAO;
import cc.rck.DAO.basic.SkillsDAO;

import cc.rck.DAO.basic.UserskillDAO;

import java.util.List;

import org.hibernate.*;

import cc.rck.model.Message;
import cc.rck.model.User;
import cc.rck.model.Userskill;
import cc.rck.hibernate.HibernateSessionFactory;
 
public class UserLogic {
         private Session session = HibernateSessionFactory.getSession();
         private Transaction transaction;
         HibernateSessionFactory getSession;
         
         
         private UserskillDAO sdao;
         private MessageDAO dao;
       
		public UserskillDAO getSdao() {
			return sdao;
		}

		public void setSdao(UserskillDAO sdao) {
			this.sdao = sdao;
		}

		public MessageDAO getDao() {
			return dao;
		}

		public void setDao(MessageDAO dao) {
			this.dao = dao;
		}

		public UserLogic() {
			// TODO Auto-generated constructor stub
        	 
		}
         

         public int updateInf(User user){
             try{
           	   	    transaction = session.beginTransaction();
           			session.update(user);;
           	   		transaction.commit();
           	   		session.close();
                    return 1 ;
             }catch (Exception e) {
            	 session.close();
            	 return 0;
             }          
         }
         public int updateSkill(User user, String [] skillIds,int type){
    		
//     		UserskillDAO sdao = new UserskillDAO();
     		List <Userskill> myskills = sdao.findByProperty("user", user);
             try{
           	   	    transaction = session.beginTransaction();
           	   	    for(int i =0;i<myskills.size();i++){
           	   	    	Userskill u = myskills.get(i);
           	   	    	if(u.getType()==type)
           	   	    		sdao.delete(u);
           	   	    }
           	   	    SkillsDAO dao = new SkillsDAO();
           			for(int i = 0;i<skillIds.length;i++){
           				int id =  Integer.parseInt(skillIds[i]);
           				Userskill userskill = new Userskill(user,dao.findById(id),type);
               	   	    sdao.save(userskill);
           			}
           	   		transaction.commit();
           	   		session.close();
                    return 1 ;
             }catch (Exception e) {
            	 session.close();
            	 return 0;
             }          
         }
         
         public int updateMessage(Message message){
             try{
//            	 	MessageDAO dao = new MessageDAO();
           	   	    transaction = session.beginTransaction();
           			dao.save(message);
           	   		transaction.commit();
           	   		session.close();
                    return 1 ;
             }catch (Exception e) {
            	 session.close();
            	 return 0;
             }          
         }
}

