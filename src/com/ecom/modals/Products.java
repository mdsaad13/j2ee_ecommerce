package com.ecom.modals;

public class Products {
    private int ID;
    private int CatID;
    private String Title;
    private String Description;
    private String Image;
    private int IsActive;
    private int IsFeatured;
    private int Quantity;
    private Double Price;
    private String CategoryName;

    public Products() {
        ID = 0;
        CatID = 0;
        Title = null;
        Description = null;
        Image = null;
        IsActive = 0;
        IsFeatured = 0;
        Quantity = 0;
        Price = 0.0;
        CategoryName = null;
    }

    /**
     * @param iD
     * @param catID
     * @param title
     * @param description
     * @param image
     * @param isActive
     * @param isFeatured
     * @param quantity
     * @param price
     */
    public Products(int iD, int catID, String title, String description, String image, int isActive, int isFeatured,
            int quantity, Double price) {
        ID = iD;
        CatID = catID;
        Title = title;
        Description = description;
        Image = image;
        IsActive = isActive;
        IsFeatured = isFeatured;
        Quantity = quantity;
        Price = price;
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
     * @return the catID
     */
    public int getCatID() {
        return CatID;
    }

    /**
     * @param catID the catID to set
     */
    public void setCatID(int catID) {
        CatID = catID;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return Title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        Title = title;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return Description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        Description = description;
    }

    /**
     * @return the image
     */
    public String getImage() {
        return Image;
    }

    /**
     * @param image the image to set
     */
    public void setImage(String image) {
        Image = image;
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
     * @return the isFeatured
     */
    public int getIsFeatured() {
        return IsFeatured;
    }

    /**
     * @param isFeatured the isFeatured to set
     */
    public void setIsFeatured(int isFeatured) {
        IsFeatured = isFeatured;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return Quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        Quantity = quantity;
    }

    /**
     * @return the price
     */
    public Double getPrice() {
        return Price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(Double price) {
        Price = price;
    }

    /**
     * @param iD
     * @param catID
     * @param title
     * @param description
     * @param image
     * @param isActive
     * @param isFeatured
     * @param quantity
     * @param price
     * @param categoryName
     */
    public Products(int iD, int catID, String title, String description, String image, int isActive, int isFeatured,
            int quantity, Double price, String categoryName) {
        ID = iD;
        CatID = catID;
        Title = title;
        Description = description;
        Image = image;
        IsActive = isActive;
        IsFeatured = isFeatured;
        Quantity = quantity;
        Price = price;
        CategoryName = categoryName;
    }

    /**
     * @return the categoryName
     */
    public String getCategoryName() {
        return CategoryName;
    }

    /**
     * @param categoryName the categoryName to set
     */
    public void setCategoryName(String categoryName) {
        CategoryName = categoryName;
    }

}
