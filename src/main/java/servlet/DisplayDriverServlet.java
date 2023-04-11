/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DAO;
import entity.Driver;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DisplayDriverServlet", urlPatterns = {"/DisplayDriverServlet"})
public class DisplayDriverServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            String amount = request.getParameter("exists");
            String currentStation = request.getParameter("currentStation");
            DAO dao = new DAO();
            List<Driver> drivers = dao.getPagingDriver((Integer.parseInt(amount) ), currentStation);
            PrintWriter out = response.getWriter();
            
            for(Driver driver : drivers){
                out.println("        <div class=\"col-lg-6 col-sm-6\">\n" +
                        "          <div class=\"item driver\">\n" +
                        "            <div class=\"row\">\n" +
                        "              <div class=\"col-lg-6\">\n" +
                        "                <div class=\"image\">\n" +
                        "                  <img src=\"image/"+driver.getDriverAvatar()+"\" alt=\"\">\n" +
                        "                </div>\n" +
                        "              </div>\n" +
                        "              <div class=\"col-lg-6 align-self-center\">\n" +
                        "                <div class=\"content\">\n" +
                        "                  <span class=\"info\">Choose Driver "+driver.getDriverID()+"</span>\n" +
                                "                  <h4>"+driver.getDriverName()+"</h4>\n" +
                                        "                  <div class=\"row\">\n" +
                                        "                    <div class=\"col-6\">\n" +
                                        "                      <i class=\"fa fa-clock\"></i>\n" +
                                        "                      <span class=\"list\">"+driver.getDriverIPhone()+"</span>\n" +
                                                "                    </div>\n" +
                                                "                    <div class=\"col-6\">\n" +
                                                "                      <i class=\"fa fa-map\"></i>\n" +
                                                "                      <span class=\"list\">"+driver.getDriverCCCD()+"</span>\n" +
                                                        "                    </div>\n" +
                                                        "                  </div>\n" +
                                                        "                  <p> Gender  -  "+((driver.getDriverGender() ==  1) ? "Male" : "Female") +"</p>\n" +
                                                                "                  <div class=\"main-button\">\n" +
                                                                "                    <a href=\"reservation.html\">Make a Reservation</a>\n" +
                                                                "                  </div>\n" +
                                                                "                </div>\n" +
                                                                "              </div>\n" +
                                                                "            </div>\n" +
                                                                "          </div>\n" +
                                                                "        </div>");
            }
        } catch (Exception ex) {
            System.out.println("Error in display driver servlet : " + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            String amount = request.getParameter("exists");
            String currentStation = request.getParameter("currentStation");
            DAO dao = new DAO();
            List<Driver> drivers = dao.getPagingDriver((Integer.parseInt(amount) ), currentStation);
            PrintWriter out = response.getWriter();
            
            for(Driver driver : drivers){
                out.println("        <div class=\"col-lg-6 col-sm-6\">\n" +
                        "          <div class=\"item driver\">\n" +
                        "            <div class=\"row\">\n" +
                        "              <div class=\"col-lg-6\">\n" +
                        "                <div class=\"image\">\n" +
                         "                  <img src=\"image/"+driver.getDriverAvatar()+"\" alt=\"\">\n" +
                        "                </div>\n" +
                        "              </div>\n" +
                        "              <div class=\"col-lg-6 align-self-center\">\n" +
                        "                <div class=\"content\">\n" +
                        "                  <span class=\"info\">Choose Driver "+driver.getDriverID()+"</span>\n" +
                                "                  <h4>"+driver.getDriverName()+"</h4>\n" +
                                        "                  <div class=\"row\">\n" +
                                        "                    <div class=\"col-6\">\n" +
                                        "                      <i class=\"fa fa-clock\"></i>\n" +
                                        "                      <span class=\"list\">"+driver.getDriverIPhone()+"</span>\n" +
                                                "                    </div>\n" +
                                                "                    <div class=\"col-6\">\n" +
                                                "                      <i class=\"fa fa-map\"></i>\n" +
                                                "                      <span class=\"list\">"+driver.getDriverCCCD()+"</span>\n" +
                                                        "                    </div>\n" +
                                                        "                  </div>\n" +
                                                        "                  <p>"+((driver.getDriverGender() ==  1) ? "Male" : "Female") +"</p>\n" +
                                                                "                  <div class=\"main-button\">\n" +
                                                                "                    <a href=\"reservation.html\">Make a Reservation</a>\n" +
                                                                "                  </div>\n" +
                                                                "                </div>\n" +
                                                                "              </div>\n" +
                                                                "            </div>\n" +
                                                                "          </div>\n" +
                                                                "        </div>");
            }
        } catch (Exception ex) {
            System.out.println("Error in display driver servlet : " + ex.getMessage());
        }
    }

}
