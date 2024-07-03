/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoc;

/**
 *
 * @author ceciliamarfia
 */
public class Surtidor {

    private String combustible;
    private double precioXLitro;
    private Venta[] vector;
    private int dimL;
    private int dimF;

    public Surtidor(String combustible, double precioXLitro, int dimF) { //porque es  me llegara cuando lo instancie
        this.combustible = combustible;
        this.precioXLitro = precioXLitro;
        this.dimF = dimF;
        this.vector = new Venta[dimF];
        this.dimL = 0;
    }

    public String getCombustible() {
        return combustible;
    }

    public void setCombustible(String combustible) {
        this.combustible = combustible;
    }

    public double getPrecioXLitro() {
        return precioXLitro;
    }

    public void setPrecioXLitro(double precioXLitro) {
        this.precioXLitro = precioXLitro;
    }

    public int getDimL() {
        return dimL;
    }

    public int getDimF() {
        return dimF;
    }

    private boolean estaLleno() {
        return dimL == dimF;
    }

//agregarVenta
    public boolean generarVenta(int unDNI, int unaCantidadLt, String unaFormaDePago) {
        boolean pudo = false;
        if (!estaLleno()) {
            vector[dimL] = new Venta(unDNI, unaCantidadLt, (unaCantidadLt * this.precioXLitro), unaFormaDePago);
            dimL++;
            pudo = true;
        }
        return pudo;
    }

    public double montoVendidoxSurtidor() {
        double totalVendido = 0.0;
        for (int i = 0; i < dimL; i++) {
            if (vector[i].getMedioDePago().equals("efectivo")){
                totalVendido += vector[i].getMonto();
            }
        }
        return totalVendido;
    }

    @Override
    public String toString() {
        String aux = " ";
        for (int i = 0; i < dimL; i++) {
            aux += this.vector[i].toString();
        }
        return aux;
    }
}
