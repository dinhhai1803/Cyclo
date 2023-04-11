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
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.AsyncContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.CalculateRoute;

/**
 *
 * @author win
 */
@WebServlet(name = "CallDriverServlet", urlPatterns = {"/CallDriverServlet"}, asyncSupported=true)
public class CallDriverServlet extends HttpServlet {

        private List<AsyncContext> contexts = new LinkedList<>();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       final AsyncContext asyncContext = request.startAsync(request, response);
        asyncContext.setTimeout(10 * 60 * 1000);
        contexts.add(asyncContext);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
                List<AsyncContext> asyncContexts = new ArrayList<>(this.contexts);
                CustomerDAO cusDao = new CustomerDAO();
                this.contexts.clear();
                String userID = request.getParameter("UserID");
                Customer cus = cusDao.getCustomerByID(userID);
                String listOfSelectedRoutes = request.getParameter("ListOfSelectedRoutes");
                String[] totalRoute = CalculateRoute.CalTotal(listOfSelectedRoutes).split(",");
                double totalDistance = Double.parseDouble(totalRoute[0]);
                double totalPrice = Double.parseDouble(totalRoute[1]);
                double totalTime = Double.parseDouble(totalRoute[2]);
                DAO dao = new DAO();
                List<Route> routes = null;
            try {
                routes = dao.getAllRoute();
            } catch (Exception ex) {
                Logger.getLogger(CallDriverServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
                
//        String htmlMessage = "<p><b>" + userID + "</b><br/>" + listOfSelectedRoutes + "</p>";
        String htmlMessage = "<li class=\"header__notify-item header__notify-item--viewed\">\n" +
        "                                        <a href=\"DisplayTripDetailServlet?ListOfSelectedRoutes="+ listOfSelectedRoutes +"&UserID="+ userID +"\" class=\"header__notify-link\">\n" +
        "                                            <img src=\"../assets/images/avatar.png\" alt=\"\" class=\"header__notify-img\">\n" +
        "                                            <div class=\"header__notify-info\">\n" +
        "                                                <span class=\"header__notify-name\">There is a customer whose name is "+ cus.getCusName() +" wants to book your Cyclo</span>\n" +
        "                                                <span class=\"header__notify-description\">Get more information about Customer and Trip</span>\n" +
        "                                                </span>\n" +
        "                                            </div>\n" +
        "                                        </a>\n" +
        "                                    </li>";
        System.out.println("UserID : " + userID + "\nList of selected Routes : " + listOfSelectedRoutes);
        ServletContext sc = request.getServletContext();
        if (sc.getAttribute("messages") == null) {
            sc.setAttribute("messages", htmlMessage);
            
        } else {
            String currentMessages = (String) sc.getAttribute("messages");
            if(currentMessages.contains("ListOfSelectedRoutes="+ listOfSelectedRoutes +"&UserID="+ userID))
                sc.setAttribute("messages", currentMessages);
            else
                sc.setAttribute("messages", htmlMessage + currentMessages);
        }
        sc.setAttribute("userBookingID", userID);
        System.out.println("User Booking ID " + userID);
        for (AsyncContext asyncContext : asyncContexts) {
            try (PrintWriter writer = asyncContext.getResponse().getWriter()) {
                writer.println(htmlMessage);
                writer.flush();
                asyncContext.complete();
            } catch (Exception ex) {
                System.out.println("Error in Call Driver Servlet : " + ex.getMessage());
            }
        }
        
            HttpSession userSession = request.getSession();
            userSession.setAttribute("ROUTES", routes);
            userSession.setAttribute("USERID", userID);
            userSession.setAttribute("USERINFO", cus);
            userSession.setAttribute("DISTANCE", totalDistance);
            userSession.setAttribute("PRICE", totalPrice);
            userSession.setAttribute("TIME", totalTime);
            userSession.setAttribute("LISTOFSELECTEDROUTES", listOfSelectedRoutes);

            request.setAttribute("ROUTES", routes);
            request.setAttribute("USERID", userID);
            request.setAttribute("USERINFO", cus);
            request.setAttribute("DISTANCE", totalDistance);
            request.setAttribute("PRICE", totalPrice);
            request.setAttribute("TIME", totalTime);
            request.setAttribute("LISTOFSELECTEDROUTES", listOfSelectedRoutes);
            request.getRequestDispatcher("tripDetail.jsp").forward(request, response);
    }

}
