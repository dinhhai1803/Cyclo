/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import System.AvgEarningDriver;
import dao.BillDAO;
import entity.Bill;
import entity.Driver;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.minidev.json.JSONObject;

/**
 *
 * @author win
 */
@WebServlet(name = "DriverChartBill", urlPatterns = {"/DriverChartBill"})
public class DriverChartBill extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException, com.nimbusds.oauth2.sdk.ParseException {

        HttpSession session = request.getSession();
        Driver d = (Driver) session.getAttribute("User");
        
        BillDAO dao = new BillDAO();
        ArrayList<Bill> b = dao.getAllBillOfDriver(d.getDriverID());
        AvgEarningDriver json = new AvgEarningDriver();
        response.setContentType("application/json");

        JSONObject obj = json.EarningAvg(b);
        OutputStream outputStream = response.getOutputStream();
        outputStream.write(obj.toString().getBytes());
        outputStream.flush();

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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(DriverChartBill.class.getName()).log(Level.SEVERE, null, ex);
        } catch (com.nimbusds.oauth2.sdk.ParseException ex) {
            Logger.getLogger(DriverChartBill.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(DriverChartBill.class.getName()).log(Level.SEVERE, null, ex);
        } catch (com.nimbusds.oauth2.sdk.ParseException ex) {
            Logger.getLogger(DriverChartBill.class.getName()).log(Level.SEVERE, null, ex);
        }
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


}
