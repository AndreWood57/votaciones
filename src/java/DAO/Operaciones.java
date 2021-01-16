/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Excepciones.ApplicationErrorException;
import Modelo.Administrador;
import Modelo.Candidato;
import Modelo.Convocatoria;
import Modelo.Direccion;
import Modelo.Partido;
import Modelo.Persona;
import Modelo.PersonaDireccion;
import Modelo.Votante;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author andre
 */
public class Operaciones {

    public boolean patronNifCorrecto(String nif) {
        Pattern pat = Pattern.compile("[0-9]{7,8}[A-Z a-z]");
        Matcher mat = pat.matcher(nif);
        return mat.matches();
    }

    public boolean existeNIF(String nif, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "SELECT dni FROM persona WHERE dni = ?";
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, nif);
            ResultSet rs = prepSt.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en existeNIF");
        }
    }

    public boolean passwordVotante(String nif, String contrasena, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "SELECT password FROM votante WHERE AES_DECRYPT(password,'cocacola') = ? AND votanteID = (SELECT ID FROM persona WHERE dni = ?)";
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, contrasena);
            prepSt.setString(2, nif);
            ResultSet rs = prepSt.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en nifVotante");
        }
    }

    public boolean passwordAdministrador(String nif, String contrasena, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "SELECT password FROM administrador WHERE AES_DECRYPT(password,'cocacola') = ? AND adminID = (SELECT ID FROM persona WHERE dni = ?)";
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, contrasena);
            prepSt.setString(2, nif);
            ResultSet rs = prepSt.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en nifAdministrador");
        }
    }

    public Convocatoria getConvocatoria(Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "SELECT * FROM convocatoria";
        Convocatoria convocatoria = new Convocatoria();
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            ResultSet rs = prepSt.executeQuery();
            if (rs.next()) {
                convocatoria.setTipo(rs.getString("tipo"));
                convocatoria.setCircunscripcion(rs.getString("circunscripcion"));
                convocatoria.setEstado(rs.getString("estado"));
                convocatoria.setFecha(rs.getDate("fecha_Consulta").toLocalDate());
                convocatoria.setnCargos(rs.getInt("numero_Cargos"));
            }
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en getConvocatoria");
        }
        return convocatoria;
    }

    public int getIdDireccion(String nif, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "SELECT direccionID FROM persona WHERE dni = ?";
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, nif);
            ResultSet rs = prepSt.executeQuery();
            if (rs.next()) {
                return rs.getInt("direccionID");
            }
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en getIdDireccion");
        }
        return -1;
    }

    public Direccion getDireccion(int id, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "SELECT * FROM direccion WHERE ID = ?";
        Direccion direccion;
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setInt(1, id);
            ResultSet rs = prepSt.executeQuery();
            if (rs.next()) {
                direccion = new Direccion();
                direccion.setId(rs.getInt("ID"));
                direccion.setTipo(rs.getString("Tipo"));
                direccion.setNombre(rs.getString("nombre"));
                direccion.setNumero(rs.getString("numero"));
                direccion.setPortal(rs.getString("portal"));
                direccion.setPuerta(rs.getString("puerta"));
                direccion.setPiso(rs.getString("piso"));
                direccion.setLocalidad(rs.getString("localidad"));
                direccion.setProvincia(rs.getString("provincia"));
                direccion.setCp(rs.getString("cp"));
                return direccion;
            }
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en getDireccion");
        }
        return null;
    }

    public Votante getVotante(String nif, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "SELECT * FROM votante INNER JOIN persona ON votante.votanteID = persona.ID WHERE persona.dni = ?";
        Votante votante;
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, nif);
            ResultSet rs = prepSt.executeQuery();
            if (rs.next()) {
                votante = new Votante();
                votante.setId(rs.getInt("persona.ID"));
                votante.setNombre(rs.getString("persona.nombre"));
                votante.setApellidos(rs.getString("persona.apellidos"));
                votante.setDni(nif);
                votante.setTelefono(rs.getString("persona.telefono"));
                votante.setFecha_nac(rs.getDate("persona.fecha_nac").toLocalDate());
                votante.setEmail(rs.getString("persona.correo_e"));
                votante.setSexo(rs.getString("sexo").charAt(0));
                votante.setIdVotante(rs.getInt("votante.ID"));
                votante.setVotado(rs.getString("votado").charAt(0));
                return votante;
            }
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en getDireccion");
        }
        return null;
    }

    public Administrador getAdministrador(String nif, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "SELECT * FROM administrador INNER JOIN persona ON administrador.adminID = persona.ID WHERE persona.dni = ?";
        Administrador admin;
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, nif);
            ResultSet rs = prepSt.executeQuery();
            if (rs.next()) {
                admin = new Administrador();
                admin.setId(rs.getInt("persona.ID"));
                admin.setNombre(rs.getString("persona.nombre"));
                admin.setApellidos(rs.getString("persona.apellidos"));
                admin.setDni(nif);
                admin.setTelefono(rs.getString("persona.telefono"));
                admin.setFecha_nac(rs.getDate("persona.fecha_nac").toLocalDate());
                admin.setEmail(rs.getString("persona.correo_e"));
                admin.setSexo(rs.getString("sexo").charAt(0));
                admin.setIdAdmin(rs.getInt("administrador.ID"));
                return admin;
            }
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en getDireccion");
        }
        return null;
    }

    public ArrayList<Partido> getPartidos(Connection conexion) throws ApplicationErrorException {
        ArrayList<Partido> partidos = new ArrayList();
        String codigoSQL = "SELECT * FROM PARTIDO";
        Partido partido;
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            ResultSet rs = prepSt.executeQuery();
            while (rs.next()) {
                partido = new Partido();
                partido.setNombre(rs.getString("nombre"));
                partido.setSiglas(rs.getString("siglas"));
                partido.setLogo(rs.getString("logo"));
                partido.setVotos(rs.getInt("votos"));
                partido.setEslogan(rs.getString("eslogan"));
                partidos.add(partido);
            }
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en getPartidos");
        }
        return partidos;
    }

    public void setVoto(String siglas, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "UPDATE partido SET votos = votos+1 WHERE siglas = ?";
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, siglas);
            int filas = prepSt.executeUpdate();
            if (filas != 1) {
                throw new ApplicationErrorException("No se ha añadido el voto", 1, "Error en setVoto");
            }
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en setVoto");
        }
    }

    public void setVotado(Votante votante, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "UPDATE votante SET votado = 'Y' WHERE votanteID = ?";
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, "" + votante.getId());
            int filas = prepSt.executeUpdate();
            if (filas != 1) {
                throw new ApplicationErrorException("Usted no ha podido votar", 1, "Error en setVotado");
            }
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en setVotado");
        }
    }

    public void setBaja(Direccion direccion, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "DELETE FROM DIRECCION WHERE ID = ?";
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setInt(1, direccion.getId());
            int filas = prepSt.executeUpdate();
            if (filas != 1) {
                throw new ApplicationErrorException("Persona no dada de baja", 1, "Error en setBaja");
            }
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en setBaja");
        }
    }

    public void setDireccion(Direccion direccion, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "INSERT INTO direccion VALUES (null, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, direccion.getTipo());
            prepSt.setString(2, direccion.getNombre());
            prepSt.setString(3, direccion.getNumero());
            prepSt.setString(4, direccion.getPortal());
            prepSt.setString(5, direccion.getPuerta());
            prepSt.setString(6, direccion.getPiso());
            prepSt.setString(7, direccion.getLocalidad());
            prepSt.setString(8, direccion.getProvincia());
            prepSt.setString(9, direccion.getCp());

            int filas = prepSt.executeUpdate();
            if (filas != 1) {
                throw new ApplicationErrorException("Direccion no añadida", 1, "Error en setDireccion");
            }
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en setDireccion");
        }
    }

    public void setPersona(Votante votante, int idDireccion, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "INSERT INTO persona values (null, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, votante.getDni());
            prepSt.setString(2, votante.getNombre());
            prepSt.setString(3, votante.getApellidos());
            prepSt.setString(4, votante.getTelefono());
            prepSt.setDate(5, Date.valueOf(votante.getFecha_nac()));
            prepSt.setString(6, votante.getEmail());
            if (votante.getSexo() == 'M') {
                prepSt.setInt(7, 1);
            } else {
                prepSt.setInt(7, 2);
            }
            prepSt.setInt(8, idDireccion);
            int filas = prepSt.executeUpdate();
            if (filas != 1) {
                throw new ApplicationErrorException("Persona no añadida", 1, "Error en setPersona");
            }
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en setPersona");
        }
    }

    public void setVotante(Votante votante, int idPersona, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "INSERT INTO votante VALUES (null, ?, AES_ENCRYPT(?,'cocacola'), 'N')";
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setInt(1, idPersona);
            prepSt.setString(2, votante.getPassword());

            int filas = prepSt.executeUpdate();
            if (filas != 1) {
                throw new ApplicationErrorException("Votante no añadido", 1, "Error en setVotante");
            }
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en setVotante");
        }
    }

    public int searchIdDireccion(Direccion direccion, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "SELECT ID FROM direccion WHERE Tipo = ? AND nombre = ?";
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, direccion.getTipo());
            prepSt.setString(2, direccion.getNombre());
            ResultSet rs = prepSt.executeQuery();
            if (rs.next()) {
                return rs.getInt("ID");
            }
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en searchIdDireccion");
        }
        return -1;
    }

    public int searchIdPersona(Votante votante, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "SELECT ID FROM persona WHERE dni = ?";
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, votante.getDni());
            ResultSet rs = prepSt.executeQuery();
            if (rs.next()) {
                return rs.getInt("ID");
            }
        } catch (SQLException ex) {
            String mensajeError = ex.getMessage();
            int codigoError = ex.getErrorCode();
            throw new ApplicationErrorException(mensajeError, codigoError, "Error en searchIdPersona");
        }
        return -1;
    }

    public void updateDireccion(String nif, Direccion direccion, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "UPDATE DIRECCION SET Tipo = ?, nombre = ?, numero = ?, portal = ?, piso = ?, localidad = ?, provincia = ?, cp = ? WHERE ID = (SELECT direccionID FROM PERSONA WHERE dni = ?)";
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, direccion.getTipo());
            prepSt.setString(2, direccion.getNombre());
            prepSt.setString(3, direccion.getNumero());
            prepSt.setString(4, direccion.getPortal());
            prepSt.setString(5, direccion.getPiso());
            prepSt.setString(6, direccion.getLocalidad());
            prepSt.setString(7, direccion.getProvincia());
            prepSt.setString(8, direccion.getCp());
            prepSt.setString(9, nif);

            int fila = prepSt.executeUpdate();
        } catch (SQLException ex) {
            String MensajeError = ex.getMessage();
            int CodigoError = ex.getErrorCode();
            throw new ApplicationErrorException(MensajeError, CodigoError, "Error en operaciones actualizarDireccion");
        } catch (Exception ex) {
            String MensajeError = ex.getMessage();
            throw new ApplicationErrorException(MensajeError, 1, "Error en operaciones actualizarDireccion");
        }
    }

    public void updatePersona(String nif, Persona votante, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "UPDATE PERSONA SET nombre = ?, apellidos = ?, telefono = ?, fecha_nac = ?, correo_e = ?, sexo = ? WHERE dni = ?";

        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, votante.getNombre());
            prepSt.setString(2, votante.getApellidos());
            prepSt.setString(3, votante.getTelefono());
            prepSt.setDate(4, Date.valueOf(votante.getFecha_nac()));
            prepSt.setString(5, votante.getEmail());
            prepSt.setString(6, votante.getSexo() + "");
            prepSt.setString(7, nif);

            int filas = prepSt.executeUpdate();
        } catch (SQLException ex) {
            String MensajeError = ex.getMessage();
            int CodigoError = ex.getErrorCode();
            throw new ApplicationErrorException(MensajeError, CodigoError, "Error en operaciones updatePersona");
        } catch (Exception ex) {
            String MensajeError = ex.getMessage();
            throw new ApplicationErrorException(MensajeError, 1, "Error en operaciones actualizarDireccion");
        }
    }

    public void updateVotante(String nif, Votante votante, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "UPDATE VOTANTE SET password = AES_ENCRYPT(?,'cocacola') WHERE votanteID = (SELECT ID FROM PERSONA WHERE dni = ?)";

        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, votante.getPassword());
            prepSt.setString(2, nif);
            int filas = prepSt.executeUpdate();

        } catch (SQLException ex) {
            String MensajeError = ex.getMessage();
            int CodigoError = ex.getErrorCode();
            throw new ApplicationErrorException(MensajeError, CodigoError, "Error en operaciones actualizarVotante");
        } catch (Exception ex) {
            String MensajeError = ex.getMessage();
            throw new ApplicationErrorException(MensajeError, 1, "Error en operaciones actualizarDireccion");
        }

    }

    public void updateAdministrador(String nif, Administrador administrador, Connection conexion) throws ApplicationErrorException {
        String codigoSQL = "UPDATE ADMINISTRADOR SET password = AES_ENCRYPT(?,'cocacola') WHERE adminID = (SELECT ID FROM PERSONA WHERE dni = ?)";

        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, administrador.getPassword());
            prepSt.setString(2, nif);
            int filas = prepSt.executeUpdate();

        } catch (SQLException ex) {
            String MensajeError = ex.getMessage();
            int CodigoError = ex.getErrorCode();
            throw new ApplicationErrorException(MensajeError, CodigoError, "Error en operaciones actualizarVotante");
        } catch (Exception ex) {
            String MensajeError = ex.getMessage();
            throw new ApplicationErrorException(MensajeError, 1, "Error en operaciones actualizarDireccion");
        }

    }

    public ArrayList<Partido> traerPartidos(Connection conexion) throws ApplicationErrorException {
        ArrayList<Partido> partidos = new ArrayList();
        String codigoSQL = "SELECT * FROM PARTIDO";
        Partido partido;

        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            ResultSet rs = prepSt.executeQuery();
            while (rs.next()) {
                partido = new Partido();
                partido.setNombre(rs.getString("nombre"));
                partido.setSiglas(rs.getString("siglas"));
                partido.setLogo(rs.getString("logo"));
                partido.setVotos(rs.getInt("votos"));
                partidos.add(partido);
            }
        } catch (SQLException ex) {
            String MensajeError = ex.getMessage();
            int CodigoError = ex.getErrorCode();
            throw new ApplicationErrorException(MensajeError, CodigoError, "Error en operaciones traerPartidos");
        }

        return partidos;
    }

    public ArrayList<Candidato> traerCandidatos(Connection conexion, ArrayList<Partido> partidos, Convocatoria convocatoria) throws ApplicationErrorException {
        ArrayList<Candidato> candidatosSeleccionados = new ArrayList();
        Candidato candidato;
        String codigoSQL;
        int i = 0;

        int nEscanosPP = 0;
        int nEscanosPSOE = 0;
        int nEscanosVOX = 0;
        int nEscanosUP = 0;
        int nEscanosCS = 0;

        while (i < convocatoria.getnCargos()) {
            Collections.sort(partidos, (Partido p1, Partido p2) -> new Integer(p2.getVotos()).compareTo(p1.getVotos()));
            if (partidos.get(0).getVotos() > 2) {
                partidos.get(0).setVotos(partidos.get(0).getVotos() / 2);
                switch (partidos.get(0).getSiglas()) {
                    case "PP":
                        nEscanosPP++;
                        break;
                    case "PSOE":
                        nEscanosPSOE++;
                        break;
                    case "CS":
                        nEscanosCS++;
                        break;
                    case "VOX":
                        nEscanosVOX++;
                        break;
                    case "UP":
                        nEscanosUP++;
                        break;
                    default:
                        break;
                }
            }
            i++;
        }

        codigoSQL = "SELECT persona.nombre, persona.apellidos, partido.siglas, candidato.numeroLista FROM partido INNER JOIN candidato ON partido.ID = candidato.partidoID INNER JOIN persona ON persona.ID = candidato.candidatoID WHERE partido.siglas = ? LIMIT ?";
        if (nEscanosPP != 0) {
            try {
                PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
                prepSt.setString(1, "PP");
                prepSt.setInt(2, nEscanosPP);
                ResultSet rs = prepSt.executeQuery();
                while (rs.next()) {
                    candidato = new Candidato();
                    candidato.setNombre(rs.getString("nombre"));
                    candidato.setApellido(rs.getString("apellidos"));
                    candidato.setPartido(rs.getString("siglas"));
                    candidato.setnLista(rs.getInt("numeroLista"));
                    candidatosSeleccionados.add(candidato);
                }
            } catch (SQLException ex) {
                String MensajeError = ex.getMessage();
                int CodigoError = ex.getErrorCode();
                throw new ApplicationErrorException(MensajeError, CodigoError, "Error en operaciones nEscanosPP");
            }
        }
        if (nEscanosPSOE != 0) {
            try {
                PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
                prepSt.setString(1, "PSOE");
                prepSt.setInt(2, nEscanosPSOE);
                ResultSet rs = prepSt.executeQuery();
                while (rs.next()) {
                    candidato = new Candidato();
                    candidato.setNombre(rs.getString("nombre"));
                    candidato.setApellido(rs.getString("apellidos"));
                    candidato.setPartido(rs.getString("siglas"));
                    candidato.setnLista(rs.getInt("numeroLista"));
                    candidatosSeleccionados.add(candidato);
                }
            } catch (SQLException ex) {
                String MensajeError = ex.getMessage();
                int CodigoError = ex.getErrorCode();
                throw new ApplicationErrorException(MensajeError, CodigoError, "Error en operaciones nEscanosPSOE");
            }
        }
        if (nEscanosVOX != 0) {
            try {
                PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
                prepSt.setString(1, "VOX");
                prepSt.setInt(2, nEscanosVOX);
                ResultSet rs = prepSt.executeQuery();
                while (rs.next()) {
                    candidato = new Candidato();
                    candidato.setNombre(rs.getString("nombre"));
                    candidato.setApellido(rs.getString("apellidos"));
                    candidato.setPartido(rs.getString("siglas"));
                    candidato.setnLista(rs.getInt("numeroLista"));
                    candidatosSeleccionados.add(candidato);
                }
            } catch (SQLException ex) {
                String MensajeError = ex.getMessage();
                int CodigoError = ex.getErrorCode();
                throw new ApplicationErrorException(MensajeError, CodigoError, "Error en operaciones nEscanosVOX");
            }
        }
        if (nEscanosUP != 0) {
            try {
                PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
                prepSt.setString(1, "UP");
                prepSt.setInt(2, nEscanosUP);
                ResultSet rs = prepSt.executeQuery();
                while (rs.next()) {
                    candidato = new Candidato();
                    candidato.setNombre(rs.getString("nombre"));
                    candidato.setApellido(rs.getString("apellidos"));
                    candidato.setPartido(rs.getString("siglas"));
                    candidato.setnLista(rs.getInt("numeroLista"));
                    candidatosSeleccionados.add(candidato);
                }
            } catch (SQLException ex) {
                String MensajeError = ex.getMessage();
                int CodigoError = ex.getErrorCode();
                throw new ApplicationErrorException(MensajeError, CodigoError, "Error en operaciones nEscanosUP");
            }
        }
        if (nEscanosCS != 0) {
            try {
                PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
                prepSt.setString(1, "CS");
                prepSt.setInt(2, nEscanosCS);
                ResultSet rs = prepSt.executeQuery();
                while (rs.next()) {
                    candidato = new Candidato();
                    candidato.setNombre(rs.getString("nombre"));
                    candidato.setApellido(rs.getString("apellidos"));
                    candidato.setPartido(rs.getString("siglas"));
                    candidato.setnLista(rs.getInt("numeroLista"));
                    candidatosSeleccionados.add(candidato);
                }
            } catch (SQLException ex) {
                String MensajeError = ex.getMessage();
                int CodigoError = ex.getErrorCode();
                throw new ApplicationErrorException(MensajeError, CodigoError, "Error en operaciones nEscanosCS");
            }
        }

        return candidatosSeleccionados;
    }

    public void cambiaEstado(Connection conexion, String estado) throws ApplicationErrorException {
        String codigoSQL = "UPDATE CONVOCATORIA SET estado = ?";
        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            prepSt.setString(1, estado);
            int filas = prepSt.executeUpdate();
        } catch (SQLException ex) {
            String MensajeError = ex.getMessage();
            int CodigoError = ex.getErrorCode();
            throw new ApplicationErrorException(MensajeError, CodigoError, "Error en operaciones cambiarEstado");
        }
    }

    public ArrayList<PersonaDireccion> listarVotante(Connection conexion) throws ApplicationErrorException {

        ArrayList<PersonaDireccion> votantes = new ArrayList();
        PersonaDireccion pd;

        String codigoSQL = "SELECT persona.dni, persona.nombre, persona.apellidos, persona.telefono, persona.fecha_nac, persona.correo_e, persona.sexo, direccion.tipo, direccion.nombre AS nombreDir, direccion.numero, direccion.portal, direccion.puerta, direccion.piso, direccion.localidad, direccion.provincia, direccion.cp, votante.votado\n"
                + "FROM persona\n"
                + "INNER JOIN direccion ON persona.direccionID = direccion.ID\n"
                + "INNER JOIN votante ON votante.votanteID = persona.ID";

        try {
            PreparedStatement prepSt = conexion.prepareStatement(codigoSQL);
            ResultSet rs = prepSt.executeQuery();
            while (rs.next()) {
                pd = new PersonaDireccion();
                pd.setDni(rs.getString("dni"));
                pd.setNombre(rs.getString("nombre"));
                pd.setApellidos(rs.getString("apellidos"));
                pd.setTelefono(rs.getString("telefono"));
                Date fecha = rs.getDate("fecha_nac");
                LocalDate fechanac = fecha.toLocalDate();
                pd.setFecha_nac(fechanac);
                pd.setEmail(rs.getString("correo_e"));
                pd.setSexo(rs.getString("sexo").charAt(0));
                pd.setTipo(rs.getString("tipo"));
                pd.setTipo(rs.getString("Tipo"));
                pd.setNombreDir(rs.getString("nombreDir"));
                pd.setNumero(rs.getString("numero"));
                pd.setPortal(rs.getString("portal"));
                pd.setPuerta(rs.getString("puerta"));
                pd.setPiso(rs.getString("piso"));
                pd.setLocalidad(rs.getString("localidad"));
                pd.setProvincia(rs.getString("provincia"));
                pd.setCp(rs.getString("cp"));
                pd.setVotado(rs.getString("votado").charAt(0));
                votantes.add(pd);
            }

        } catch (SQLException ex) {
            String MensajeError = ex.getMessage();
            int CodigoError = ex.getErrorCode();
            throw new ApplicationErrorException(MensajeError, CodigoError, "Error en operaciones realizarVoto");
        }

        return votantes;
    }
}
