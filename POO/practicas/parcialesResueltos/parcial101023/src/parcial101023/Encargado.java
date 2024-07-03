/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial101023;

/**
 *
 * @author ceciliamarfia
 */
public class Encargado extends Empleado {
    private int cantEmpleados;

    //Constructor: Como Encargado  extiende de la clase empleado llamo a la super para obtener sus v.i
    public Encargado(int cantEmpleados, String nombre, int DNI, int añoIngreso, double sueldoBasico) {
        super(nombre, DNI, añoIngreso, sueldoBasico);
        this.cantEmpleados = cantEmpleados;
    }
    
     //Metodos GETTERS Y SETTERS NECESARIOS

    public int getCantEmpleados() {
        return cantEmpleados;
    }

    public void setCantEmpleados(int cantEmpleados) {
        this.cantEmpleados = cantEmpleados;
    }
    
    //El Encargado tiene un adicional del 1000 pesos por cada empleado a cargo
    @Override
     public double sueldoACobrar(){
         return super.sueldoACobrar()+ 1000.0*cantEmpleados;
     }
     @Override
    public String toString(){
        return "\n * Encargado: " + super.toString()+"\n";
    }
}
