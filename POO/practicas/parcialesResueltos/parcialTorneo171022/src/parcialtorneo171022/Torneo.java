/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialtorneo171022;

/**
 *
 * @author ceciliamarfia
 */
public class Torneo {
    private String nombre;
    private Goleador [][] matriz;
    private int dimF;
    private int dimC;
    private int dimL;
    private int [] vector;

    public Torneo(String nombre, int dimF, int dimC) {
        this.nombre = nombre;
        this.dimF = dimF;
        this.dimC = dimC;
        this.dimL = 0;
        this.matriz = new Goleador[dimF][dimC];
        this.vector = new int[dimF];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDimF() {
        return dimF;
    }


    public int getDimC() {
        return dimC;
    }
    
    public int getDimL() {
        return dimL;
    }
   
    private void inicializarVector(){
        for(int i =0; i<this.dimF; i++)
            this.vector[i]=0; 
    }
    
    private boolean estaLleno(){
        return dimL==dimC;
    }
    public void agregarGoleador(Goleador unGoleador, int fechaX){
        if(!estaLleno()){
            matriz[fechaX][vector[fechaX]] = unGoleador;
            vector[fechaX]++;
        }
    }
    
}
