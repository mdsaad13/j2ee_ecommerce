package com.ecom.modals;

public class Categories {
    private int ID;
    private String Name;
    private int IsActive;

    private int TotalProducts;
    private int ActiveProducts;

    public Categories() {
        ID = 0;
        Name = null;
        IsActive = 0;
        TotalProducts = 0;
        ActiveProducts = 0;
    }

    /**
     * @param iD
     * @param name
     * @param isActive
     * @param totalProducts
     * @param activeProducts
     */
    public Categories(int iD, String name, int isActive, int totalProducts, int activeProducts) {
        ID = iD;
        Name = name;
        IsActive = isActive;
        TotalProducts = totalProducts;
        ActiveProducts = activeProducts;
    }

    /**
     * @param iD
     * @param name
     * @param isActive
     */
    public Categories(int iD, String name, int isActive) {
        ID = iD;
        Name = name;
        IsActive = isActive;
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
     * @return the isActive
     */
    public int getIsActive() {
        return IsActive;
    }

    /**
     * @param isActive the isActive to set
     */
    public void setIsActive(int isActive) {
        IsActive = isActive;
    }

    /**
     * @return the totalProducts
     */
    public int getTotalProducts() {
        return TotalProducts;
    }

    /**
     * @param totalProducts the totalProducts to set
     */
    public void setTotalProducts(int totalProducts) {
        TotalProducts = totalProducts;
    }

    /**
     * @return the activeProducts
     */
    public int getActiveProducts() {
        return ActiveProducts;
    }

    /**
     * @param activeProducts the activeProducts to set
     */
    public void setActiveProducts(int activeProducts) {
        ActiveProducts = activeProducts;
    }
}
