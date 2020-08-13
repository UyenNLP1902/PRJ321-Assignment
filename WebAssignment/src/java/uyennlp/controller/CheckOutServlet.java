/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uyennlp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uyennlp.cart.CartCreateError;
import uyennlp.cart.CartDAO;
import uyennlp.cart.CartObject;

/**
 *
 * @author HP
 */
public class CheckOutServlet extends HttpServlet {

    private final String CHECK_OUT_PAGE = "checkout.html";
    private final String ERROR_PAGE = "viewCart.jsp";

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
        PrintWriter out = response.getWriter();
        String customer = request.getParameter("txtCustomer");
        String url = ERROR_PAGE;
        CartCreateError error = new CartCreateError();
        boolean foundErr = false;
        try {

            if (customer.trim().isEmpty()) {
                foundErr = true;
                error.setCustomerNameIsEmpty("Please input your name!");
            }

            if (!foundErr) {

                HttpSession session = request.getSession();

                CartObject cart = (CartObject) session.getAttribute("CART");
                if (cart != null) {
                    Map<String, Integer> list = cart.getItems();
                    if (list != null) {
                        CartDAO dao = new CartDAO();
                        for (String title : list.keySet()) {
                            dao.insert(title, list.get(title), customer);
                        }
                    }
                    cart.clearCart();
                    url = CHECK_OUT_PAGE;
                    session.removeAttribute("CART");
                }
            } else {
                request.setAttribute("CHECKOUTERROR", error);
            }

        } catch (NamingException ex) {
            String err = "CheckOutServlet _ Naming: " + ex.getMessage();
            log(err);
        } catch (SQLException ex) {
            String err = "CheckOutServlet _ Naming: " + ex.getMessage();
            log(err);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
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
