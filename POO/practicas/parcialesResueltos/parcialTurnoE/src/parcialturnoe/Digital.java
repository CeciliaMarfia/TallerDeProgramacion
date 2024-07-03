/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoe;

/**
 *
 * @author ceciliamarfia
 */
public class Digital extends Banco{
    private String web;

    public Digital(String web, String nombre, int cantEmpleados, int dimF) {
        super(nombre, cantEmpleados, dimF);
        this.web = web;
    }

    public String getWeb() {
        return web;
    }

    public void setWeb(String web) {
        this.web = web;
    }
    
    @Override
    public boolean agregarCuenta(Cuenta unaCuenta){
        return super.agregarCuenta(unaCuenta);
    }
    
    @Override
    public boolean puedeRecibirTarjeta(int unaCBU){
        Cuenta cuenta =super.obtenerCuenta(unaCBU);
        return (cuenta != null) && (cuenta.getMoneda().equals("pesos"))&&(cuenta.getMonto()>100000);
    }
    
    
}
