package cc.rck.model;

import java.sql.Timestamp;


/**
 * Message entity. @author MyEclipse Persistence Tools
 */

public class Message  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private User userBySender;
     private User userByReciver;
     private String context;
     private Timestamp sendtime;
     private Integer flag;


    // Constructors

    /** default constructor */
    public Message() {
    }

	/** minimal constructor */
    public Message(User userBySender, User userByReciver, String context) {
        this.userBySender = userBySender;
        this.userByReciver = userByReciver;
        this.context = context;
    }
    
    /** full constructor */
    public Message(User userBySender, User userByReciver, String context, Timestamp sendtime, Integer flag) {
        this.userBySender = userBySender;
        this.userByReciver = userByReciver;
        this.context = context;
        this.sendtime = sendtime;
        this.flag = flag;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public User getUserBySender() {
        return this.userBySender;
    }
    
    public void setUserBySender(User userBySender) {
        this.userBySender = userBySender;
    }

    public User getUserByReciver() {
        return this.userByReciver;
    }
    
    public void setUserByReciver(User userByReciver) {
        this.userByReciver = userByReciver;
    }

    public String getContext() {
        return this.context;
    }
    
    public void setContext(String context) {
        this.context = context;
    }

    public Timestamp getSendtime() {
        return this.sendtime;
    }
    
    public void setSendtime(Timestamp sendtime) {
        this.sendtime = sendtime;
    }

    public Integer getFlag() {
        return this.flag;
    }
    
    public void setFlag(Integer flag) {
        this.flag = flag;
    }
   








}