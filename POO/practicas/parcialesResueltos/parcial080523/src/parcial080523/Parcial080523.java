/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial080523;

import PaqueteLectura.Lector;

/**
 *
 * @author ceciliamarfia
 */
public class Parcial080523 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Subasta subasta = new Subasta(3, 5);

        Articulo articulo1 = new Articulo("aaa", 1,100);
        subasta.agregarArticulo(articulo1,2);
        Articulo articulo2 = new Articulo("bbb",2,100);
        subasta.agregarArticulo(articulo2,2);
        Articulo articulo3 = new Articulo("ccc",3,400);
        subasta.agregarArticulo(articulo3,0);
        Articulo articulo4 = new Articulo("ddd",4,300);
        subasta.agregarArticulo(articulo4,1);
        Articulo articulo5 = new Articulo("eee",5,450);
        subasta.agregarArticulo(articulo5,1);
        
        
        System.out.println("Ingrese el identificador");
        int identificador = Lector.leerInt();
        while (identificador !=0) {
            System.out.println("Nombre del ofertador: ");
            String nombre = Lector.leerString();
            System.out.println("Apellido del ofertador: ");
            String apellido = Lector.leerString();
            System.out.println("DNI del ofertador: ");
            int DNI = Lector.leerInt();
            System.out.println("Ingrese el monto de la oferta:");
            double montoOferta = Lector.leerDouble();
            Persona persona = new Persona(nombre,apellido,DNI);
            subasta.ofertarArticulo(identificador, persona, montoOferta);
            System.out.println("-----------------------------");
            System.out.println("Ingrese el identificador");
            identificador = Lector.leerInt();
        }
        System.out.println("ingrese el id para encontrar la persona con oferta máxima:");
        int id = Lector.leerInt();
        System.out.println("Máximo: "+subasta.calcularMaximo(id).toString());
        
        System.out.println("Ingrese para encontrar el articulo mejor ofertado para la categoría (0-4):");
        int categoria = Lector.leerInt();
        System.out.println("Mejor ofertado:: "+subasta.Oferton(categoria));
    }

}
