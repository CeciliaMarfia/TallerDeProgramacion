/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parciallibrosf;

/**
 *
 * @author ceciliamarfia
 */
public class Electronico extends Libro {
    private String formato;
    private double tamaño; //en MB

    public Electronico(String formato, double tamaño, String titulo, double precioBase) {
        super(titulo, precioBase);
        this.formato = formato;
        this.tamaño = tamaño;
    }

    public String getFormato() {
        return formato;
    }

    public void setFormato(String formato) {
        this.formato = formato;
    }

    public double getTamaño() {
        return tamaño;
    }

    public void setTamaño(double tamaño) {
        this.tamaño = tamaño;
    }
    
    @Override
    public double precioFinal(){
        return super.precioFinal()+2.5 * this.getTamaño();
    }
    
    public String toString(){
        return super.toString();
    }
            
}
