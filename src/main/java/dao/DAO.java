/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Model.Station;
import context.DBContext;
import entity.Bill;
import entity.Driver;
import entity.Place;
import entity.Route;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import services.CalculateRoute;

/**
 *
 * @author win
 */
public class DAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet result;
    
    public List<Route> getAllRoute()  throws Exception{
        try {
            String sql = "select distinct t1.routeID, t1.Location as beginLocation, t1.stationName as beginNumber,  t2.Location as endLocation, t2.stationName as endNumber, t1.distance," +
                            " t1.esTime, t1.routePrice, t1.adID, t1.routeImage" +
                            " from (select * from " +
                            " route as r inner join station as s" +
                            " on r.routeBegin = s.stationID ) as t1 inner join" +
                            " (select * from " +
                            " route as r inner join station as s " +
                            " on r.routeEnd = s.stationID ) as t2 on t1.routeID = t2.routeID";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            result = ps.executeQuery();
            List<Route> routes = new ArrayList<Route>();
            while(result.next()){
                if(result.getString(1).equals("R5"))
                    System.out.println("Route R5");
                else
                    routes.add(new Route(result.getString(1), result.getString(2), result.getString(3), result.getString(4) , result.getString(5), result.getInt(6), result.getInt(7), result.getString(8),result.getString(9),result.getString(10)));
            }
            return routes;
        } catch (Exception e) {
            System.out.println("Error in dao : " + e.getMessage());
        }
        return null;
    }
    
    public List<Route> getRoutesAdmin(){
          try {
            String sql = "select routeID, routeBegin, routeEnd, distance, routePrice, adName\n" +
                    "from Route inner join admin on Route.adID = admin.adID";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            result = ps.executeQuery();
            List<Route> routes = new ArrayList<Route>();
            while(result.next()){
//                String routeID, String beginNumber, String endNumber, int distance, String routePrice, String adName
                routes.add(new Route(result.getString(1), result.getString(2), result.getString(3), result.getInt(4) , result.getString(5), result.getString(6)));
            }
            return routes;
        } catch (Exception e) {
            System.out.println("Error in dao : " + e.getMessage());
        }
        return null;
    }
    
    public int updateStation(String ID, String Location){
                  try {
            String sql = "update station\n" +
                                "set Location = ?\n" +
                                "where stationID = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, Location);
            ps.setString(2, ID);
            int rs = ps.executeUpdate();
            return rs;
        } catch (Exception e) {
            System.out.println("Error in dao : " + e.getMessage());
        }
        return 0;
    }
    
        public int updateRoute(String ID, String distance, String price, String adID){
                  try {
            String sql = "update route\n" +
                                "set distance = ?, routePrice = ? , adID = ?\n" +
                                "where routeID = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, distance);
            ps.setString(2, price);
            ps.setString(3, adID);
            ps.setString(4, ID);
            int rs = ps.executeUpdate();
            return rs;
        } catch (Exception e) {
            System.out.println("Error in dao : " + e.getMessage());
        }
        return 0;
    }
    
        public List<Route> getPagingRoute(int page)  throws Exception{
        try {
            String sql = "select distinct t1.routeID, t1.Location as beginLocation, t1.stationName as beginNumber,  t2.Location as endLocation, t2.stationName as endNumber, t1.distance," +
                            " t1.esTime, t1.routePrice, t1.adID, t1.routeImage" +
                            " from (select * from " +
                            " route as r inner join station as s" +
                            " on r.routeBegin = s.stationID ) as t1 inner join" +
                            " (select * from " +
                            " route as r inner join station as s " +
                            " on r.routeEnd = s.stationID ) as t2 on t1.routeID = t2.routeID" + 
                            " order by t1.routeID" +
                           " offset ? rows fetch next 3 rows only";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 3 );
            result = ps.executeQuery();
            List<Route> routes = new ArrayList<Route>();
            while(result.next()){
                routes.add(new Route(result.getString(1), result.getString(2), result.getString(3), result.getString(4) , result.getString(5), result.getInt(6), result.getInt(7), result.getString(8),result.getString(9),result.getString(10)));
            }
            return routes;
        } catch (Exception e) {
            System.out.println("Error in dao : " + e.getMessage());
        }
        return null;
    }
    
    public int getTotalRoutes() throws Exception{
        return this.getAllRoute().size();
    }
    
    public HashMap<Route, List<Place>> getRouteDetail(String routeID){
        try{
            String sql = "select distinct tb1.routeID, tb1.beginLocation, tb1.beginNumber,  tb1.endLocation, tb1.endNumber, tb1.distance, tb1.esTime, tb1.routePrice, tb1.adID, tb1.routeImage, tb2.placeID, tb2.placeName, tb2.placeLocation, tb2.placeImage, tb2.typeName\n" +
                                "from\n" +
                                "	(select distinct t1.routeID, t1.Location as beginLocation, t1.stationName as beginNumber,  t2.Location as endLocation, t2.stationName as endNumber, t1.distance,\n" +
                                "				t1.esTime, t1.routePrice, t1.adID, t1.routeImage\n" +
                                "	from (select * from \n" +
                                "		route as r inner join station as s \n" +
                                "		on r.routeBegin = s.stationID ) as t1 inner join\n" +
                                "		(select * from \n" +
                                "		route as r inner join station as s \n" +
                                "		on r.routeEnd = s.stationID ) as t2 on t1.routeID = t2.routeID) as tb1 \n" +
                                "		inner join\n" +
                                "	(select distinct p.placeID, p.routeID, p.placeName,  t.typeName, p.placeLocation, p.placeImage\n" +
                                "	from place as p inner join type as t on p.typeID = t.typeID ) as tb2\n" +
                                "	on tb1.routeID = tb2.routeID\n" +
                                "where tb1.routeID = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, routeID);
            result = ps.executeQuery();
            Route route = new Route();
            List<Place> places = new ArrayList<Place>();
            while(result.next()){
                route = new Route(result.getString(1), result.getString(2), result.getString(3), result.getString(4) , result.getString(5), result.getInt(6), result.getInt(7), result.getString(8),result.getString(9),result.getString(10));
                places.add(new Place(result.getString(11), result.getString(12), result.getString(13), result.getString(14), result.getString(15)));
            }
            HashMap<Route, List<Place>> routeDetail = new HashMap<>();
            routeDetail.put(route, places);
            return routeDetail;
        }
        catch(Exception e){
            System.out.println("Error in getRouteDetail of Dao : " + e.getMessage());
        }
        return null;
    }
    
    public HashMap<Route, Place> searchRoute(String place, int page){
        try{
            String sql = "select distinct tb1.routeID, tb1.beginLocation, tb1.beginNumber,  tb1.endLocation, tb1.endNumber, tb1.distance, tb1.esTime, tb1.routePrice, tb1.adID, tb1.routeImage, tb2.placeID, tb2.placeName, tb2.placeLocation, tb2.placeImage, tb2.typeName\n" +
                                " from\n" +
                                "	(select distinct t1.routeID, t1.Location as beginLocation, t1.stationName as beginNumber,  t2.Location as endLocation, t2.stationName as endNumber, t1.distance,\n" +
                                "				t1.esTime, t1.routePrice, t1.adID, t1.routeImage\n" +
                                "	from (select * from \n" +
                                "		route as r inner join station as s \n" +
                                "		on r.routeBegin = s.stationID ) as t1 inner join\n" +
                                "		(select * from \n" +
                                "		route as r inner join station as s \n" +
                                "		on r.routeEnd = s.stationID ) as t2 on t1.routeID = t2.routeID) as tb1 \n" +
                                "		inner join\n" +
                                "	(select distinct p.placeID, p.routeID, p.placeName,  t.typeName, p.placeLocation, p.placeImage\n" +
                                "	from place as p inner join type as t on p.typeID = t.typeID ) as tb2\n" +
                                "	on tb1.routeID = tb2.routeID\n" +
                                " where tb2.placeName LIKE ?"
                                + " order by tb1.routeID "
                                + " offset ? rows fetch next 3 rows only ";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + place + "%");
            ps.setInt(2, (page - 1) * 3 );
            result = ps.executeQuery();
            Route searchedRoute = new Route();
            Place searchedPlace = new Place();
            HashMap<Route, Place> searched = new HashMap<>();
            while(result.next()){
                searchedRoute = new Route(result.getString(1), result.getString(2), result.getString(3), result.getString(4) , result.getString(5), result.getInt(6), result.getInt(7), result.getString(8),result.getString(9),result.getString(10));
                searchedPlace = new Place(result.getString(11), result.getString(12), result.getString(13), result.getString(14), result.getString(15));
                searched.put(searchedRoute, searchedPlace);
            }

            return searched;
        }
        catch(Exception e){
            System.out.println("Error in searchRoute of Dao : " + e.getMessage());
        }
        return null;
    }
    
     public List<Driver> getPagingDriver(int amount, String currentStation)  throws Exception{
        try {
            String sql = "select * from driver\n" +
                                "where CurrentStation = ?\n" +
                                "order by CurrentStation\n" +
                                "offset ? rows fetch next 2 rows only";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, currentStation );
            ps.setInt(2, amount );
            result = ps.executeQuery();
            List<Driver> drivers = new ArrayList<Driver>();
            while(result.next()){
                drivers.add(new Driver(result.getString(1), result.getString(2), result.getString(3), result.getString(4), result.getString(5), result.getString(6), result.getString(7), result.getByte(8), result.getByte(9), result.getString(10), result.getByte(11), result.getString(12)));
            }
            return drivers;
        } catch (Exception e) {
            System.out.println("Error in dao : " + e.getMessage());
        }
        return null;
    }
     
     public int getNumberOfDriversAtRoute( String station)  throws Exception{
        try {
            int count = 0;
            String sql = "select * from driver\n" +
                        "where CurrentStation = ? and driverStatus = 1";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, station );
            result = ps.executeQuery();
            while(result.next()){
                count++;
            }
            return count;
        } catch (Exception e) {
            System.out.println("Error in dao : " + e.getMessage());
        }
        return 0;
    }
     
     public int getNumberBillDetails()  throws Exception{
        try {
            int count = 0;
            String sql = "select * from billdetail";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            result = ps.executeQuery();
            while(result.next()){
                count++;
            }
            return count;
        } catch (Exception e) {
            System.out.println("Error in dao : " + e.getMessage());
        }
        return 0;
    }
     
          public int getNumberBills()  throws Exception{
        try {
            int count = 0;
            String sql = "select * from bill";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            result = ps.executeQuery();
            while(result.next()){
                count++;
            }
            return count;
        } catch (Exception e) {
            System.out.println("Error in dao : " + e.getMessage());
        }
        return 0;
    }
     
     public String InsertBillDetail(String selectedRoutes) throws Exception{
         CalculateRoute cal = new CalculateRoute();
         List<String> routeIDDetail = cal.CalRouteDetail(selectedRoutes);
         int existedBillDetail = getNumberBillDetails();
         int count = 1;
         for(String id : routeIDDetail){
             try{
                 String sql = "Insert into billdetail values(?, ?, ?)";
                 conn = new DBContext().getConnection();
                 ps = conn.prepareStatement(sql);
                 ps.setString(1, "BD" + existedBillDetail );
                 ps.setString(2, id);
                 ps.setInt(3, count++);
                 ps.executeUpdate();
             }
             catch(Exception e){
                 System.out.println("Error in Insert Bill Detail " + e.getMessage());
             }
         }
         return "BD" + existedBillDetail;
     }
     
     public void InsertBill(String cusID, String driverID, String detailID, double total) throws Exception{
         CalculateRoute cal = new CalculateRoute();
         String date = cal.GetCurrentDateTime();
         int existedBill = getNumberBills();
         try{
             String sql = "insert into bill\n" +
                            "values(?, ?, ?, ?, ?, ?)";
                 ps = conn.prepareStatement(sql);
                 ps.setString(1, "B" + existedBill );
                 ps.setString(2, cusID);
                 ps.setString(3, driverID);
                 ps.setString(4, detailID);
                 ps.setDouble(5, total);
                 ps.setString(6, date);
                 ps.executeUpdate();
         }
         catch(Exception e){
             System.out.println("Error in Insert Bill : " + e.getMessage());
         }
     }
     
         public ArrayList<Bill> getAllBill() {
        ArrayList<Bill> bl = new ArrayList<>();
        String query = "select * from bill";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            result = ps.executeQuery();
            while (result.next()) {
                bl.add(new Bill(
                        result.getString(1),
                        result.getString(2),
                        result.getString(3),
                        result.getString(4),
                        result.getDouble(5),
                        result.getString(6)
                ));
            }
        } catch (Exception e) {
            System.out.println("Error");
        }
        return bl;
    }
         
         public ArrayList<Bill> getAllBillOfDriver(String id) {
        ArrayList<Bill> bl = new ArrayList<>();
        String query = "select * from bill where driverID = ? order by bill.Date asc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            result = ps.executeQuery();
            while (result.next()) {
                bl.add(new Bill(
                        result.getString(1),
                        result.getString(2),
                        result.getString(3),
                        result.getString(4),
                        result.getDouble(5),
                        result.getString(6)
                ));
            }
        } catch (Exception e) {
            System.out.println("Error");
        }
        return bl;
    }
         
         public ArrayList<Station> getAllStation() {
        ArrayList<Station> stations = new ArrayList<>();
        String query = "select * from station";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            result = ps.executeQuery();
            while(result.next())
            {
                stations.add(new Station(
                        result.getString(1),
                        result.getString(2),
                        result.getString(3)
                ));
            }
        } catch (Exception e) {
            System.out.println("Error");
        }
        return stations;
    }
    
    public static void main(String[] args) throws Exception {
        DAO dao = new DAO();
//        HashMap<Route, List<Place>> routeDetail = dao.getRouteDetail("R14");
//        Route route = new Route();
//        List<Place> places = new ArrayList<Place>();
        for(Route i : dao.getRoutesAdmin()){
            System.out.println("Route : " + i);
        }       
//        places = routeDetail.get(route);
//        
//        System.out.println("Route : " + route);
//        for(Place i : places){
//            System.out.println("Place : " + i);
//        }

//        for(Driver i : dao.getPagingDriver(0, "ST1")){
//            System.out.println(i.toString());
//        }
        //System.out.println("Number of routes : " + dao.getTotalRoutes() );
        
//        for(Route route : dao.getAllRoute()){
//            System.out.println("Route : " + route.toString());
//        }

//        HashMap<Route, Place> search = dao.searchRoute("Hoi An", 1);
//        List<Route> routes = new ArrayList<Route>();
//        List<Place> places = new ArrayList<Place>();
//        
//        for(Route i : search.keySet() ){
//            System.out.println("Route : " + i.toString());
//            System.out.println("Place : " + search.get(i).toString());
//        }
//
//        for(Bill i : dao.getAllBillOfDriver("D1")){
//            System.out.println("Bill : " + i);
//        }

       for(Station i : dao.getAllStation()){
            System.out.println("Station : " + i);
        }
        //dao.InsertBill("KH1", "D1", "BD1", 3000);

    }
}
