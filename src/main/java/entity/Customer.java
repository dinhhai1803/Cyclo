/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

public class Customer {

    private String cusID;
    private String cusName;
    private String cusMail;
    private String cusUserName;
    private String cusPass;
    private String cusPhone;

    public Customer() {
    }

    public Customer(String cusID, String cusName, String cusMail, String cusPass, String cusPhone, String cusUserName) {
        this.cusID = cusID;
        this.cusName = cusName;
        this.cusMail = cusMail;
        this.cusPass = cusPass;
        this.cusPhone = cusPhone;
        this.cusUserName = cusUserName;
    }

    public String getCusID() {
        return cusID;
    }

    public void setCusID(String cusID) {
        this.cusID = cusID;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getCusMail() {
        return cusMail;
    }

    public void setCusMail(String cusMail) {
        this.cusMail = cusMail;
    }

    public String getCusPass() {
        return cusPass;
    }

    public String getCusUserName() {
        return cusUserName;
    }

    public void setCusUserName(String cusUserName) {
        this.cusUserName = cusUserName;
    }

    public void setCusPass(String cusPass) {
        this.cusPass = cusPass;
    }

    public String getCusPhone() {
        return cusPhone;
    }

    public void setCusPhone(String cusPhone) {
        this.cusPhone = cusPhone;
    }

    @Override
    public String toString() {
        return "Customer{" + "cusID=" + cusID + ", cusName=" + cusName + ", cusMail=" + cusMail + ", cusUserName=" + cusUserName + ", cusPass=" + cusPass + ", cusPhone=" + cusPhone + '}';
    }

}
