package ej03repaso;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */


/**
 *
 * @author ceciliamarfia
 */
public class Ej03Repaso {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
/*d) Realice un programa que instancie un evento ocasional y una gira, cargando la
información necesaria. Luego, para ambos, imprima el costo e invoque al mensaje actuar.*/
    EventoOcasional evento = new EventoOcasional ("Show privado", "Juani Towers","01/02","Los Palmeras",6);
    Gira gira = new Gira("The Eras Tour",911,3,"La Taylor",5);
    
    Fecha fecha1 = new Fecha("Tero violado",15);
    gira.agregarFecha(fecha1);
    Fecha fecha2 = new Fecha("Carpincho Aplastado",7);
    gira.agregarFecha(fecha2);
    Fecha fecha3 = new Fecha("Sapo quemado",5);
    gira.agregarFecha(fecha3);
    Fecha fecha4 = new Fecha("Vaca Muerta",12);
    gira.agregarFecha(fecha4);
    
        System.out.println("Costo: $"+Math.round(evento.calcularCosto()*100.0)/100.0);
        evento.actuar();
        System.out.println("------------------------");
        System.out.println("Costo: $"+Math.round(gira.calcularCosto()*100.0)/100.0);
        gira.actuar();
    }
    
}
