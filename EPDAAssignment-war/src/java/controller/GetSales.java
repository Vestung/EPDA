/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Booking;
import model.BookingFacade;

/**
 *
 * @author leonc
 */
@WebServlet(name = "GetSales", urlPatterns = {"/GetSales"})
public class GetSales extends HttpServlet {

    @EJB
    private BookingFacade bookingFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession s = request.getSession();
        Account loginAccount = (Account)s.getAttribute("login");
        List<Booking> allBooking = bookingFacade.findAll();
        HashMap<String , Double> map = new HashMap<String , Double>();
            for ( Booking a :allBooking){
                if(a.getPaymentStatus().equals("Confirmed")){
                    LocalDate date = a.getDate().toLocalDate();
                    String month = date.getMonth().toString();
                    if(!map.containsKey(month)){
                        map.put(month, a.getHall().getPaymentAmount());
                    }
                    else{
                        map.put(month, map.get(month) + a.getHall().getPaymentAmount());
                    }
                }
            }
            
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            request.getRequestDispatcher("salesreport.jsp").include(request, response);
            out.println("<br>Sales Report (NOTE: ONLY CONFIRMED AMOUNT IS INCLUDED)");
            for (String sale : map.keySet()) {
                out.println("<br>" + sale + " : " + map.get(sale));
            }
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

}
