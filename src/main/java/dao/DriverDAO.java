package dao;

import context.DBContext;
import java.util.*;
import java.sql.*;
import entity.Driver;

public class DriverDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Driver> getAllDriver() {
        ArrayList<Driver> dl = new ArrayList<>();
        String query = "select * from driver";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                dl.add(new Driver(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),                       
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception ex) {

        }
        return dl;
    }
    
    public Driver getAllDriverByID(String ID) {
        String query = "select * from driver where driverID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Driver(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12)
                );
            }
        } catch (Exception ex) {

        }
        return null;
    }
    
    public void updateDriverStation(String id, String stationID) {
        String query = "update Driver set CurrentStation = ? where driverID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, stationID);
            ps.setString(2, id);

            ps.executeUpdate();
        } catch (Exception ex) {

        }
    }


    public Driver getDriverBy(String acc, String pass) {
        String query = "select * from driver where driverUserName = ? and driverPass = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, acc);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Driver(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12)
                );
            }
        } catch (Exception ex) {

        }
        return null;
    }
    
        public Driver getDriverInfo(String id) {
        String query = "select * from driver where driverID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Driver(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12)
                );
            }
        } catch (Exception ex) {

        }
        return null;
    }
        
    public void updateDriverStatus(String ID){
        String query = "update driver \n" +
                                "set isActive = 0\n" +
                                "where driverID = ? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ID);
            int rs = ps.executeUpdate();
        }
        catch(Exception e){
            System.out.println("Error in Driver DAO " + e.getMessage());
        }
    }

    public void updateDriver(String id, String name, String username, String password, String email, String phone, String avatar, boolean gender) {
        String query = "update Driver set driverName = ?, driverUserName = ?, driverPass = ?, driverMail = ?, driverPhone = ?, driverAvatar = ?,  driverGender= ? where driverID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, avatar);
            ps.setInt(7, (gender) ? 1 : 0);
            ps.setString(8, id);
            
            ps.executeUpdate();
        } catch (Exception ex) {

        }
    }
    
   
        public void updateDriver(String id, String name, String email, String phone, boolean gender, String CCCD) {
        String query = "update Driver set driverName = ?, driverMail = ?, driverPhone = ?, driverCCCD = ?,  driverGender= ? where driverID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, CCCD);
            ps.setBoolean(5, gender);
            ps.setString(6, id);

            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println("update error");
        }
    }


    
    public void deleteDriver(String id, boolean status) {
        String query = "update Driver set isActive = ? where driverID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setBoolean(1, status);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (Exception ex) {

        }
    }
    
    public void addDriver(Driver driver) {
        String query = "insert into driver values(?,?,?,?,?,?,?,?,1,'ST1',1, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, driver.getDriverID());
            ps.setString(2, driver.getDriverName());
            ps.setString(3, driver.getDriverPass());
            ps.setString(4, driver.getDriverIMail());
            ps.setString(5, driver.getDriverIPhone());
            ps.setString(6, driver.getDriverAvatar());
            ps.setString(7, driver.getDriverCCCD());
            ps.setInt(8, driver.getDriverGender());
            ps.setString(9, driver.getDriverUserName());
            
            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Driver Add Error " + ex.getMessage());
        }
    }



    
    public static void main(String[] args) {
        DriverDAO dao = new DriverDAO();
//        System.out.println("Driver " + dao.getDriverInfo("D1"));
        for(Driver d : dao.getAllDriver()){
            System.out.println("Driver : " + d);
        }
    }
}
