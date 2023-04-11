/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.StationDAO;
import Model.Station;
import System.AvgEarningDriver;
import System.SaveToJSON;
import dao.CustomerDAO;
import dao.DAO;
import entity.Bill;
import entity.Customer;
import entity.Driver;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "DriverPage", urlPatterns = {"/DriverPage"})
public class DriverPage extends HttpServlet {

    SaveToJSON save = new SaveToJSON();
    AvgEarningDriver avg = new AvgEarningDriver();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException, com.nimbusds.oauth2.sdk.ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            Driver driver = (Driver) session.getAttribute("User");

            DAO bDAO = new DAO();
            StationDAO sDAO = new StationDAO();
            CustomerDAO cDAO = new CustomerDAO();

            ArrayList<Station> sl = sDAO.getAllStation();
            ArrayList<Bill> bl = bDAO.getAllBillOfDriver(driver.getDriverID());
            ArrayList<Customer> cl = cDAO.getAllCustomer();

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            // Kiem tra so bill cua driver trong 1 tuan
            ArrayList<Bill> fl = new ArrayList<>();
            for (int i = 0; i < bl.size(); i++) {
                if (isDateInCurrentWeek(sdf.parse(bl.get(i).getDate()))) {
                    fl.add(bl.get(i));
                }
            }
            session.setAttribute("bills", fl);

            // hien cac chuyen da nhan trong ngay
            ArrayList<Bill> currBill = new ArrayList<>();
            for (int i = 0; i < bl.size(); i++) {
                if (isDateNow(sdf.parse(bl.get(i).getDate()))) {
                    currBill.add(bl.get(i));
                }
            }
            session.setAttribute("currentBill", currBill);

            // So tien va chuyen da nhan trung binh 1 thang
            ArrayList<Bill> monthBill = new ArrayList<>();
            for (int i = 0; i < bl.size(); i++) {
                if (isCurrentMonth(sdf.parse(bl.get(i).getDate()))) {
                    monthBill.add(bl.get(i));
                }
            }
            session.setAttribute("monthBill", monthBill);

            save.saveFile(avg.EarningAvg(bl), "EarningAvg");
            save.saveFile(avg.NumberTrip(bl), "NumberTrip");

            session.setAttribute("customers", cl);
            session.setAttribute("stations", sl);
            session.setAttribute("bill", bl);

            response.sendRedirect("./Driver/DriverPage.jsp");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            
        } catch (com.nimbusds.oauth2.sdk.ParseException ex) {
            Logger.getLogger(DriverPage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**

     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            
        } catch (com.nimbusds.oauth2.sdk.ParseException ex) {
            Logger.getLogger(DriverPage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**

     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public boolean isDateInCurrentWeek(Date date) {
        Calendar currentCalendar = Calendar.getInstance();
        int week = currentCalendar.get(Calendar.WEEK_OF_YEAR);
        int year = currentCalendar.get(Calendar.YEAR);
        Calendar targetCalendar = Calendar.getInstance();
        targetCalendar.setTime(date);
        int targetWeek = targetCalendar.get(Calendar.WEEK_OF_YEAR);
        int targetYear = targetCalendar.get(Calendar.YEAR);
        return week == targetWeek && year == targetYear;
    }

    public boolean isDateNow(Date date) {
        LocalDate now = LocalDate.now();
        ZoneId systemTimeZone = ZoneId.systemDefault();
        ZonedDateTime zonedDateTime = now.atStartOfDay(systemTimeZone);
        Date utilDate = Date.from(zonedDateTime.toInstant());

        Calendar cal1 = Calendar.getInstance();
        Calendar cal2 = Calendar.getInstance();
        cal1.setTime(utilDate);
        cal2.setTime(date);
        return cal2.get(Calendar.DAY_OF_YEAR) == cal1.get(Calendar.DAY_OF_YEAR)
                && cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR);

    }

    public boolean isCurrentMonth(Date date) {
        Calendar cal1 = Calendar.getInstance();
        Calendar cal2 = Calendar.getInstance();
        cal1.setTime(date);
        cal2.setTime(new Date());
        return cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR) && cal1.get(Calendar.MONTH) == cal2.get(Calendar.MONTH);
    }
}

