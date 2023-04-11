/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author win
 */
public class Driver {
    private String driverID;
    private String driverName;
    private String driverPass;
    private String driverIMail;
    private String driverIPhone;
    private String driverAvatar;
    private String driverCCCD;
    private int driverGender;
    private int driverStatus;
    private String currentStation;
    private int isActive;
    private String driverUserName;

    public Driver() {
    }

    public Driver(String driverID, String driverName, String driverPass, String driverIMail, String driverIPhone, String driverAvatar, String driverCCCD, int driverGender, int driverStatus, String currentStation, int isActive, String driverUserName) {
        this.driverID = driverID;
        this.driverName = driverName;
        this.driverPass = driverPass;
        this.driverIMail = driverIMail;
        this.driverIPhone = driverIPhone;
        this.driverAvatar = driverAvatar;
        this.driverCCCD = driverCCCD;
        this.driverGender = driverGender;
        this.driverStatus = driverStatus;
        this.currentStation = currentStation;
        this.isActive = isActive;
        this.driverUserName = driverUserName;
    }

    public String getDriverID() {
        return driverID;
    }

    public void setDriverID(String driverID) {
        this.driverID = driverID;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public String getDriverPass() {
        return driverPass;
    }

    public void setDriverPass(String driverPass) {
        this.driverPass = driverPass;
    }

    public String getDriverIMail() {
        return driverIMail;
    }

    public void setDriverIMail(String driverIMail) {
        this.driverIMail = driverIMail;
    }

    public String getDriverIPhone() {
        return driverIPhone;
    }

    public void setDriverIPhone(String driverIPhone) {
        this.driverIPhone = driverIPhone;
    }

    public String getDriverAvatar() {
        return driverAvatar;
    }

    public void setDriverAvatar(String driverAvatar) {
        this.driverAvatar = driverAvatar;
    }

    public String getDriverCCCD() {
        return driverCCCD;
    }

    public void setDriverCCCD(String driverCCCD) {
        this.driverCCCD = driverCCCD;
    }

    public int getDriverGender() {
        return driverGender;
    }

    public void setDriverGender(int driverGender) {
        this.driverGender = driverGender;
    }

    public int getDriverStatus() {
        return driverStatus;
    }

    public void setDriverStatus(int driverStatus) {
        this.driverStatus = driverStatus;
    }

    public String getCurrentStation() {
        return currentStation;
    }

    public void setCurrentStation(String currentStation) {
        this.currentStation = currentStation;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    public String getDriverUserName() {
        return driverUserName;
    }

    public void setDriverUserName(String driverUserName) {
        this.driverUserName = driverUserName;
    }

    @Override
    public String toString() {
        return "Driver{" + "driverID=" + driverID + ", driverName=" + driverName + ", driverPass=" + driverPass + ", driverIMail=" + driverIMail + ", driverIPhone=" + driverIPhone + ", driverAvatar=" + driverAvatar + ", driverCCCD=" + driverCCCD + ", driverGender=" + driverGender + ", driverStatus=" + driverStatus + ", currentStation=" + currentStation + ", isActive=" + isActive + ", driverUserName=" + driverUserName + '}';
    }
    
    
}
