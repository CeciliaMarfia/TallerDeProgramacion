/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoc2022tema2;

/**
 *
 * @author ceciliamarfia
 */
public class Butaca {
    private String descriptor;
    private double precio;
    private boolean estado;

    public Butaca(String descriptor, double precio, boolean estado,int nro_fila_de_la_butaca) {
        this.descriptor = descriptor;
        this.precio = precio;
        this.estado = estado;
    }

    public String getDescriptor() {
        return descriptor;
    }

    public void setDescriptor(String descriptor) {
        this.descriptor = descriptor;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    
    public void ocuparLa(){
        estado=true;
    }
    
    public void desOcuparla(){
        estado=false;
    }
    
    @Override
    public String toString(){
        return "\n Descriptor: "+this.descriptor+"Precio: $"+ this.precio+" Estado: "+this.estado;
    }
    
}
