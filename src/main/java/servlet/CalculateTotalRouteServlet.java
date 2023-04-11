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
import services.CalculateRoute;

/**
 *
 * @author win
 */
@WebServlet(name = "CalculateTotalRouteServlet", urlPatterns = {"/CalculateTotalRouteServlet"})
public class CalculateTotalRouteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            String listOfSelectedRoutes = request.getParameter("listOfSelectedRoutes");
                String[] totalRoute = CalculateRoute.CalTotal(listOfSelectedRoutes).split(",");
                double totalDistance = Double.parseDouble(totalRoute[0]);
                double totalPrice = Double.parseDouble(totalRoute[1]);
                double totalTime = Double.parseDouble(totalRoute[2]);
            PrintWriter out = response.getWriter();
            
            
                out.println(" <div class=\"route__infor-distance\">\n" +
"                            <div class=\"route__infor--title\" style=\"\n" +
"                                                            font-size: 1.8rem;\n" +
"                                                            font-weight: 500;\n" +
"                                                            text-align: center;\n" +
"                                                        \">Distance</div>\n" +
"                            <div class=\"route__infor--value\" style=\"\n" +
"                                                            text-align: center;\n" +
"                                                            font-size: 1.1rem;\n" +
"                                                            border-bottom: 1px solid #7e7b7b;\n" +
"                                                        \">"+totalDistance+" metters </div>\n" +
"                        </div>\n" +
"                        <div class=\"route__infor-time\">\n" +
"                            <div class=\"route__infor--title\" style=\"\n" +
"                                                            font-size: 1.8rem;\n" +
"                                                            font-weight: 500;\n" +
"                                                            text-align: center;\n" +
"                                                        \">Time</div>\n" +
"                            <div class=\"route__infor--value\" style=\"\n" +
"                                                        text-align: center;\n" +
"                                                        font-size: 1.1rem;\n" +
"                                                        border-bottom: 1px solid #7e7b7b;\n" +
"                                                    \">"+totalTime+" minutes </div>\n" +
"                        </div>\n" +
"                        <div class=\"route__infor-price\">\n" +
"                            <div class=\"route__infor--title\" style=\"\n" +
"                                                            font-size: 1.8rem;\n" +
"                                                            font-weight: 500;\n" +
"                                                            text-align: center;\n" +
"                                                        \">Price</div>\n" +
"                            <div class=\"route__infor--value\" style=\"\n" +
"                                                        text-align: center;\n" +
"                                                        font-size: 1.1rem;\n" +
"                                                        border-bottom: 1px solid #7e7b7b;\n" +
"                                                    \">"+totalPrice+" VND </div>\n" +
"                        </div>");
            
        } catch (Exception ex) {
            System.out.println("Error in display driver servlet : " + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }



}
