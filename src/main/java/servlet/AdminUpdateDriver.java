/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DriverDAO;
import entity.Driver;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "AdminUpdateDriver", urlPatterns = {"/AdminUpdateDriver"})
public class AdminUpdateDriver extends HttpServlet {

    DriverDAO ddao = new DriverDAO();

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = (String) request.getParameter("id");
        System.out.println("id update driver: " + id);
        HttpSession session = request.getSession();

        session.setAttribute("driver", ddao.getDriverInfo(id));
//        response.sendRedirect("Admin/DriverUpdate/UpdateDriver.jsp");
        request.getRequestDispatcher("Admin/DriverUpdate/UpdateDriver.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        Driver driver = (Driver) session.getAttribute("driver");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String cccd = request.getParameter("CCCD");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));

        ddao.updateDriver(driver.getDriverID(), name, email, phone, gender, cccd);

        request.getRequestDispatcher("AdminDriverAccount").forward(request, response);

    }

}
