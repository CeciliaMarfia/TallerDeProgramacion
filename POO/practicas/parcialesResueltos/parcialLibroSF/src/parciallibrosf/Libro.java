/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parciallibrosf;

/**
 *
 * @author ceciliamarfia
 */
public abstract class Libro {
    private String titulo;
    private double precioBase;
    private Autor [] vector;
    private int dimF= 8;
    private int dimL;

    public Libro(String titulo, double precioBase) {
        this.titulo = titulo;
        this.precioBase = precioBase;
        this.vector = new Autor [dimF];
        this.dimL = 0;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public double getPrecioBase() {
        return precioBase;
    }

    public void setPrecioBase(double precioBase) {
        this.precioBase = precioBase;
    }

    public int getDimF() {
        return dimF;
    }


    public int getDimL() {
        return dimL;
    }
    
    public void agregarAutor (Autor unAutor){
        vector[dimL]= unAutor;
        dimL++;
    }
    
    public double precioFinal(){
        return this.precioBase * 1.21;
    }
    
    @Override
    public String toString() {
    return "\n Título: " + this.titulo + " Precio Final: $" + Math.round(this.precioFinal() * 100.0) / 100.0 + " Nombre del primer autor: " + vector[0].getNombre();
    }
}
