/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Configuration.Conexion;
import DAO.Operaciones;
import Excepciones.ApplicationErrorException;
import Modelo.Convocatoria;
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
public class ControladorLogin extends HttpServlet {

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
            String nif = request.getParameter("nif");
            String contrasena = request.getParameter("password");
            Convocatoria convocatoria;
            HttpSession session = request.getSession(true);

            try {
                convocatoria = new Operaciones().getConvocatoria(conexion);
                session.setAttribute("Convocatoria", convocatoria);

                if (new Operaciones().patronNifCorrecto(nif)) {

                    if (new Operaciones().existeNIF(nif, conexion)) {

                        if (new Operaciones().passwordVotante(nif, contrasena, conexion)) {
                            session.setAttribute("nif", nif);
                            session.setAttribute("pass", contrasena);
                            response.sendRedirect("ControladorVotante");

                        } else if (new Operaciones().passwordAdministrador(nif, contrasena, conexion)) {
                            session.setAttribute("nif", nif);
                            session.setAttribute("pass", contrasena);
                            response.sendRedirect("ControladorAdministrador");

                        } else {
                            session.setAttribute("MensajeError", "La contraseña introducida no es correcta.");
                            response.sendRedirect("index.jsp");
                        }

                    } else {
                        session.setAttribute("MensajeError", "El NIF introducido no existe.");
                        response.sendRedirect("index.jsp");
                    }
                } else {
                    session.setAttribute("MensajeError", "El campo NIF no es válido");
                    response.sendRedirect("index.jsp");
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
