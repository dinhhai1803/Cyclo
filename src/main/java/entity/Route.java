/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author win
 */
public class Route {
    private String routeID;
    private String beginLocation;
    private String beginNumber;
    private String endLocation;
    private String endNumber;
    private int distance;
    private int esTime;
    private String routePrice;
    private String adID;
    private String routeImage;
    private String adName;

    public Route(String routeID, String beginLocation, String beginNumber, String endLocation, String endNumber, int distance, int esTime, String routePrice, String adID, String routeImage) {
        this.routeID = routeID;
        this.beginLocation = beginLocation;
        this.beginNumber = beginNumber;
        this.endLocation = endLocation;
        this.endNumber = endNumber;
        this.distance = distance;
        this.esTime = esTime;
        this.routePrice = routePrice;
        this.adID = adID;
        this.routeImage = routeImage;
    }

    public Route(String routeID, String beginNumber, String endNumber, int distance, String routePrice, String adName) {
        this.routeID = routeID;
        this.beginNumber = beginNumber;
        this.endNumber = endNumber;
        this.distance = distance;
        this.routePrice = routePrice;
        this.adName = adName;
    }
    
    

    public String getAdName() {
        return adName;
    }

    public void setAdName(String adName) {
        this.adName = adName;
    }
    
    
    

    public String getBeginLocation() {
        return beginLocation;
    }   

    public void setBeginLocation(String beginLocation) {
        this.beginLocation = beginLocation;
    }

    public String getBeginNumber() {
        return beginNumber;
    }

    public void setBeginNumber(String beginNumber) {
        this.beginNumber = beginNumber;
    }

    public String getEndLocation() {
        return endLocation;
    }

    public void setEndLocation(String endLocation) {
        this.endLocation = endLocation;
    }

    public String getEndNumber() {
        return endNumber;
    }

    public void setEndNumber(String endNumber) {
        this.endNumber = endNumber;
    }


    
    

    public Route() {
    }

    public String getRouteID() {
        return routeID;
    }

    public void setRouteID(String routeID) {
        this.routeID = routeID;
    }


    public int getDistance() {
        return distance;
    }

    public void setDistance(int distance) {
        this.distance = distance;
    }

    public int getEsTime() {
        return esTime;
    }

    public void setEsTime(int esTime) {
        this.esTime = esTime;
    }

    public String getRoutePrice() {
        return routePrice;
    }

    public void setRoutePrice(String routePrice) {
        this.routePrice = routePrice;
    }

    public String getAdID() {
        return adID;
    }

    public void setAdID(String adID) {
        this.adID = adID;
    }

    public String getRouteImage() {
        return routeImage;
    }

    public void setRouteImage(String routeImage) {
        this.routeImage = routeImage;
    }

    @Override
    public String toString() {
        return "Route{" + "routeID=" + routeID + ", beginLocation=" + beginLocation + ", beginNumber=" + beginNumber + ", endLocation=" + endLocation + ", endNumber=" + endNumber + ", distance=" + distance + ", esTime=" + esTime + ", routePrice=" + routePrice + ", adID=" + adID + ", routeImage=" + routeImage + '}';
    }


    
    
}
