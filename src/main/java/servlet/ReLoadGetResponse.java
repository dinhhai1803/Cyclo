/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ReLoadGetResponse", urlPatterns = {"/ReLoadGetResponse"})
public class ReLoadGetResponse extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
            response.setContentType("text/html;charset=UTF-8");

            PrintWriter out = response.getWriter();
            
            
                out.println("          <% if ( application.getAttribute(\"driverResponse\") != null   ){%>\n" +
"                                          <%= application.getAttribute(\"driverResponse\")%>\n" +
"                                           <% }%> ");
            
        } catch (Exception ex) {
            System.out.println("Error in display driver servlet : " + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


}
