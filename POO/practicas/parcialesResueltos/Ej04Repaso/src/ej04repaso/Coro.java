/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej04repaso;

/**
 *
 * @author ceciliamarfia
 */
public abstract class Coro {
    private String nombre;
    private Director director;


    public Coro(String nombre, Director director,int dimF) {
        this.nombre = nombre;
        this.director = director;
    }
    
    public abstract void agregarCorista( Corista unCorista);    
    
    public abstract String stringDeLaFormacion();
    
    //nombre del coro, todos los datos del director y todos los datos de todos los coristas
    @Override
    public String toString(){
        return "Nombre: "+nombre+ "\n Director: "+director.toString()+stringDeLaFormacion();
    }
}
