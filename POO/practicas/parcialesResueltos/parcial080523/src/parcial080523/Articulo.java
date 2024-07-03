/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial080523;

/**
 *
 * @author ceciliamarfia
 */
public class Articulo {
    private String descripcion;
    private int rolIdentificador;
    private double montoOfertado;
    private Persona persona;

    public Articulo(String descripcion, int rolIdentificador, double montoOfertado) {
        this.descripcion = descripcion;
        this.rolIdentificador = rolIdentificador;
        this.montoOfertado = montoOfertado;
        this.persona = null;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getRolIdentificador() {
        return rolIdentificador;
    }

    public void setRolIdentificador(int rolIdentificador) {
        this.rolIdentificador = rolIdentificador;
    }

    public double getMontoOfertado() {
        return montoOfertado;
    }

    public void setMontoOfertado(double montoOfertado) {
        this.montoOfertado = montoOfertado;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public void actualizarArticulo(Persona unaPersona, double oferta){
        if(oferta > montoOfertado){
            persona = unaPersona;
            montoOfertado = oferta;
        }
    }

    @Override
    public String toString() {
        return "Articulo{" + "descripcion=" + descripcion + ", rolIdentificador=" + rolIdentificador + ", montoOfertado=" + montoOfertado + ", persona=" + persona + '}';
    }
    
   
    
    
}
