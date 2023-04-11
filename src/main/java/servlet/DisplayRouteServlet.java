/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DAO;
import entity.Route;
import java.util.List;
import javax.servlet.annotation.WebServlet;
/**
 *
 * @author win
 */
@WebServlet("/Home")
public class DisplayRouteServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
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
        System.out.println("Index Page : " + indexPage);
        System.out.println("Index Group : " + indexGroup);
        try {
            DAO dao = new DAO();
            List<Route> routes = dao.getPagingRoute(indexPage);
            List<Route> allRoutes = dao.getAllRoute();
            int nPages = dao.getTotalRoutes() / 3;
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
        } catch (Exception e) {
            System.out.println("Error in display servlet : " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


}
