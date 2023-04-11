/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DAO;
import entity.Place;
import entity.Route;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
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
@WebServlet(name = "RouteDetailServlet", urlPatterns = {"/RouteDetailServlet"})
public class RouteDetailServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String routeID = request.getParameter("routeID");
        try{
                    DAO dao = new DAO();
                    HashMap<Route, List<Place>> routeDetail = dao.getRouteDetail(routeID);
                    Route route = new Route();
                    List<Place> places = new ArrayList<Place>();
                    for(Route i : routeDetail.keySet()){
                        route = i;
                    }       
                    places = routeDetail.get(route);
                    request.setAttribute("ROUTE", route);
                    request.setAttribute("LISTPLACE", places);
                    request.getRequestDispatcher("routeDetail.jsp").forward(request, response);
        }
        catch(Exception e){
            System.out.println("Error in route detail servlet : " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


}
