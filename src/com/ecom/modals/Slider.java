package com.ecom.modals;

public class Slider {
    private int ID;
    private String Title;
    private String Image;
    private String Redirect;

    public Slider() {
        ID = 0;
        Title = null;
        Image = null;
        Redirect = null;
    }

    /**
     * @param iD
     * @param title
     * @param image
     * @param redirect
     */
    public Slider(int iD, String title, String image, String redirect) {
        ID = iD;
        Title = title;
        Image = image;
        Redirect = redirect;
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
     * @return the redirect
     */
    public String getRedirect() {
        return Redirect;
    }

    /**
     * @param redirect the redirect to set
     */
    public void setRedirect(String redirect) {
        Redirect = redirect;
    }

}
