/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

public class Station {
    
    private String stationID;
    private String stationLoc;
    private String  stationName;

    public Station() {
    }

    public Station(String stationID, String stationLoc, String stationName) {
        this.stationID = stationID;
        this.stationLoc = stationLoc;
        this.stationName = stationName;
    }

    public String getStationID() {
        return stationID;
    }

    public void setStationID(String stationID) {
        this.stationID = stationID;
    }

    public String getStationLoc() {
        return stationLoc;
    }

    public void setStationLoc(String stationLoc) {
        this.stationLoc = stationLoc;
    }

    public String getStationName() {
        return stationName;
    }

    public void setStationName(String stationName) {
        this.stationName = stationName;
    }

    @Override
    public String toString() {
        return "station{" + "stationID=" + stationID + ", stationLoc=" + stationLoc + ", stationName=" + stationName + '}';
    }
        
}
