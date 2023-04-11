/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import dao.DAO;
import entity.Route;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author win
 */
public class CalculateRoute {
    public static String CalTotal(String userSelectedRoutes){
        double distance = 0;
        double price= 0;
        double time = 0;
        String[] userSelected = userSelectedRoutes.split(",");
        try{
            DAO dao = new DAO();
            List<Route> routes = dao.getAllRoute();
            for(int i =0; i<userSelected.length - 1; i++){
                    for(Route route : routes){
                        if(route.getBeginNumber().equals(userSelected[i]) && route.getEndNumber().equals(userSelected[i+1])){
                            distance += route.getDistance();
                            price += Double.parseDouble(route.getRoutePrice());
                            time += route.getEsTime();
                        }
                    }
            }
            return distance + "," + price + "," + time;
        }
        catch(Exception e){
            System.out.println("Error in calculate Route : " + e.getMessage());
        }
        return null;
    }
    
    public static List<String> CalRouteDetail(String userSelectedRoute) throws Exception{
        List<String> routeIDDetail = new ArrayList<>();
        String[] selectedRouteArray = userSelectedRoute.split(",");
        for(int i = 0; i<selectedRouteArray.length - 1; i++){
            String routeID = "R" + selectedRouteArray[i] + selectedRouteArray[i+1];
                routeIDDetail.add(routeID);          
        }
        return routeIDDetail;
    }
    
    public static String GetCurrentDateTime(){
           DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
            LocalDateTime now = LocalDateTime.now();  
            return dtf.format(now);  
    }

    public static void main(String[] args) throws Exception {
        CalculateRoute cal = new CalculateRoute();
//        cal.CalTotal("1,2,5,7,8");
//            List<String> calID = cal.CalRouteDetail("1,2,5,7,8");
//            for(String i : calID){
//                System.out.println("ID " + i);
//            }
        System.out.println("Date : " + cal.GetCurrentDateTime());
    }
    
}
