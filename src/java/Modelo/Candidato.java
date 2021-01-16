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
public class Candidato {
    private String nombre;
    private String apellido;
    private String partido;
    private int nLista;
    
    public Candidato(){
        
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getPartido() {
        return partido;
    }

    public int getnLista() {
        return nLista;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setPartido(String partido) {
        this.partido = partido;
    }

    public void setnLista(int nLista) {
        this.nLista = nLista;
    }
    
    
}
