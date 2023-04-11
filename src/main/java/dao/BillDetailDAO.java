package dao;

import java.util.*;
import java.sql.*;
import entity.*;
import context.DBContext;
import entity.BillDetail;

public class BillDetailDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<BillDetail> getDetailOf(String id) {
        String query = "select * from billdetail where detailID = ? order by [order] asc";
        try {
            ArrayList<BillDetail> list = new ArrayList<>();
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add( new BillDetail(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3)
                ));
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error");
        }
        return null;
    }
    
    public static void main(String[] args) {
        BillDetailDAO dao = new BillDetailDAO();
        for(BillDetail i : dao.getDetailOf("BD10")){
            System.out.println("Bill : " + i);
        }
    }
}
