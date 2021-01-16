/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author andre
 */
public class Convocatoria {

    private String tipo;
    private String circunscripcion;
    private int nCargos;
    private LocalDate fecha;
    private String estado;

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Convocatoria() {

    }

    public String getTipo() {
        return tipo;
    }

    public String getCircunscripcion() {
        return circunscripcion;
    }

    public int getnCargos() {
        return nCargos;
    }

    public LocalDate getFecha() {
        return fecha;
    }
    
    public String getFechaEuropeo() {
        DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return fecha.format(formato);
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public void setCircunscripcion(String circunscripcion) {
        this.circunscripcion = circunscripcion;
    }

    public void setnCargos(int nCargos) {
        this.nCargos = nCargos;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

}
