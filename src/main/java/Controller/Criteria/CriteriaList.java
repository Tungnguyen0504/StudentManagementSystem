/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Criteria;

import DAO.DAOCriteria;
import Enitiy.Criteria;
import Enitiy.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
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
 * @author Admin
 */
@WebServlet(name = "Criteria", urlPatterns = {"/Criteria"})
public class CriteriaList extends HttpServlet {

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
        HttpSession session = request.getSession();
        User Loged = (User) session.getAttribute("Loged");
        if (Loged == null) {
            request.getRequestDispatcher("Login_sen").forward(request, response);

        }
        String service = request.getParameter("go");

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String submit = request.getParameter("submit");
            String indexP = request.getParameter("index");
            if (indexP == null) {
                indexP = "1";
            }
            int index = Integer.parseInt(indexP);
            DAOCriteria dao = new DAOCriteria();
            int count = dao.getTotalList();
            int maxPage = count / 10;
            if (count % 10 != 0) {
                maxPage++;
            }
            List<Criteria> list = dao.viewCriteriaList(index);
            request.setAttribute("maxP", maxPage);
            List<Criteria> listCri = dao.viewSubjectId();
            request.setAttribute("subjectList", listCri);
            //  out.print(listCri);             
            request.setAttribute("CriteriaList", list);
            request.getRequestDispatcher("/jsp/Criteria/CriteriaList.jsp").forward(request, response);

            if (service.equals("updateStatus")) {
                int status = Integer.parseInt(request.getParameter("status"));
                String criId = request.getParameter("criId");
                int n = dao.updateStatus(criId, status);
                response.sendRedirect("Criteria");
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
