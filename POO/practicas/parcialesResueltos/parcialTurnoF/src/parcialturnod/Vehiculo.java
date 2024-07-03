/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnod;

/**
 *
 * @author ceciliamarfia
 */
public class Vehiculo {
    private String patente;
    private int cantHorasEstacionado;
    private String marca;
    private String modelo;

    public Vehiculo(String patente, int cantHorasEstacionado, String marca, String modelo) {
        this.patente = patente;
        this.cantHorasEstacionado = cantHorasEstacionado;
        this.marca = marca;
        this.modelo = modelo;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public int getCantHorasEstacionado() {
        return cantHorasEstacionado;
    }

    public void setCantHorasEstacionado(int cantHorasEstacionado) {
        this.cantHorasEstacionado = cantHorasEstacionado;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    @Override
    public String toString(){
        return "\n patente: "+patente+", marca: "+marca +", modelo: "+ modelo+", horas estacionado: "+ cantHorasEstacionado;
    }
    
}
