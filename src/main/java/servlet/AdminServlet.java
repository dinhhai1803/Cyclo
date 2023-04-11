/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import System.CheckTime;
import dao.BillDAO;
import entity.Bill;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "AdminServlet", urlPatterns = {"/AdminServlet"})
public class AdminServlet extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();

        double sumYear = 0;
        double sumMonth = 0;
        double sumWeek = 0;
        double sumDay = 0;

        CheckTime time = new CheckTime();
        BillDAO bdao = new BillDAO();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ArrayList<Bill> listBill = bdao.getAllBill();

        session.setAttribute("BILLLIST", listBill);

        try ( PrintWriter out = response.getWriter()) {

            //Earning Day
            for (int i = 0; i < listBill.size(); i++) {
                if (time.isDateNow(sdf.parse(listBill.get(i).getDate()))) {
                    sumDay += listBill.get(i).getTotal();
                }
            }
            session.setAttribute("TotalDay", sumDay);

            //Earning Week
            for (int i = 0; i < listBill.size(); i++) {
                if (time.isDateInCurrentWeek(sdf.parse(listBill.get(i).getDate()))) {
                    sumWeek += listBill.get(i).getTotal();
                }
            }
            session.setAttribute("TotalWeek", sumWeek);

            //Earning Month
            for (int i = 0; i < listBill.size(); i++) {
                if (time.isCurentMonth(sdf.parse(listBill.get(i).getDate()))) {
                    sumMonth += listBill.get(i).getTotal();
                }
            }
            session.setAttribute("TotalMonth", sumMonth);

            //Earning Year
            for (int i = 0; i < listBill.size(); i++) {
                if (time.isCurentYear(sdf.parse(listBill.get(i).getDate()))) {
                    sumYear += listBill.get(i).getTotal();
                }
            }
            session.setAttribute("TotalYear", sumYear);

//            RequestDispatcher rd = request.getRequestDispatcher("Admin/index.jsp");
//            rd.forward(request, response);
            response.sendRedirect("Admin/index.jsp");
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
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
