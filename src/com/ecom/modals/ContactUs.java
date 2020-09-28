package com.ecom.modals;

public class ContactUs {
    private int ID;
    private String Name;
    private String Email;
    private String Subject;
    private String Message;
    private String datetime;
    private int seen;

    /**
     * @return the iD
     */
    public int getID() {
        return ID;
    }

    /**
     * @param iD the iD to set
     */
    public void setID(int iD) {
        ID = iD;
    }

    /**
     * @return the name
     */
    public String getName() {
        return Name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        Name = name;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return Email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        Email = email;
    }

    /**
     * @return the subject
     */
    public String getSubject() {
        return Subject;
    }

    /**
     * @param subject the subject to set
     */
    public void setSubject(String subject) {
        Subject = subject;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return Message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        Message = message;
    }

    /**
     * @return the datetime
     */
    public String getDatetime() {
        return datetime;
    }

    /**
     * @param datetime the datetime to set
     */
    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    /**
     * @return the seen
     */
    public int getSeen() {
        return seen;
    }

    /**
     * @param seen the seen to set
     */
    public void setSeen(int seen) {
        this.seen = seen;
    }

    /**
     * @param iD
     * @param name
     * @param email
     * @param subject
     * @param message
     * @param datetime
     * @param seen
     */
    public ContactUs(int iD, String name, String email, String subject, String message, String datetime, int seen) {
        ID = iD;
        Name = name;
        Email = email;
        Subject = subject;
        Message = message;
        this.datetime = datetime;
        this.seen = seen;
    }

    /**
     * 
     */
    public ContactUs() {
        ID = 0;
        Name = null;
        Email = null;
        Subject = null;
        Message = null;
        this.datetime = null;
        this.seen = 0;
    }

}
