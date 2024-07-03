/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoc;

/**
 *
 * @author ceciliamarfia
 */
public class Estacion {
    private String direccion;
    private Surtidor [] vector;
    private int dimL;
    private int dimF = 6;//aca porque me dicen cuanto es


    public Estacion(String direccion) {
        this.direccion = direccion;
        this.dimF = 6;
        this.vector = new Surtidor [dimF];
        this.dimL = 0;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

   

    public int getDimL() {
        return dimL;
    }

    public int getDimF() {
        return dimF;
    }
    
    private boolean estaLleno(){
        return dimL==dimF;
    }
    
    public void agregarSurtidor(Surtidor unSurtidor){
        if(!estaLleno()){
            vector[dimL] = unSurtidor;
            dimL++;
        }
    }
    
        public boolean generarVenta(int nroSurtidor, int unDNI, int unaCantidadLt, String unaFormaDePago){
            return vector[nroSurtidor].generarVenta(unDNI,unaCantidadLt,unaFormaDePago);
    }
    
    public int mayorMontoRecaudado(){
        double mayorMonto=-1;
        int surtidorMax = -1;
        for (int i = 0; i < dimL; i++) {
            if(vector[i].montoVendidoxSurtidor()>mayorMonto){
                mayorMonto = vector[i].montoVendidoxSurtidor();
                surtidorMax = i;
            }
        }
        return surtidorMax;
    }

       
    
    @Override
    public String toString(){
        String aux = "Estación de servicio: "+ this.getDireccion()+ " "+ this.getDimL();
        for (int i = 0; i < dimL; i++) {
            aux+=" \n Surtidor: "+(i+1)+"Combustible: "+this.vector[i].getCombustible()+" Precio por litro: $" + this.vector[i].getPrecioXLitro()+ " Ventas: "+this.vector[i].toString();
        }
        return aux;
    }
    
}
