/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialpsicofm;

/**
 *
 * @author ceciliamarfia
 */
public class Paciente {
    private String nombre;
    private boolean poseeObraSocial;
    private double costoXSesion;

    public Paciente(String nombre, boolean poseeObraSocial, double costoXSesion) {
        this.nombre = nombre;
        this.poseeObraSocial = poseeObraSocial;
        this.costoXSesion = costoXSesion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isPoseeObraSocial() {
        return poseeObraSocial;
    }

    public void setPoseeObraSocial(boolean poseeObraSocial) {
        this.poseeObraSocial = poseeObraSocial;
    }

    public double getCostoXSesion() {
        return costoXSesion;
    }

    public void setCostoXSesion(double costoXSesion) {
        this.costoXSesion = costoXSesion;
    }
    
    
    public boolean compararNombre(String unNombre){
        return this.nombre.equals(unNombre);
    }

    @Override
    public String toString() {
        return "\n Paciente:" + "Nombre: " + nombre + ", posee Obra social: " + poseeObraSocial + ", Costo por sesion: $" + costoXSesion;
    }
   
}
