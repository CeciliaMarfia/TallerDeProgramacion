/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parciallibrosf;

/**
 *
 * @author ceciliamarfia
 */
public class ParcialLibroSF {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Electronico electronico = new Electronico(".PDF",50," Java: el lenguaje mas que pesada esta put* de la historia",100);
        Impreso impreso = new Impreso(true,"Pim Pete",1000);
        
        Autor autor1 = new Autor("Cata");
        electronico.agregarAutor(autor1);
        Autor autor2 = new Autor("Lolo");
        impreso.agregarAutor(autor2);
        Autor autor3 = new Autor("Juanito");
        impreso.agregarAutor(autor3);
        Autor autor4 = new Autor("Vero");
        impreso.agregarAutor(autor4);
        Autor autor5 = new Autor("Mariano");
        electronico.agregarAutor(autor5);
        Autor autor6 = new Autor("Ana");
        electronico.agregarAutor(autor6);
        
        System.out.println("Libro Electronico:"+electronico.toString());
        
        System.out.println("Libro Impreso:"+impreso.toString());
        
    }
    
}
