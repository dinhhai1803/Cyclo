/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;


public class BillDetail {
    private String detailID;
    private String routeID;
    private int orderOfRoute;

    public String getDetailID() {
        return detailID;
    }

    public void setDetailID(String detailID) {
        this.detailID = detailID;
    }

    public String getRouteID() {
        return routeID;
    }

    public void setRouteID(String routeID) {
        this.routeID = routeID;
    }

    public int getOrderOfRoute() {
        return orderOfRoute;
    }

    public void setOrderOfRoute(int orderOfRoute) {
        this.orderOfRoute = orderOfRoute;
    }

    public BillDetail(String detailID, String routeID, int orderOfRoute) {
        this.detailID = detailID;
        this.routeID = routeID;
        this.orderOfRoute = orderOfRoute;
    }

    @Override
    public String toString() {
        return "BillDetail{" + "detailID=" + detailID + ", routeID=" + routeID + ", orderOfRoute=" + orderOfRoute + '}';
    }



    
}
