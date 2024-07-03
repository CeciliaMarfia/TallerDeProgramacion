/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej01repaso;

/**
 *
 * @author ceciliamarfia
 */
public class Proyecto {

    private String nombre;
    private int codigo;
    private String nombreDirector;
    private Investigador[] investigadores;
    private int dimL;

    //a. Un proyecto sólo debería poder construirse con el nombre, código, nombre del director.
    public Proyecto(String nombre, int codigo, String nombreDirector) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        this.investigadores = new Investigador[50];
        this.dimL = 0;
    }

    //métodos getters y setters - ver si hay alguno que no debería ir...
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }

    private boolean hayEspacio() {
        return this.dimL < 50;
    }

    //II) a. agregar un investigador al proyecto.
    public void agregarInvestigador(Investigador unInvestigador) {
        if (hayEspacio()) {
            this.investigadores[dimL] = unInvestigador;
            this.dimL++;
        }
    }

    //II) c. devolver el monto total otorgado en subsidios del proyecto 
    //(tener en cuenta todos los subsidios otorgados de todos los investigadores)
    public double dineroTotalOtorgado() {
        double suma = 0;
        for (int i = 0; i < this.dimL; i++) {// que onda poner this.getDIMl()?
            suma += this.investigadores[i].calcularTotalSubOtorgado();// cómo sabe que tiene que ir a este método?
        }
        return suma;
    }

    //II) d. otorgar todos los subsidios no-otorgados del investigador llamado nombre_completo
    public void otorgarTodos(String nombre_completo) {
        int i = 0;
        boolean encontre = false;
        while ((i < this.dimL) && (!encontre)) {
            if (this.investigadores[i].getNombreCompleto().equals(nombre_completo)) {
                encontre = true;
                this.investigadores[i].verSubsidio();

            }

            i++;
        }
    }

    /* devolver un string con: nombre del proyecto, código, nombre del director, el
total de dinero otorgado del proyecto y la siguiente información de cada
investigador: nombre, categoría, especialidad, y el total de dinero de sus
subsidios otorgados.*/
    @Override
    public String toString() {
         String aux = "Nombre del proyecto: " + this.nombre + " \n Código: " + this.codigo + " \n Nombre del director: " + this.nombreDirector + "\n Total de dinero otorgado del proyecto : $" + Math.round(this.dineroTotalOtorgado() * 100.0) / 100.0;
         for (int i = 0; i < this.dimL; i++) {
             System.out.println("Investigador: "+i);
             aux+=this.investigadores[i].toString();
        }
         return aux;
    }
}
