/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.CustomerDAO;
import dao.DAO;
import dao.DriverDAO;
import entity.Customer;
import entity.Driver;
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
@WebServlet(name = "ResponseOfDriverServlet", urlPatterns = {"/ResponseOfDriverServlet"})
public class ResponseOfDriverServlet extends HttpServlet {

        private List<AsyncContext> contextsDriver = new LinkedList<>();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            final AsyncContext asyncContextDriver = request.startAsync(request, response);
             asyncContextDriver.setTimeout(10 * 60 * 1000);
             contextsDriver.add(asyncContextDriver);
        }
        catch(Exception e){
            System.out.println("Error in Doget of responseDriverServlet : " + e.getMessage());
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<AsyncContext> asyncContexts = new ArrayList<>(this.contextsDriver);
        this.contextsDriver.clear();
        String userID = request.getParameter("UserID");
        CustomerDAO cusDao = new CustomerDAO();
        
        String listOfSelectedRoutes = request.getParameter("ListOfSelectedRoutes");
        String userBookingID = request.getParameter("userBookingID");
        Customer cus = cusDao.getCustomerByID(userBookingID);
        String[] totalRoute = CalculateRoute.CalTotal(listOfSelectedRoutes).split(",");
        double totalDistance = Double.parseDouble(totalRoute[0]);
        double totalPrice = Double.parseDouble(totalRoute[1]);
        double totalTime = Double.parseDouble(totalRoute[2]);
        DAO Dao = new DAO();
        List<Route> routes = null;
            try {
                routes = Dao.getAllRoute();
            } catch (Exception ex) {
                Logger.getLogger(ResponseOfDriverServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        DriverDAO dao = new DriverDAO();
        Driver driver = dao.getAllDriverByID(userID);
        //String htmlMessage = "<span class=\"bell fa fa-bell\"></span><div style=\"font-size: 1.6rem;\">A driver ID "+userID+" has accepted your trip</div>";
        String htmlMessage = "                                         <div class=\"user__Image\">\n" +
"                                                <img src=\"image/"+driver.getDriverAvatar()+"\" style=\"width: 75%;\n" +
"                                                                                                border-radius: 50%;\n" +
"                                                                                            }\"/>\n" +
"                                        </div><div class=\"user__Info\" style=\"padding-top: 10%;\">"
                + "<div class=\"user__info-name\" style=\"margin-left: -18%;\">\n" +
    "                                            <i class=\"fa-solid fa-user\" style=\"margin-left: -40%;\"></i>\n" +
    "                                            <p>" + driver.getDriverName() +"</p>\n" +
    "                                        </div>\n" +
    "\n" +
    "                                        <div class=\"user_info-phone\" style=\"margin-left: -10%;\">\n" +
    "                                            <i class=\"fa-solid fa-phone\" style=\"margin-left: -40%;\"></i><!-- comment -->\n" +
    "                                            <p>" + driver.getDriverIPhone()+"</p>\n" +
    "                                        </div>"
                + "</div>";
        ServletContext sc = request.getServletContext();
         System.out.println("In Response Driver Servlet: UserID : " + userID + " -- List of selected Routes : " + listOfSelectedRoutes + " -- User Booking ID " + userBookingID);

        if (sc.getAttribute("driverResponse") == null) {
            sc.setAttribute("driverResponse", htmlMessage);
            sc.setAttribute("userBookingIDResponse", userBookingID);
        } else {
            String currentMessages = (String) sc.getAttribute("driverResponse");
            sc.setAttribute("driverResponse", htmlMessage + currentMessages);
        }
        for (AsyncContext asyncContext : asyncContexts) {
            try (PrintWriter writer = asyncContext.getResponse().getWriter()) {
                writer.println(htmlMessage);
                writer.flush();
                asyncContext.complete();
            } catch (Exception ex) {
                System.out.println("Error in response driver : " + ex.getMessage());
            }
        }
        
            try {
                double total = totalPrice;
                DriverDAO dDao = new DriverDAO();
                dDao.updateDriverStatus(userID);
                String detailID = Dao.InsertBillDetail(listOfSelectedRoutes);
                Dao.InsertBill(userBookingID, userID, detailID, total);
            } catch (Exception ex) {
                Logger.getLogger(ResponseOfDriverServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        
            HttpSession userSession = request.getSession();
            userSession.setAttribute("ROUTES", routes);
            userSession.setAttribute("USERID", userID);
            userSession.setAttribute("USERINFO", cus);
            userSession.setAttribute("DISTANCE", totalDistance);
            userSession.setAttribute("PRICE", totalPrice);
            userSession.setAttribute("TIME", totalTime);
            userSession.setAttribute("ISDRIVERACCEPT", true);
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
