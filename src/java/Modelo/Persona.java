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
public abstract class Persona {

    private int id;
    private String dni;
    private String nombre;
    private String apellidos;
    private String telefono;
    private LocalDate fecha_nac;
    private String email;
    private char sexo;
    private int idDireccion;

    public Persona() {

    }

    public Persona(String dni, String nombre, String apellidos, String telefono, LocalDate fecha_nac, String email, char sexo) {
        this.dni = dni;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.telefono = telefono;
        this.fecha_nac = fecha_nac;
        this.email = email;
        this.sexo = sexo;
    }

    public int getIdDireccion() {
        return idDireccion;
    }

    public String getDni() {
        return dni;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getTelefono() {
        return telefono;
    }

    public LocalDate getFecha_nac() {
        return fecha_nac;
    }

    public String getEmail() {
        return email;
    }

    public char getSexo() {
        return sexo;
    }

    public int getId() {
        return id;
    }

    public void setIdDireccion(int idDir) {
        this.idDireccion = idDir;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setFecha_nac(LocalDate fecha_nac) {
        this.fecha_nac = fecha_nac;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setSexo(char sexo) {
        this.sexo = sexo;
    }

    public void setId(int id) {
        this.id = id;
    }
}
