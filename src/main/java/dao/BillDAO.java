/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Bill;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author win
 */
public class BillDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Bill> getFiveBillOfDriver(String id) {
        ArrayList<Bill> bl = new ArrayList<>();
        String query = "select top 5 * from bill where driverID = ? order by bill.Date desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                bl.add(new Bill(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6)
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
            rs = ps.executeQuery();
            while (rs.next()) {
                bl.add(new Bill(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6)
                ));
            }
        } catch (Exception e) {
            System.out.println("Error");
        }
        return bl;
    }

    public ArrayList<Bill> getAllBill() {
        ArrayList<Bill> bl = new ArrayList<>();
        String query = "select * from bill";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                bl.add(new Bill(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6)
                ));
            }
        } catch (Exception e) {
            System.out.println("Error");
        }
        return bl;
    }
    
        public Bill getBillBy(String id) {
        String query = "select * from bill where detailID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if(rs.next())
            {
                return new Bill(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6)
                );
            }
        } catch (Exception e) {
            System.out.println("bill dao: " + e.getMessage());
        }
        return null;
    }
        
        
        public Bill getBillByAD(String id) {
        String query = "select * from bill where detailID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if(rs.next())
            {
                return new Bill(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6)
                );
            }
        } catch (Exception e) {
            System.out.println("bill dao: " + e.getMessage());
        }
        return null;
    }


    public static void main(String[] args) {
        BillDAO dao = new BillDAO();
//        for(Bill i : dao.getAllBillOfDriver("D1")){
//            System.out.println("Driver : " + i);
//        }
//        System.out.println("Bill : " + dao.getBillBy("BD36"));
        for(Bill i : dao.getAllBill()){
            System.out.println("Bill :  " + i);
        }
    }
}
