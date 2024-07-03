/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial101023;

/**
 *
 * @author ceciliamarfia
 */
public class Director extends Empleado {
    private double montoViaticos;
    
    //Constructor: Como Director extiende de la clase empleado llamo a la super para obtener sus v.i
    
    public Director(double montoViaticos, String nombre, int DNI, int añoIngreso, double sueldoBasico) {
        super(nombre, DNI, añoIngreso, sueldoBasico);
        this.montoViaticos = montoViaticos;
    }

        //Metodos GETTERS Y SETTERS NECESARIOS
    public double getMontoViaticos() {
        return montoViaticos;
    }

    public void setMontoViaticos(double montoViaticos) {
        this.montoViaticos = montoViaticos;
    }
    
   // El Director recibe el monto destinado a viáticos
    @Override
    public double sueldoACobrar(){
        return super.sueldoACobrar()+ montoViaticos;
    }
    
    @Override
    public String toString(){
        return "\n * Director " + super.toString()+"\n";
    }
}
