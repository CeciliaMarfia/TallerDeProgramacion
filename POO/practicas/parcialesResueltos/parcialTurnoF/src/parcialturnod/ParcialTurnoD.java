/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialturnod;

/**
 *
 * @author ceciliamarfia
 */
public class ParcialTurnoD {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estacionamiento estacionamiento = new Estacionamiento (" Segurola y habana 4310",100,3,4);
        Vehiculo auto1 = new Vehiculo ("7EC0MIS7E7",3,"Mercedes","110");
        Vehiculo auto2 = new Vehiculo ("7ER0MP1M053L0J373",3,"Audi","320");
        Vehiculo auto3 = new Vehiculo ("0HHH",3,"Audi","02");
        Vehiculo auto4 = new Vehiculo ("V4M0SJU4N1",3,"Mercedes","202");
        Vehiculo auto5 = new Vehiculo ("AYUD4MEL0C0",3,"Toyota","k10");
        Vehiculo auto6 = new Vehiculo ("put4sH4rry",3,"Toyota","k30");
        
        estacionamiento.registrarVehiculo(auto1, 2,1);
        estacionamiento.registrarVehiculo(auto2, 1,2);
        estacionamiento.registrarVehiculo(auto3, 1,1);
        estacionamiento.registrarVehiculo(auto4, 3,2);
        estacionamiento.registrarVehiculo(auto5, 3,3);
        estacionamiento.registrarVehiculo(auto6, 2,2);
        
        System.out.println("Sector que mas recaudo: " + estacionamiento.mayorSector());
        System.out.println(estacionamiento.toString());
        estacionamiento.quitarVh("Mercedes",1);
    }
    
}
   
