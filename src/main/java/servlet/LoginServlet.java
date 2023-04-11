/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.AdminDAO;
import dao.CustomerDAO;
import dao.DriverDAO;
import entity.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String url = "";
            HttpSession session = request.getSession();

            String user = request.getParameter("username");
            String pass = request.getParameter("pass");
            String remember = request.getParameter("check");

            System.out.println(user + " - " + pass + " - " + remember);

            DriverDAO dl = new DriverDAO();
            CustomerDAO cl = new CustomerDAO();
            AdminDAO al = new AdminDAO();

            Driver driver = dl.getDriverBy(user, pass);
            Customer cus = cl.getCustomerBy(user, pass);
            Admin ad = al.getAdminBy(user, pass);
            if (driver == null && cus == null && ad == null) {
                request.setAttribute("Error", "<i class=\"bi bi-exclamation-triangle-fill\"></i>ACCOUNT IS NOT EXIST");
                url = "Login.jsp";
            }

            if (driver != null) {

                if (driver.getDriverID().toUpperCase().contains("D")) {
                    session.setAttribute("User", driver);
                    session.setAttribute("ID", driver.getDriverID());

                    if ((remember) != null) {
                        if (remember.equalsIgnoreCase("1")) {
                            Cookie cookieName = new Cookie("cookieName", user);
                            cookieName.setMaxAge(60 * 60);
                            Cookie cookiePass = new Cookie("cookiePass", pass);
                            cookieName.setMaxAge(60 * 60);
                            Cookie cookieRemember = new Cookie("remember", remember);
                            cookieName.setMaxAge(60 * 60);
                            response.addCookie(cookieName);
                            response.addCookie(cookiePass);
                            response.addCookie(cookieRemember);
                        }
                    }
                    url = "/Home";
                }

            }

            if (ad != null) {
                if (ad.getAdID().toUpperCase().contains("AD")) {
                    session.setAttribute("User", ad);
                    session.setAttribute("ID", ad.getAdID().split("\\d")[0]);
//                    url = "admin.jsp";

                    if ((remember) != null) {
                        Cookie cookieName = new Cookie("cookieName", user);
                        cookieName.setMaxAge(60 * 60);
                        Cookie cookiePass = new Cookie("cookiePass", pass);
                        cookieName.setMaxAge(60 * 60);
                        Cookie cookieRemember = new Cookie("remember", remember);
                        cookieName.setMaxAge(60 * 60);
                        response.addCookie(cookieName);
                        response.addCookie(cookiePass);
                        response.addCookie(cookieRemember);
                    }

                    System.out.println("ADMIN");
                    url = "AdminServlet";

                }
            }
            if (cus != null) {
                if (cus.getCusID().toUpperCase().contains("KH")) {
                    session.setAttribute("User", cus);
                    session.setAttribute("ID", cus.getCusID());
                    session.setAttribute("User", cus);
                    session.setAttribute("ID", cus.getCusID());

                    if ((remember) != null) {
                        Cookie cookieName = new Cookie("cookieName", user);
                        cookieName.setMaxAge(60 * 60);
                        Cookie cookiePass = new Cookie("cookiePass", pass);
                        cookieName.setMaxAge(60 * 60);
                        Cookie cookieRemember = new Cookie("remember", remember);
                        cookieName.setMaxAge(60 * 60);
                        response.addCookie(cookieName);
                        response.addCookie(cookiePass);
                        response.addCookie(cookieRemember);
                    }

                    url = "/Home";
                }
            }

            System.out.println("url " + url);
            System.out.println("Customer found : " + cus);
            System.out.println("Driver found : " + driver);
            System.out.println("Admin found : " + ad);
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
