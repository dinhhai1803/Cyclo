/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;


import entity.*;
import dao.CustomerDAO;
import entity.Customer;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "SignupServlet", urlPatterns = {"/SignupServlet"})
public class SignupServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            String url = "";

            CustomerDAO cusDao = new CustomerDAO();
            ArrayList<Customer> cl = cusDao.getAllCustomer();

            String id = autoIncrementIDCus(cl);
            String username = request.getParameter("username");
            String password = request.getParameter("pass");
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");

            System.out.println("new acc:" + id + " - " + username + " - " + password + " - " + name + " - " + email + " - " + phone);
            //if (checkDuplicateUserName(username, cl)) {
                request.setAttribute("Error", "<span><i class=\"bi bi-exclamation-triangle-fill\"></i></span> Username's exist");
                url = "Login.jsp";
            //}
            //else
            if (isMailValid(email)) {
                request.setAttribute("Error", "<span><i class=\"bi bi-exclamation-triangle-fill\"></i></span> Invalid Email");
                url = "Login.jsp";
            }
            else {
                System.out.println("Add customer");
                cusDao.addCustomer(id, name, email, password, phone, username);
                url = "Login.jsp";
            }

            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    String autoIncrementIDCus(ArrayList<Customer> cl) {
        String id = "KH";
        int noId = 1;

        for (int i = 0; i < cl.size(); i++) {
            String[] str = cl.get(i).getCusID().split("KH");
            for (int j = 1; j < str.length; j++) {
                int no = Integer.parseInt(str[j]);
                while (noId <= no) {
                    noId++;
                }
            }
        }
        return id + noId;
    }

    boolean checkDuplicateUserName(String name, ArrayList<Customer> cl) {
        for (int i = 0; i < cl.size(); i++) {
            if (cl.get(i).getCusUserName().equalsIgnoreCase(name)) {
                return true;
            }
        }
        return false;
    }

    boolean isMailValid(String mail) {
        String regex = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+(?:\\.[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+)*@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$";
        Pattern r = Pattern.compile(regex);
        Matcher m = r.matcher(mail);
        if (m.matches()) {
            return false;
        }
        return true;
    }
}
