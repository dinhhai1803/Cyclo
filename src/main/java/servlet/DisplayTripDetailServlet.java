/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.CustomerDAO;
import dao.DAO;
import entity.Customer;
import entity.Route;
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
@WebServlet(name = "DisplayTripDetailServlet", urlPatterns = {"/DisplayTripDetailServlet"})
public class DisplayTripDetailServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userID = request.getParameter("UserID");
        String listOfSelectedRoutes = request.getParameter("ListOfSelectedRoutes");
        String[] totalRoute = CalculateRoute.CalTotal(listOfSelectedRoutes).split(",");
        double totalDistance = Double.parseDouble(totalRoute[0]);
        double totalPrice = Double.parseDouble(totalRoute[1]);
        double totalTime = Double.parseDouble(totalRoute[2]);
        
               try{
                   System.out.println("In Display trip : " + listOfSelectedRoutes + userID);
           DAO dao = new DAO();
           CustomerDAO cusDao = new CustomerDAO();
           Customer cus = cusDao.getCustomerByID(userID);
           List<Route> routes = dao.getAllRoute();
           request.setAttribute("ROUTES", routes);
           request.setAttribute("USERID", userID);
           request.setAttribute("USERINFO", cus);
           request.setAttribute("DISTANCE", totalDistance);
           request.setAttribute("PRICE", totalPrice);
           request.setAttribute("TIME", totalTime);
           request.setAttribute("LISTOFSELECTEDROUTES", listOfSelectedRoutes);
           request.getRequestDispatcher("tripDetail.jsp").forward(request, response); 
       }
       catch(Exception e){
           System.out.println("Error in display trip detail servlet : " + e.getMessage());
       }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    

}
