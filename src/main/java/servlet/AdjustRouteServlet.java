/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author win
 */
@WebServlet(name = "AdjustRouteServlet", urlPatterns = {"/AdjustRouteServlet"})
public class AdjustRouteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");
        String routeID = request.getParameter("Route_ID_hidden");
        String adID = request.getParameter("Route_ADID_hidden");
        String routeNumerStart = request.getParameter("Route_BeginNumber_hidden");
        String routeStart = request.getParameter("Route_Begin_hidden");
        String routeNumberEnd = request.getParameter("Route_EndNumber_hidden");
        String routeEnd = request.getParameter("Route_End_hidden");
        String routeDistance = request.getParameter("Route_Distance_hidden").split(" ")[0];
        String routePrice = request.getParameter("Route_Price_hidden").split(" ")[0];;
        String button = request.getParameter("action_button");
        String routeIDRe = "R" + routeID.charAt(2) + routeID.charAt(1);
        
        
        try{
            DAO dao = new DAO();
            int result_1 = dao.updateStation("ST" + routeNumerStart, routeStart);
            int result_2 = dao.updateStation("ST" + routeNumberEnd, routeEnd);
            int result_3 = dao.updateRoute(routeID, routeDistance, routePrice, adID);
            int result_4 = dao.updateRoute(routeIDRe, routeDistance, routePrice, adID);
            System.out.println("RESULT : " + result_1 + result_2 + result_3 + result_4);
            if(result_1>0 && result_2>0 && result_3>0){
                System.out.println("UPDATE successfully");
                response.sendRedirect("GetRoutesAdminServlet");
            }
            else{
                System.out.println("UPDATE failed");
                response.sendRedirect("Admin/Route.jsp");
            }
        }
        catch(Exception ex){
            System.out.println("Error in Adjust Route Servlet : " + ex.getMessage());
        }
    }

}
