/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;


public class Bill {
    private String billID;
    private String cusID;
    private String driverID;
    private String detailID;
    private double total;
    private String Date;

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }
    
    

    public String getBillID() {
        return billID;
    }

    public void setBillID(String billID) {
        this.billID = billID;
    }

    public String getCusID() {
        return cusID;
    }

    public void setCusID(String cusID) {
        this.cusID = cusID;
    }

    public String getDriverID() {
        return driverID;
    }

    public void setDriverID(String driverID) {
        this.driverID = driverID;
    }

    public String getDetailID() {
        return detailID;
    }

    public void setDetailID(String detailID) {
        this.detailID = detailID;
    }

    public Bill(String billID, String cusID, String driverID, String detailID, double total, String Date) {
        this.billID = billID;
        this.cusID = cusID;
        this.driverID = driverID;
        this.detailID = detailID;
        this.total = total;
        this.Date = Date;
    }


    

    @Override
    public String toString() {
        return "Bill{" + "billID=" + billID + ", cusID=" + cusID + ", driverID=" + driverID + ", detailID=" + detailID + '}';
    }
    
    
}
