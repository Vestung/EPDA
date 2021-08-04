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
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.AccountFacade;
import model.Booking;
import model.BookingFacade;
import model.EventHall;
import model.EventHallFacade;

/**
 *
 * @author leonc
 */
@WebServlet(name = "Book", urlPatterns = {"/Book"})
public class Book extends HttpServlet {

    @EJB
    private AccountFacade accountFacade;

    @EJB
    private EventHallFacade eventHallFacade;

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
        String handlername = loginAccount.getUsername();
        String temphall = request.getParameter("hallname");
        EventHall hall = eventHallFacade.searchByName(temphall);

        String customername = request.getParameter("customer");
        Account customer = accountFacade.searchByName(customername);
        String tempdate = request.getParameter("date");
        LocalDate localdate = LocalDate.parse(tempdate);
        Date date = Date.valueOf(localdate);
        String selectedslot  = request.getParameter("slot");
        String[] arr = selectedslot.split("//", 4);
        int slot = Integer.parseInt(arr[0]);
        
        Booking book = new Booking(handlername,customer,date,slot,hall);
        System.out.println("Created Booking is for " + book.getHall().getName() + " for slot " + book.getSlot() + " by user " + book.getUser().getName() + " on date " + book.getDate());
        List allBooking = bookingFacade.findAll();
        boolean found = false;
        if (allBooking.size() < 1){
            bookingFacade.create(book);
            request.getRequestDispatcher("booking.jsp").include(request, response);
            try (PrintWriter out = response.getWriter()) {
            out.println("<br><br>Booking is completed!");
            }
        }
        else{
            for (int i = 0; i < allBooking.size();i++){
                Booking tempbook = (Booking)allBooking.get(i);
                if(tempbook.getSlot() == book.getSlot() && tempbook.getDate().equals(book.getDate()) && tempbook.getHall().getId().equals(book.getHall().getId())){
                    found = true;
                }
            }
            if(found == true){
                request.getRequestDispatcher("booking.jsp").include(request, response);
                try (PrintWriter out = response.getWriter()) {
                out.println("<br><br>Slot has been taken");
                }
            }else{
            bookingFacade.create(book);
            request.getRequestDispatcher("booking.jsp").include(request, response);
            try (PrintWriter out = response.getWriter()) {
                out.println("<br><br>Booking is completed!");
                }
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
