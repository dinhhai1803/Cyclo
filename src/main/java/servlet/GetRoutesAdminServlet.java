/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DAO;
import entity.Route;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author win
 */
@WebServlet(name = "GetRoutesAdminServlet", urlPatterns = {"/GetRoutesAdminServlet"})
public class GetRoutesAdminServlet extends HttpServlet {




    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession routeSession = request.getSession();
        try{  
            DAO dao = new DAO();
            List<Route> routes = dao.getAllRoute();
            request.setAttribute("ROUTES", routes);
            routeSession.setAttribute("ROUTES", routes);
            response.sendRedirect("./Admin/Route.jsp");
        }
        catch(Exception e){
            System.out.println("Error in Get Routes Admin : " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


}
