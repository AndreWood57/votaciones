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
public class Partido {
    private String nombre;
    private String siglas;
    private String logo;
    private int votos;
    private String eslogan;
    
    public Partido(){
        
    }

    public String getEslogan() {
        return eslogan;
    }

    public void setEslogan(String eslogan) {
        this.eslogan = eslogan;
    }

    public String getNombre() {
        return nombre;
    }

    public String getSiglas() {
        return siglas;
    }

    public String getLogo() {
        return logo;
    }

    public int getVotos() {
        return votos;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setSiglas(String siglas) {
        this.siglas = siglas;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public void setVotos(int votos) {
        this.votos = votos;
    }
    
    
}
