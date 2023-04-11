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
@WebServlet(name = "SearchPlaceServlet", urlPatterns = {"/SearchPlaceServlet"})
public class SearchPlaceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String searchPlace = request.getParameter("searchPlace");
        int indexPage = 0;
        int indexGroup = 0;
        if(request.getParameter("indexPage") == null || request.getParameter("indexGroup") == null){
            indexPage = 1;           
            indexGroup = 1;
        }
        else{
            indexPage = Integer.parseInt(request.getParameter("indexPage"));
            indexGroup = Integer.parseInt(request.getParameter("indexGroup"));
        }
        try{
            DAO dao = new DAO();
            HashMap<Route, Place> search = dao.searchRoute(searchPlace, indexPage);
            List<Route> searchedRoute = new ArrayList<>();
            for(Route i : search.keySet()){
                searchedRoute.add(i);
            }
            
            List<Route> routes = searchedRoute;
            List<Route> allRoutes = dao.getAllRoute();
            int nPages = searchedRoute.size() / 3;
            if(nPages % 3 != 0)
                nPages += 1;
            for(Route i : routes){
                System.out.println(i.toString());
            }
            request.setAttribute("indexGroup", indexGroup);
            request.setAttribute("AllRoute", allRoutes);
            request.setAttribute("RouteList", routes);
            request.setAttribute("nOPages", nPages);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
        }
        catch(Exception e){
            System.out.println("Error in seachPlace servlet : " + e.getMessage());
        }
    }


}
