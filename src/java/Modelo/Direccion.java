/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author andre
 */
public class Direccion {

    private int id;
    private String tipo;
    private String nombre;
    private String numero;
    private String portal;
    private String puerta;
    private String piso;
    private String localidad;
    private String provincia;
    private String cp;

    public Direccion() {

    }

    public Direccion(String tipo, String nombre, String numero, String portal, String puerta, String piso, String localidad, String provincia, String cp) {
        this.tipo = tipo;
        this.nombre = nombre;
        this.numero = numero;
        this.portal = portal;
        this.puerta = puerta;
        this.piso = piso;
        this.localidad = localidad;
        this.provincia = provincia;
        this.cp = cp;
    }

    public int getId() {
        return id;
    }

    public String getCp() {
        return cp;
    }

    public String getTipo() {
        return tipo;
    }

    public String getNombre() {
        return nombre;
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

    public void setId(int id) {
        this.id = id;
    }

    public void setCp(String cp) {
        this.cp = cp;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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

}
