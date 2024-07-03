/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej02repaso;

/**
 *
 * @author ceciliamarfia
 */
public class Auto {
    private String dueño;
    private String patente;

    public Auto(String dueño, String patente) {
        this.dueño = dueño;
        this.patente = patente;
    }
    
    

    public String getDueño() {
        return dueño;
    }

    public void setDueño(String dueño) {
        this.dueño = dueño;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    @Override
    public String toString() {
        return " Dueño: " + this.dueño + ", patente:" + this.patente;
    }
    
    
}
