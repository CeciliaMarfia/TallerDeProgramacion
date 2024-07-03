/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej04repaso;

/**
 *
 * @author ceciliamarfia
 */
class Director extends Persona {
    private int antiguedad;

    public Director(String nombre, int DNI, int edad, int antiguedad) {
        super(nombre, DNI, edad);
        this.antiguedad = antiguedad;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
}