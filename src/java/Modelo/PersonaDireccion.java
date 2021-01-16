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
public class PersonaDireccion {

    private String dni;
    private String nombre;
    private String apellidos;
    private String telefono;
    private LocalDate fecha_nac;
    private String email;
    private char sexo;

    private String tipo;
    private String nombreDir;
    private String numero;
    private String portal;
    private String puerta;
    private String piso;
    private String localidad;
    private String provincia;
    private String cp;

    private char votado;

    public PersonaDireccion() {

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

    public String getTipo() {
        return tipo;
    }

    public String getNombreDir() {
        return nombreDir;
    }

    public String getNumero() {
        return numero;
    }

    public String getPortal() {
        return portal;
    }

    public String getPuerta() {
        return puerta;
    }

    public String getPiso() {
        return piso;
    }

    public String getLocalidad() {
        return localidad;
    }

    public String getProvincia() {
        return provincia;
    }

    public String getCp() {
        return cp;
    }

    public char getVotado() {
        return votado;
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

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public void setNombreDir(String nombreDir) {
        this.nombreDir = nombreDir;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public void setPortal(String portal) {
        this.portal = portal;
    }

    public void setPuerta(String puerta) {
        this.puerta = puerta;
    }

    public void setPiso(String piso) {
        this.piso = piso;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public void setCp(String cp) {
        this.cp = cp;
    }

    public void setVotado(char votado) {
        this.votado = votado;
    }

}
