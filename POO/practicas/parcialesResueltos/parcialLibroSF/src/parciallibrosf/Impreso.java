/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parciallibrosf;

/**
 *
 * @author ceciliamarfia
 */
public class Impreso extends Libro {
    private boolean tapaDura;

    public Impreso(boolean tapaDura, String titulo, double precioBase) {
        super(titulo, precioBase);
        this.tapaDura = tapaDura;
    }

    public boolean isTapaDura() {
        return tapaDura;
    }

    public void setTapaDura(boolean tapaDura) {
        this.tapaDura = tapaDura;
    }
    
    @Override
    public double precioFinal(){
        return super.precioFinal();
    }
    
     public String toString(){
        return super.toString();
    }
}
