/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialturnoc2022tema2;

/**
 *
 * @author ceciliamarfia
 */
public class ParcialTurnoC2022tema2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Funcion funcion = new Funcion("Este es el papel lamentable que estas haciendo", "11/10",1400,3,5);
       funcion.ocuparButaca(1, 1);
       funcion.ocuparButaca(1, 2);
       funcion.ocuparButaca(1, 3);
       funcion.ocuparButaca(2, 1);
       funcion.ocuparButaca(2, 2);
       
       funcion.desocuparButaca(2);
       funcion.representacion(1);
       
        System.out.println(funcion.toString());

       
    }
    
}
