/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnod;

/**
 *
 * @author ceciliamarfia
 */
public class Estacionamiento {
    private String direccion;
    private double costoXHora;
    private Vehiculo [][] matriz;
    private int dimS;
    private int dimV;

    public Estacionamiento(String direccion, double costoXHora, int dimS, int dimV) {
        this.direccion = direccion;
        this.costoXHora = costoXHora;
        this.dimS = dimS;
        this.dimV = dimV;
        this.matriz = new Vehiculo[dimS][dimV];
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getCostoXHora() {
        return costoXHora;
    }

    public void setCostoXHora(double costoXHora) {
        this.costoXHora = costoXHora;
    }

    public int getDimS() {
        return dimS;
    }

    public int getDimV() {
        return dimV;
    }
    /* No implemento este método ya que Java lo hace por default
    public void inicializarMatriz(){
        for (int i = 0; i < dimS; i++) {
            for (int j = 0; j < dimV; j++) {
                matriz[i][j]=null;
            }
        }
    }*/
    public void registrarVehiculo(Vehiculo unVehiculo, int sectorX,int sectorY){
        matriz[sectorX-1][sectorY-1]= unVehiculo;
    }
    /*Liberar todos los lugares ocupados por vh de marca M en el sector x del estacionamiento y devolver un String
    con las representaciones de los vh que estaban registrados,para darles avisoque ya no tienen acceso.
    La representacion de un vh tiene el siguiente formato:
    patente:, marca:,modelo:, horas estacionado:*/
    
    public String quitarVh(String marcaM,int sectorX){
        String aux = " ";
        for (int i = 0; i < dimV; i++) {
            if((matriz[sectorX-1][i]!=null)&&(matriz[sectorX-1][i].getMarca().equals(marcaM))){
                aux += matriz[sectorX-1][i].toString();
                matriz[sectorX-1][i] = null;
            }
        }
        return aux;
    }
    
    public double masRecaudado(int sectorX){
        double totalRecaudado =0.0;
        for (int j = 0; j < dimV; j++) {
			if (matriz[sectorX][j] != null) {
				totalRecaudado += matriz[sectorX][j].getCantHorasEstacionado() * costoXHora;
			}
        }
            return totalRecaudado;
        }
    
    public int mayorSector(){
        int mayorSector = -1;
        double mayorRecaudado= -1, max;
        for (int i = 0; i < dimS; i++) {
            max = masRecaudado(i);
            if(max > mayorRecaudado){
                mayorRecaudado = max;
                mayorSector = i+1;
            }
        }
        return mayorSector;
    }
    
    public String toString(){
       String aux= " ";
       aux = "Estacionamiento -  Dirección: "+this.direccion+ " costo por hora: $"+this.costoXHora;
        for (int i = 0; i < dimS; i++) {
            aux += "\n Sector: "+(i+1);
            for (int j = 0; j < dimV; j++) {
                if (matriz[i][j] != null) {
                    aux+="\n Lugar: "+(j+1)+ matriz[i][j].toString();
                }
            }
        }
        return aux;
    }
}
