/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DriverDAO;
import entity.Driver;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author win
 */
@MultipartConfig
@WebServlet(name = "AdminAddNewDriver", urlPatterns = {"/AdminAddNewDriver"})
public class AdminAddNewDriver extends HttpServlet {

    DriverDAO dao = new DriverDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession idSes =  request.getSession();
        idSes.setAttribute("AUTOINCREMENT_DRIVER", autoIncrementId_Driver(dao.getAllDriver()));
        //request.setAttribute("id", autoIncrementId_Driver(dao.getAllDriver()));
//        request.getRequestDispatcher("Admin/AddDriver.jsp").forward(request, response);
        response.sendRedirect("Admin/AddDriver.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String mail = request.getParameter("mail");
        String phone = request.getParameter("phone");
        String cccd = request.getParameter("cccd");

        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        int gender = (Boolean.parseBoolean(request.getParameter("gender"))) ? 1 : 0;

        Part part = request.getPart("file");
        String photoPath = request.getServletContext().getRealPath("/Admin/img");

        String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
        if (!Files.exists(Path.of(photoPath))) {
            Files.createDirectories(Path.of(photoPath));
        }
        part.write(photoPath + "/" + filename);
        
       if(!checkDuplicateUserName(user, dao.getAllDriver()))
       {
           Driver d = new Driver(
                   autoIncrementId_Driver(dao.getAllDriver()),
                   name, pass, mail,phone, "img/"+filename, cccd, gender, 1,
                   "ST1", 1,user
           );
           
           System.out.println(d.toString());
           
           dao.addDriver(d);
           request.getRequestDispatcher("AdminDriverAccount").forward(request, response);
       }
       else
       {
           request.setAttribute("error", "Duplicate Name");
           request.getRequestDispatcher("Admin/AddDriver.jsp").forward(request, response);
       }

    }

    String autoIncrementId_Driver(ArrayList<Driver> cl) {
        String id = "D";
        int noId = 1;

        for (int i = 0; i < cl.size(); i++) {
            String[] str = cl.get(i).getDriverID().split("D");
            for (int j = 1; j < str.length; j++) {
                int no = Integer.parseInt(str[j]);
                while (noId <= no) {
                    noId++;
                }
            }
        }
        return id + noId;
    }

    boolean checkDuplicateUserName(String name, ArrayList<Driver> cl) {
        for (int i = 0; i < cl.size(); i++) {
            if (cl.get(i).getDriverUserName().equalsIgnoreCase(name)) {
                return true;
            }
        }
        return false;
    }

}
