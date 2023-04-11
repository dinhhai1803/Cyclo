/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
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
@WebServlet(name = "ProgressTargetServlet", urlPatterns = {"/ProgressTargetServlet"})
public class ProgressTargetServlet extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        double week = Double.parseDouble(request.getParameter("week"));
        double month = Double.parseDouble(request.getParameter("month"));
        double year = Double.parseDouble(request.getParameter("year"));
        System.out.println(week + " - " + month + " - " + year);
        double sumYear = 0;
        double sumMonth = 0;
        double sumWeek = 0;

        HttpSession session = request.getSession();
        sumWeek = (Double) session.getAttribute("TotalWeek");
        sumMonth = (Double) session.getAttribute("TotalMonth");
        sumYear = (Double) session.getAttribute("TotalYear");
        System.out.println(sumWeek + " - " + sumMonth + " - " + sumYear);

        Map<String, Double> total = new HashMap<String, Double>();
        total.put("week", (sumWeek/week)*100);
        total.put("month", (sumMonth/month)*100);
        total.put("year", (sumYear/year)*100);

        response.setContentType("application/json");

        Gson gson = new Gson();
        String json = gson.toJson(total);

        OutputStream outputStream = response.getOutputStream();
        outputStream.write(json.getBytes());
        outputStream.flush();
    }


}
