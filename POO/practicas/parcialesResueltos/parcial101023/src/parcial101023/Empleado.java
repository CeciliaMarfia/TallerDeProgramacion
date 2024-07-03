/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial101023;

/**
 *
 * @author ceciliamarfia
 */
public abstract class Empleado {
    private String nombre;
    private int DNI;
    private int añoIngreso;
    private double sueldoBasico;

    public Empleado(String nombre, int DNI, int añoIngreso, double sueldoBasico) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.añoIngreso = añoIngreso;
        this.sueldoBasico = sueldoBasico;
    }

    
    //Metodos GETTERS Y SETTERS NECESARIOS
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getAñoIngreso() {
        return añoIngreso;
    }

    public void setAñoIngreso(int añoIngreso) {
        this.añoIngreso = añoIngreso;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }
    
    public double sueldoACobrar(){
        double sueldo = this.sueldoBasico;
        if((2023 - this.añoIngreso) > 20){
            sueldo = this.sueldoBasico+(this.sueldoBasico *1.1);
        }
        return sueldo;
    }
    
    @Override
    public String toString(){
        return "Nombre: "+this.nombre+" DNI: "+this.DNI+ " Sueldo a cobrar: $"+ Math.round(this.sueldoACobrar()*100.0/100.0);
    }
}