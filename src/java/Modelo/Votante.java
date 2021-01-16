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
public class Votante extends Persona {

    private int idVotante;
    private String password;
    private char votado;

    public Votante() {

    }

    public Votante(String dni, String nombre, String apellidos, String telefono, LocalDate fecha_nac, String email, char sexo, String password) {
        super(dni, nombre, apellidos, telefono, fecha_nac, email, sexo);
        this.password = password;
        this.votado = 'N';
    }

    public int getIdVotante() {
        return idVotante;
    }

    public String getPassword() {
        return password;
    }

    public char getVotado() {
        return votado;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setVotado(char votado) {
        this.votado = votado;
    }

    public void setIdVotante(int idV) {
        this.idVotante = idV;
    }

}
