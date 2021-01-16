/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Configuration.Conexion;
import DAO.Operaciones;
import Excepciones.ApplicationErrorException;
import Modelo.Administrador;
import Modelo.Direccion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author andre
 */
public class ControladorAdministrador extends HttpServlet {

    private Conexion conect;
    private Connection conexion;

    public void init() {
        try {
            conect = Conexion.GetConexion();
            conexion = conect.getCon();
        } catch (ClassNotFoundException | SQLException ex) {

        }
    }

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession(true);
            String nif = (String) session.getAttribute("nif");
            String contrasena = (String) session.getAttribute("pass");

            try {
                int idDireccion = new Operaciones().getIdDireccion(nif, conexion);
                if (idDireccion != -1) {
                    Direccion direccion = new Operaciones().getDireccion(idDireccion, conexion);
                    Administrador administrador = new Operaciones().getAdministrador(nif, conexion);
                    if (direccion != null && administrador != null) {
                        administrador.setPassword(contrasena);
                        session.setAttribute("Persona", administrador);
                        session.setAttribute("Direccion", direccion);
                        response.sendRedirect("Views/VistaMenuAdmin.jsp");
                    }
                }
            } catch (ApplicationErrorException ex) {
                response.sendRedirect("Views/VistaMensajesError.jsp?Mensaje=" + ex);
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
