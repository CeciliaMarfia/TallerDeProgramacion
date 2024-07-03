/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial11turnoetema1;


public class Tradicional extends Banco{
    private String direccion;
    private String localidad;
    private int enDolares;
    
    public Tradicional (String unNombre, int unaCantidad, String unaDireccion, String unaLocalidad){
        super(unNombre,unaCantidad);
        this.direccion = unaDireccion;
        this.localidad = unaLocalidad;
        this.enDolares = 0;
    }
    
    public boolean agregarCuenta(Cuenta unaCuenta){
        boolean sePuede = false;
        if (hayEspacio()) {
            if (unaCuenta.getMoneda() == 0){
                setCuenta(unaCuenta);
                sePuede = true;
            } else if (enDolares < 100){
                setCuenta(unaCuenta);
                sePuede = true;
            } 
        }
        return (sePuede);
    }
    
    @Override
    public String puedeRecibir(int buscado){
        String aux = "-";
        for(int i = 0; i < this.getCantEmpleados(); i++){
            if (this.getCuenta(i).getCbu() == buscado){
                if ((this.getCuenta(i).getMoneda() == 0)&(this.getCuenta(i).getMonto() > 70000)){
                    aux = aux + "La cuenta " + buscado + ", esta habilitada \n";
                } else if ((this.getCuenta(i).getMoneda() == 1)&(this.getCuenta(i).getMonto() > 500)) {
                    aux = aux + "La cuenta " + buscado + ", esta habilitada \n";
                }
            }
        }
        return aux;
    }

}
