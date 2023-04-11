/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Model.Station;
import context.DBContext;
import java.util.*;
import java.sql.*;
import entity.*;

public class StationDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Station> getAllStation() {
        ArrayList<Station> stations = new ArrayList<>();
        String query = "select * from station";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next())
            {
                stations.add(new Station(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3)
                ));
            }
        } catch (Exception e) {
            System.out.println("Error");
        }
        return stations;
    }
    
    public static void main(String[] args) {
        StationDAO dao = new StationDAO();
        for(Station i : dao.getAllStation()){
            System.out.println("Station : " + i);
        }
    }
}
