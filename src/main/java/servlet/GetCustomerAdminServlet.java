/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.CustomerDAO;
import entity.Customer;
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
@WebServlet(name = "GetCustomerAdminServlet", urlPatterns = {"/GetCustomerAdminServlet"})
public class GetCustomerAdminServlet extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            CustomerDAO dao = new CustomerDAO();
            List<Customer> CustomerList = dao.getAllCustomer();
            HttpSession cusSession = request.getSession();
            cusSession.setAttribute("CUSTOMERLIST", CustomerList);
            response.sendRedirect("Admin/Customer.jsp");
        }
        catch(Exception e){
            System.out.println("Error in Get Customer Servlet : "+ e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

   

}
