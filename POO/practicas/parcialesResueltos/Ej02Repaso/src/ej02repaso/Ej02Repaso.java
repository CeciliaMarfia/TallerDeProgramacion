/*
d) Realice un programa que instancie un estacionamiento con 3 pisos y 3 plazas por piso.
Registre 6 autos en el estacionamiento en distintos lugares.
Muestre la representación String del estacionamiento en consola.
Muestre la cantidad de autos ubicados en la plaza 1.
Lea una patente por teclado e informe si dicho auto se encuentra en el
estacionamiento o no. En caso de encontrarse, la información a imprimir es el piso y
plaza que ocupa.
 */
package ej02repaso;
import PaqueteLectura.Lector;
/**
 *
 * @author ceciliamarfia
 */
public class Ej02Repaso {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estacionamiento estacionamiento = new Estacionamiento("Estacionamiento Lobelos ","P.Sherman, calle wallaby 42, Sidney",800,1800,3,3);
        Auto auto1 = new Auto("Abutina","7777");
        estacionamiento.agregarAuto(auto1, 1, 0);
        Auto auto2 = new Auto ("Chechu","8888");
        estacionamiento.agregarAuto(auto2, 1, 1);
        Auto auto3 = new Auto ("Solci","2222");
        estacionamiento.agregarAuto(auto3, 2, 2);
        Auto auto4 = new Auto ("Paul","1111");
        estacionamiento.agregarAuto(auto4, 0, 2);
        Auto auto5 = new Auto ("Ailu","5555");
        estacionamiento.agregarAuto(auto5, 2, 1);
        Auto auto6 = new Auto ("Valen","4444");
        estacionamiento.agregarAuto(auto6, 2, 0);
        System.out.println(estacionamiento.toString());
        
        System.out.println("");
        
        System.out.println("cantidad de autos ubicados en la plaza 1: "+estacionamiento.contarAutos(1));
        System.out.println("Patente a buscar");
        String patenteABuscar = Lector.leerString();
        System.out.println(estacionamiento.obtenerAuto(patenteABuscar));
    }
    
}
