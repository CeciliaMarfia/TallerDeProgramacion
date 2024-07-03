/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoe;

/**
 *
 * @author ceciliamarfia
 */
public abstract class Banco {

    private String nombre;
    private int cantEmpleados;
    private Cuenta[] vector;
    private int dimF;
    private int dimL;

    public Banco(String nombre, int cantEmpleados, int dimF) {
        this.nombre = nombre;
        this.cantEmpleados = cantEmpleados;
        this.dimF = dimF;
        this.vector = new Cuenta[dimF];
        this.dimL = 0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantEmpleados() {
        return cantEmpleados;
    }

    public void setCantEmpleados(int cantEmpleados) {
        this.cantEmpleados = cantEmpleados;
    }

    public int getDimF() {
        return dimF;
    }

    public int getDimL() {
        return dimL;
    }
    
    private boolean estaLleno() {
        return dimL == dimF;
    }

    public boolean agregarCuenta(Cuenta unaCuenta) {
        boolean ok = false;
        if (!estaLleno()) {
            vector[dimL] = unaCuenta;
            dimL++;
            ok = true;
        }
        return ok;
    }

    public Cuenta obtenerCuenta(int unaCBU) {
        int i = 0;
        boolean encontre = false;
        while ((i < dimL) && (!encontre)) {
            if ((vector[i]!=null) &&(vector[i].compararCBU(unaCBU))){
                encontre = true;
                return vector[i];
            }
            i++;
        }
        return null;
    }

    public void depositarDinero(int unaCBU, double dinero) {
        int i = 0;
        boolean encontre = false;
        while ((i < dimL) && (!encontre)) {
            if (vector[i].getCbu() == unaCBU) {
                encontre = true;
                vector[i].incrementarDinero(dinero);
            }
            i++;
        }
    }

    public abstract boolean puedeRecibirTarjeta(int unaCBU);
    
    
}
