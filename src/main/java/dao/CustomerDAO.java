/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.util.*;
import java.sql.*;
import entity.*;

public class CustomerDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Customer getCustomerBy(String acc, String pass) {
        String query = "select * from customer where cusUserName = ? and cusPass = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, acc);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Customer(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                );
            }
        } catch (Exception ex) {
            System.out.println("Error in customer Dao : " + ex.getMessage());
        }
        return null;
    }
    
        public Customer getCustomerByID(String ID) {
        String query = "select * from customer where cusID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Customer(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                );
            }
        } catch (Exception ex) {
            System.out.println("Error in customer Dao : " + ex.getMessage());
        }
        return null;
    }
    
    public static void main(String[] args) {
        CustomerDAO dao  = new CustomerDAO();
        for(Customer cus : dao.getAllCustomer()){
            System.out.println("Customer :  " + cus);
        }
    }

    public ArrayList<Customer> getAllCustomer() {
        ArrayList<Customer> cl = new ArrayList<>();
        String query = "select * from customer";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                cl.add(new Customer(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                ));
            }
        } catch (Exception ex) {

        }
        return cl;
    }


    public void addCustomer(String id, String name, String mail, String pass, String phone, String user) {
        String query = "insert into customer values (?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, mail);
            ps.setString(6, user);
            ps.setString(4, pass);
            ps.setString(5, phone);

            rs = ps.executeQuery();
        } catch (Exception e) {

        }
    }
    
    

    public Customer getInforBy(String id) {
        String query = "select * from Customer where cusID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                );
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Customer updateAccount(String id, Customer cus) {
        String query = "update Customer set cusName = ?, cusMail = ?, cusUserName=?, cusPass=?, cusPhone=? where cusID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            ps.setString(1, cus.getCusName());
            ps.setString(2, cus.getCusMail());
            ps.setString(3, cus.getCusUserName());
            ps.setString(4, cus.getCusPass());
            ps.setString(5, cus.getCusPhone());
            ps.setString(6, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

}
