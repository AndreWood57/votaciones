/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Excepciones;

/**
 *
 * @author andre
 */
public class ApplicationErrorException extends Exception {

    private final String msj;
    private final int posicion;
    private final String localizacion;

    /**
     * Creates a new instance of <code>ApplicationErrorException</code> without
     * detail message.
     *
     * @param _msj
     * @param _posicion
     * @param _localizacion
     */
    public ApplicationErrorException(String _msj, int _posicion, String _localizacion) {
        this.msj = _msj;
        this.posicion = _posicion;
        this.localizacion = _localizacion;
    }

    @Override
    public String toString() {
        return "ApplicationErrorException{" + "msj=" + msj + ", posicion=" + posicion + ", localizacion=" + localizacion + '}';
    }

}
