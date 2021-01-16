/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.time.LocalDate;

/**
 *
 * @author andre
 */
public class Administrador extends Persona {

    private String password;
    private int idAdmin;

    public Administrador() {

    }

    public Administrador(String dni, String nombre, String apellidos, String telefono, LocalDate fecha_nac, String email, char sexo, String password) {
        super(dni, nombre, apellidos, telefono, fecha_nac, email, sexo);
        this.password = password;
    }

    public int getIdAdmin() {
        return this.idAdmin;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setIdAdmin(int idAdmin) {
        this.idAdmin = idAdmin;
    }

}
