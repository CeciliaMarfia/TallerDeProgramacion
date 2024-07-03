/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoc;

/**
 *
 * @author ceciliamarfia
 */
public class Venta {
    private int DNI;
    private int cantLt;
    private double monto;
    private String medioDePago;

    public Venta(int DNI, int cantLt, double monto, String medioDePago) {
        this.DNI = DNI;
        this.cantLt = cantLt;
        this.monto = monto;
        this.medioDePago = medioDePago;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getCantLt() {
        return cantLt;
    }

    public void setCantLt(int cantLt) {
        this.cantLt = cantLt;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMedioDePago() {
        return medioDePago;
    }

    public void setMedioDePago(String medioDePago) {
        this.medioDePago = medioDePago;
    }


    @Override
    public String toString() {
        return "Venta{" + "DNI=" + DNI + ", cantLt=" + cantLt + ", monto=" + monto + ", medioDePago=" + medioDePago + '}';
    }
    
    
}
