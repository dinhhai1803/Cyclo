/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author win
 */
public class Place {
    private String placeID;
    private String placeName;
    private String placeLocation;
    private String placeImage;
    private String placeType;

    public Place() {
    }

    public Place(String placeID, String placeName, String placeLocation, String placeImage, String placeType) {
        this.placeID = placeID;
        this.placeName = placeName;
        this.placeLocation = placeLocation;
        this.placeImage = placeImage;
        this.placeType = placeType;
    }
    
    

    public String getPlaceID() {
        return placeID;
    }

    public void setPlaceID(String placeID) {
        this.placeID = placeID;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public String getPlaceLocation() {
        return placeLocation;
    }

    public void setPlaceLocation(String placeLocation) {
        this.placeLocation = placeLocation;
    }

    public String getPlaceImage() {
        return placeImage;
    }

    public void setPlaceImage(String placeImage) {
        this.placeImage = placeImage;
    }

    public String getPlaceType() {
        return placeType;
    }

    public void setPlaceType(String placeType) {
        this.placeType = placeType;
    }

    @Override
    public String toString() {
        return "Place{" + "placeID=" + placeID + ", placeName=" + placeName + ", placeLocation=" + placeLocation + ", placeImage=" + placeImage + ", placeType=" + placeType + '}';
    }
    
    
}
