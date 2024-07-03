/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej04repaso;

/**
 *
 * @author ceciliamarfia
 */
class Corista extends Persona {
    private int tonoFundamental;

    public Corista(String nombre, int DNI, int edad, int tonoFundamental) {
        super(nombre, DNI, edad);
        this.tonoFundamental = tonoFundamental;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }

    public void setTonoFundamental(int tonoFundamental) {
        this.tonoFundamental = tonoFundamental;
    }

}