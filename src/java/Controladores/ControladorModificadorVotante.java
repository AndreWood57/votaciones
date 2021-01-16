/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Configuration.Conexion;
import DAO.Operaciones;
import Excepciones.ApplicationErrorException;
import Modelo.Direccion;
import Modelo.Votante;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author andre
 */
public class ControladorModificadorVotante extends HttpServlet {

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
            String nif = request.getParameter("nif");
            String contrasena = request.getParameter("contrasena");
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String mail = request.getParameter("email");
            String telefono = "+34"+request.getParameter("telefono");
            LocalDate fechaNac = LocalDate.parse(request.getParameter("fechanac"));
            char sexo = request.getParameter("sexo").charAt(0);

            Votante votante = new Votante(nif, nombre, apellidos, telefono, fechaNac, mail, sexo, contrasena);

            String tipo = request.getParameter("tipoCalle");
            String nombreCalle = request.getParameter("nombreCalle");
            String numero = request.getParameter("numero");
            String portal = request.getParameter("portal");
            String piso = request.getParameter("piso");
            String puerta = request.getParameter("puerta");
            String cp = request.getParameter("cp");
            String localidad = request.getParameter("localidad");
            String provincia = request.getParameter("provincia");

            Direccion direccion = new Direccion(tipo, nombreCalle, numero, portal, puerta, piso, localidad, provincia, cp);

            try {
                conexion.setAutoCommit(false);
                new Operaciones().updateDireccion(nif, direccion, conexion);
                new Operaciones().updatePersona(nif, votante, conexion);
                new Operaciones().updateVotante(nif, votante, conexion);
                session.setAttribute("Persona", votante);
                session.setAttribute("Direccion", direccion);
                
                conexion.commit();
                conexion.setAutoCommit(true);
            } catch (ApplicationErrorException ex) {
                response.sendRedirect("Views/VistaMensajesError.jsp?Mensaje=" + ex);
            } catch (SQLException ex) {
                if (conexion != null) {
                    try {
                        conexion.rollback();
                    } catch (SQLException ex1) {
                        response.sendRedirect("Views/VistaMensajesError.jsp?Mensaje=" + ex1);
                    }
                }
            } catch (Exception ex) {
                response.sendRedirect("Views/VistaMensajesError.jsp?Mensaje=" + ex);
            }
            session.setAttribute("MensajeExito", "Se ha modificado correctamente. Gracias.");
            response.sendRedirect("Views/VistaMenuVotante.jsp");
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
