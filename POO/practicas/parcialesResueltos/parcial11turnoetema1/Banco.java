/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial11turnoetema1;


public abstract class Banco {
    private String nombre;
    private int cantEmpleados;
    private Cuenta[] cuentas;
    private int dimL = 0;
    
    public Banco(String unNombre, int unaCantidad){
        this.nombre = unNombre;
        this.cantEmpleados = unaCantidad;
        this.cuentas = new Cuenta[cantEmpleados];
    }
    
    public Cuenta obtenerCuenta(int buscado){
        Cuenta cBuscada = null;
        for(int i = 0; i < cantEmpleados; i++){
            if (this.cuentas[i].getCbu() == buscado){
                cBuscada = this.cuentas[i];
            }
        }
        return (cBuscada);
    }
    
    public void deposito(int cantidad, int buscado){
        for (int i = 0; i < cantEmpleados; i++){
            if (this.cuentas[i] != null){
                if (this.cuentas[i].getCbu() == buscado){
                    this.cuentas[i].setMonto(this.cuentas[i].getMonto() + cantidad);
                }
            }
        }
    }
    
    public abstract String puedeRecibir(int buscado);
    
    @Override
    public String toString(){
        String aux = "";
        for (int i = 0; i < cantEmpleados; i++){
            aux = aux + this.cuentas[i].toString() + "\n";
        }
        return aux;
    }
    
    public void setCuenta(Cuenta unaCuenta){
        this.cuentas[dimL] = unaCuenta;
        dimL++;
    }
    
    public Cuenta getCuenta(int i){
        return (this.cuentas[i]);
    }
    
    public boolean hayEspacio(){
        return (dimL < cantEmpleados);
    }
    
    public int getCantEmpleados() {
        return cantEmpleados;
    }

    public void setCantEmpleados(int cantEmpleados) {
        this.cantEmpleados = cantEmpleados;
    }
}
