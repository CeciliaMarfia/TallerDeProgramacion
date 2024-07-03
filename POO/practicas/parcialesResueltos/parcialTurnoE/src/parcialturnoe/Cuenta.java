/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoe;

/**
 *
 * @author ceciliamarfia
 */
public class Cuenta {
    private int cbu;
    private String alias;
    private int DNITitutlar;
    private String moneda;
    private double monto;

    public Cuenta(int cbu, String alias, int DNITitutlar, String moneda, double monto) {
        this.cbu = cbu;
        this.alias = alias;
        this.DNITitutlar = DNITitutlar;
        this.moneda = moneda;
        this.monto = 0;
    }

    public int getCbu() {
        return cbu;
    }

    public void setCbu(int cbu) {
        this.cbu = cbu;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public int getDNITitutlar() {
        return DNITitutlar;
    }

    public void setDNITitutlar(int DNITitutlar) {
        this.DNITitutlar = DNITitutlar;
    }

    public String getMoneda() {
        return moneda;
    }

    public void setMoneda(String moneda) {
        this.moneda = moneda;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public void incrementarDinero(double dinero){
        this.monto += dinero;
    }
    
    public boolean compararCBU(int unaCBU){
        return this.cbu == unaCBU;
    }
    
}

    
    