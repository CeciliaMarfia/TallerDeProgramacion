/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial101023;

/**
 *
 * @author ceciliamarfia
 */
public class Empresa {

    private String nombre;
    private String direccion;
    private Director director;
    private Encargado[] vector;
    private int dimF;

    //CONSTRUCTOR
    public Empresa(String nombre, String direccion,Director director, int dimF) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.director = director;
        this.dimF = dimF;
        this.vector = new Encargado[dimF];
    }

    //Metodos GETTERS Y SETTERS NECESARIOS
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    public int getDimF() {
        return dimF;
    }

  

    //Asignar un Encargado a la sucursal X. Asuma que X está en rango de 1..N.
    public void asignarEncargado(Encargado unEncargado, int nroSucursal) {
            vector[nroSucursal-1] = unEncargado; 
    }

    /* Retornar un String que represente la empresa, que contenga nombre, dirección, representación del
Director y la representación de los Encargados junto a su número de sucursal. indique si existe
alguna sucursal sin Encargado*/
@Override
public String toString() {
    String aux = "Nombre de la empresa: " + this.nombre+ "\n Dirección: "+ this.direccion +"\n Director/a: "+director.toString()+ "\n";
    aux += " ";
    for (int i = 0; i < dimF; i++) {
        if (vector[i] == null) {
            aux += "Sucursal " + (i + 1) + ": NO HAY ENCARGADO\n";
        } else {
            aux += "Sucursal " + (i + 1) + ":" + vector[i].toString();
        }
    }
    
    return aux;
}
}
