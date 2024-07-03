/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoe;

/**
 *
 * @author ceciliamarfia
 */
public class Tradicional extends Banco {

    private String direccion;
    private String localidad;
    private int cantCuentas;

    public Tradicional(String direccion, String localidad, int cantCuentas, String nombre, int cantEmpleados, int dimF) {
        super(nombre, cantEmpleados, dimF);
        this.direccion = direccion;
        this.localidad = localidad;
        this.cantCuentas = 0;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public int getCantCuentas() {
        return cantCuentas;
    }

    public void setCantCuentas(int cantCuentas) {
        this.cantCuentas = cantCuentas;
    }

    private boolean estaLleno() {
        return cantCuentas == 100;
    }

    @Override
    public boolean agregarCuenta(Cuenta unaCuenta) {
        boolean ok = false;
        if (!estaLleno()) {
            super.agregarCuenta(unaCuenta);
            cantCuentas++;
            ok = true;
        }
        return ok;
    }

    @Override
    public boolean puedeRecibirTarjeta(int unaCBU) {
        Cuenta cuenta = super.obtenerCuenta(unaCBU);
        boolean tipoMoneda = cuenta.getMoneda().equals("dolar") && cuenta.getMonto() > 500;
        boolean tipoMoneda2 = cuenta.getMoneda().equals("pesos") && cuenta.getMonto() > 70000;
        return ((cuenta != null) && (tipoMoneda || tipoMoneda2));
    }

}
