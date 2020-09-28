package com.ecom.modals;

public class Order {
    private int ID;
    private int UserID;
    private int ProdID;
    private int Status;
    private String Created_at;
    private String Updated_at;

    public Order() {
        ID = 0;
        UserID = 0;
        ProdID = 0;
        Status = 0;
        Created_at = null;
        Updated_at = null;
    }

    /**
     * @param iD
     * @param userID
     * @param prodID
     * @param status
     * @param created_at
     * @param updated_at
     */
    public Order(int iD, int userID, int prodID, int status, String created_at, String updated_at) {
        ID = iD;
        UserID = userID;
        ProdID = prodID;
        Status = status;
        Created_at = created_at;
        Updated_at = updated_at;
    }

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
     * @return the userID
     */
    public int getUserID() {
        return UserID;
    }

    /**
     * @param userID the userID to set
     */
    public void setUserID(int userID) {
        UserID = userID;
    }

    /**
     * @return the prodID
     */
    public int getProdID() {
        return ProdID;
    }

    /**
     * @param prodID the prodID to set
     */
    public void setProdID(int prodID) {
        ProdID = prodID;
    }

    /**
     * @return the status
     */
    public int getStatus() {
        return Status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(int status) {
        Status = status;
    }

    /**
     * @return the created_at
     */
    public String getCreated_at() {
        return Created_at;
    }

    /**
     * @param created_at the created_at to set
     */
    public void setCreated_at(String created_at) {
        Created_at = created_at;
    }

    /**
     * @return the updated_at
     */
    public String getUpdated_at() {
        return Updated_at;
    }

    /**
     * @param updated_at the updated_at to set
     */
    public void setUpdated_at(String updated_at) {
        Updated_at = updated_at;
    }

}
