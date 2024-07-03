/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialturnoe;

/**
 *
 * @author ceciliamarfia
 */
public class ParcialTurnoE {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Tradicional tradicional = new Tradicional("frente al sanvicente","Varela",3,"YYY",2,5);
        Digital digital = new Digital(" 1 y 55 ","Bosque",3,3);
        
        Cuenta cuenta1 = new Cuenta (11,"piba.corea.tarta",111,"pesos",100);
        tradicional.agregarCuenta(cuenta1);
        Cuenta cuenta2 = new Cuenta (22,"taza.galletita.merienda",222,"pesos",200);
        tradicional.agregarCuenta(cuenta2);
        Cuenta cuenta3 = new Cuenta (33,"aaa.bbb.ccc",333,"pesos",300);
        tradicional.agregarCuenta(cuenta3);
        Cuenta cuenta4 = new Cuenta (44,"pasameplata",444,"pesos",400);
        tradicional.agregarCuenta(cuenta4);
        
        Cuenta cuenta5 = new Cuenta (55,"brisho.y.sustancia",555,"pesos",500);
        digital.agregarCuenta(cuenta5);
        Cuenta cuenta6 = new Cuenta (66,"pasameplata",666,"pesos",600);
        digital.agregarCuenta(cuenta6);
        
       digital.depositarDinero(55, 100);
       digital.puedeRecibirTarjeta(55);
       // System.out.println(digital.puedeRecibirTarjeta(10)); para chequear
    }
    
}
