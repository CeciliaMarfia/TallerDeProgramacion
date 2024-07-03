/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoh2023;

/**
 *
 * @author ceciliamarfia
 */
public class Concierto {
    private String nombreArtista;
    private double precioEntrada;
    private int cantEntradasVendidas;

    public Concierto(String nombreArtista, double precioEntrada, int cantEntradasVendidas) {
        this.nombreArtista = nombreArtista;
        this.precioEntrada = precioEntrada;
        this.cantEntradasVendidas = cantEntradasVendidas;
    }

    public String getNombreArtista() {
        return nombreArtista;
    }

    public void setNombreArtista(String nombreArtista) {
        this.nombreArtista = nombreArtista;
    }

    public double getPrecioEntrada() {
        return precioEntrada;
    }

    public void setPrecioEntrada(double precioEntrada) {
        this.precioEntrada = precioEntrada;
    }

    public int getCantEntradasVendidas() {
        return cantEntradasVendidas;
    }

    public void setCantEntradasVendidas(int cantEntradasVendidas) {
        this.cantEntradasVendidas = cantEntradasVendidas;
    }
 public double totalRecaudado(){
        return precioEntrada*cantEntradasVendidas;
    }
    @Override
    public String toString() {
        return "\n Nombre del artista: " + nombreArtista + " precio de la entrada:$" + precioEntrada + " cantidad de entradas vendidas: " + cantEntradasVendidas;
    }
    
   
}
