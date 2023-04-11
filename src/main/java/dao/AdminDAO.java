package dao;

import context.*;
import java.util.*;
import java.sql.*;
import entity.*;

public class AdminDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Admin getAdminBy(String acc, String pass) {
        String query = "select * from admin where adminUserName = ? and adPass = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, acc);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Admin(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
            }
        } catch (Exception ex) {

        }
        return null;
    }
    
    public Admin getAdminInfo(String id) {
        String query = "select * from admin where adID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Admin(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void updateAccountAdmin(String id, Admin ad) {
        String query = "update admin set adName = ?, adminUserName = ?, adPass=?, adMail=?, adPhone=?, adAvatar = ? where adID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            ps.setString(1, ad.getAdName());
            ps.setString(2, ad.getAdUserName());
            ps.setString(3, ad.getAdPass());
            ps.setString(4, ad.getAdMail());
            ps.setString(5, ad.getAdPhone());
            ps.setString(6, ad.getAdAvatar());
            ps.setString(7, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}
