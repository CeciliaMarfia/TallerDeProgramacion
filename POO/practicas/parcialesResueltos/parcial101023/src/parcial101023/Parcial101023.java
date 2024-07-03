/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial101023;

/**
 *
 * @author ceciliamarfia
 */
public class Parcial101023 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Director director = new Director(1000,"El negro de the weeknd",666,2000,5000);
        Empresa empresa = new Empresa("Worthy group of friends","calle falsa 123",director,5);
        
        Encargado encargado1 = new Encargado(3, "TuVieja",111,2005,100);
        empresa.asignarEncargado(encargado1, 3);
        Encargado encargado2 = new Encargado(5, "TuHermana",555,1998,150);
        empresa.asignarEncargado(encargado2,1);
        Encargado encargado3 = new Encargado( 2, "LaAmigaDeTuhHermana",777,2000,150);
        empresa.asignarEncargado(encargado3, 4);
        
        System.out.println(empresa.toString());
    }
    
}
