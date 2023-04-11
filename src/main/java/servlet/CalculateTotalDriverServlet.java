/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DAO;
import entity.Driver;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author win
 */
@WebServlet(name = "CalculateTotalDriverServlet", urlPatterns = {"/CalculateTotalDriverServlet"})
public class CalculateTotalDriverServlet extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            String station = "ST" + request.getParameter("station");
            DAO dao = new DAO();
            int number = dao.getNumberOfDriversAtRoute(station);
            PrintWriter out = response.getWriter();
            
                out.println(number);
            
        } catch (Exception ex) {
            System.out.println("Error in calculation number of driver servlet : " + ex.getMessage());
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                try {
            response.setContentType("text/html;charset=UTF-8");
            String station = "ST" + request.getParameter("station");
            DAO dao = new DAO();
            int number = dao.getNumberOfDriversAtRoute(station);
            PrintWriter out = response.getWriter();
            
                out.println(number);
            
        } catch (Exception ex) {
            System.out.println("Error in calculation number of driver servlet : " + ex.getMessage());
        }
    }

   

}
