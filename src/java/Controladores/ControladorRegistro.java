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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author andre
 */
public class ControladorRegistro extends HttpServlet {

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
            if (new Operaciones().patronNifCorrecto(nif)) {
                String contrasena = request.getParameter("contrasena");
                String nombre = request.getParameter("nombre");
                String apellidos = request.getParameter("apellidos");
                String mail = request.getParameter("email");
                String telefono = request.getParameter("telefono");
                LocalDate fechaNac = LocalDate.parse(request.getParameter("fechanac"));
                char sexo = request.getParameter("sexo").charAt(0);

                Votante votante = new Votante();

                votante.setDni(nif);
                votante.setPassword(contrasena);
                votante.setNombre(nombre);
                votante.setApellidos(apellidos);
                votante.setEmail(mail);
                votante.setTelefono("+34" + telefono);
                votante.setFecha_nac(fechaNac);
                votante.setSexo(sexo);

                String tipo = request.getParameter("tipoCalle");
                String nombreCalle = request.getParameter("nombreCalle");
                String numero = request.getParameter("numero");
                String portal = request.getParameter("portal");
                String piso = request.getParameter("piso");
                String puerta = request.getParameter("puerta");
                String cp = request.getParameter("cp");
                String localidad = request.getParameter("localidad");
                String provincia = request.getParameter("provincia");

                Direccion direccion = new Direccion();

                direccion.setTipo(tipo);
                direccion.setNombre(nombreCalle);
                direccion.setNumero(numero);
                direccion.setPortal(portal);
                direccion.setPuerta(puerta);
                direccion.setPiso(piso);
                direccion.setLocalidad(localidad);
                direccion.setProvincia(provincia);
                direccion.setCp(cp);

                try {
                    conexion.setAutoCommit(false);
                    new Operaciones().setDireccion(direccion, conexion);
                    int idDireccion = new Operaciones().searchIdDireccion(direccion, conexion);
                    if (idDireccion != -1) {
                        new Operaciones().setPersona(votante, idDireccion, conexion);
                        int idPersona = new Operaciones().searchIdPersona(votante, conexion);
                        if (idPersona != -1) {
                            new Operaciones().setVotante(votante, idPersona, conexion);
                        }
                    }
                    conexion.commit();
                    conexion.setAutoCommit(true);
                } catch (SQLException ex) {
                    if (conexion != null) {
                        try {
                            conexion.rollback();
                        } catch (SQLException ex1) {
                            response.sendRedirect("Views/VistaMensajesError.jsp?Mensaje=" + ex1);
                        }
                    }
                } catch (ApplicationErrorException ex) {
                    response.sendRedirect("Views/VistaMensajesError.jsp?Mensaje=" + ex);
                }
                session.setAttribute("MensajeExito", "Se ha dado de alta correctamente. Gracias.");
                response.sendRedirect("index.jsp");
            } else {
                session.setAttribute("MensajeError", "El campo NIF no es válido");
                response.sendRedirect("index.jsp");
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
