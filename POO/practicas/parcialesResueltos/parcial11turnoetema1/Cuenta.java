/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial11turnoetema1;


public class Cuenta {
    private int cbu;
    private String alias;
    private int dni;
    private int moneda;
    private int monto;
    
    public Cuenta (int unCbu, String unAlias, int unDni, int unaMoneda, int unMonto){
        this.setCbu(unCbu);
        this.setAlias(unAlias);
        this.setDni(unDni);
        this.setMoneda(unaMoneda);
        this.setMonto(unMonto);
    }
    
    @Override
    public String toString(){
        return ("CBU " + cbu + ", Alias " + alias + ", DNI " + dni + ", Monedad " + (moneda+1) + ", Monto " + monto);
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

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getMoneda() {
        return moneda;
    }

    public void setMoneda(int moneda) {
        this.moneda = moneda;
    }

    public int getMonto() {
        return monto;
    }

    public void setMonto(int monto) {
        this.monto = monto;
    }
    
}
