package com.ecom.modals;

public class Cart {
    private int ID;
    private int UserID;
    private int ProdID;

    public Cart() {
        ID = 0;
        UserID = 0;
        ProdID = 0;
    }

    /**
     * @param iD
     * @param userID
     * @param prodID
     */
    public Cart(int iD, int userID, int prodID) {
        ID = iD;
        UserID = userID;
        ProdID = prodID;
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

}
