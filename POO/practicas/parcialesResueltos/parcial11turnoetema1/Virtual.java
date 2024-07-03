/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial11turnoetema1;


public class Virtual extends Banco{
    private String pagina;
    
    public Virtual(String unNombre, int unaCantidad, String unLink){
        super(unNombre,unaCantidad);
        this.pagina = unLink;
    }
    
    @Override
    public String puedeRecibir(int buscado){
        String aux = "Nadie esta habilitado";
        for (int i = 0; i < this.getCantEmpleados(); i++){
            if (this.getCuenta(i).getCbu() == buscado){
                if ((this.getCuenta(i).getMoneda() == 1)&(this.getCuenta(i).getMonto() > 100000)){
                    aux = "La cuenta " + buscado + ", puede recibir";
                }
            }
        }
        return aux;
    }
}
