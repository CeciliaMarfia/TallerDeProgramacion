/*1- La UNLP desea administrar sus proyectos, investigadores y subsidios. Un proyecto
tiene: nombre, código, nombre completo del director y los investigadores que participan
en el proyecto (50 como máximo). De cada investigador se tiene: nombre completo,
categoría (1 a 5) y especialidad. Además, cualquier investigador puede pedir hasta un
máximo de 5 subsidios. De cada subsidio se conoce: el monto pedido, el motivo y si fue
otorgado o no.
i) Implemente el modelo de clases teniendo en cuenta:
a. Un proyecto sólo debería poder construirse con el nombre, código, nombre del
director.
b. Un investigador sólo debería poder construirse con nombre, categoría y
especialidad.
c. Un subsidio sólo debería poder construirse con el monto pedido y el motivo.
Un subsidio siempre se crea en estado no-otorgado.
ii) Implemente los métodos necesarios (en las clases donde corresponda) que permitan:
a. void agregarInvestigador(Investigador unInvestigador);
// agregar un investigador al proyecto.
b. void agregarSubsidio(Subsidio unSubsidio);
// agregar un subsidio al investigador.
c. double dineroTotalOtorgado();
//devolver el monto total otorgado en subsidios del proyecto (tener en cuenta
todos los subsidios otorgados de todos los investigadores)
d. void otorgarTodos(String nombre_completo);
//otorgar todos los subsidios no-otorgados del investigador llamado
nombre_completo
e. String toString();
// devolver un string con: nombre del proyecto, código, nombre del director, el
total de dinero otorgado del proyecto y la siguiente información de cada
investigador: nombre, categoría, especialidad, y el total de dinero de sus
subsidios otorgados.
iii) Escriba un programa que instancie un proyecto con tres investigadores. Agregue dos
subsidios a cada investigador y otorgue los subsidios de uno de ellos. Luego imprima
todos los datos del proyecto en pantalla.
 */
package ej01repaso;

/**
 *
 * @author ceciliamarfia
 */
public class Ej01Repaso {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       
        Investigador investigador1 = new Investigador("Benjamín Rollheiser",2,"Especialidad 1");
        Investigador investigador2 = new Investigador("Mauro Boselli",1,"Especialidad 2");
        Investigador investigador3 = new Investigador("Santiago Ascacibar",5,"Especialidad 3");
        
        Subsidio subsidio1 = new Subsidio(1000, "Motivo 1");
        investigador1.agregarSubsidio(subsidio1);
        Subsidio subsidio2 = new Subsidio(500, "Motivo 2");
        investigador1.agregarSubsidio(subsidio2);
        Subsidio subsidio3 = new Subsidio(800, "Motivo 3");
        investigador2.agregarSubsidio(subsidio3);
        Subsidio subsidio4 = new Subsidio(600, "Motivo 4");
        investigador2.agregarSubsidio(subsidio4);
        Subsidio subsidio5 = new Subsidio(1200, "Motivo 5");
        investigador3.agregarSubsidio(subsidio5);
        Subsidio subsidio6 = new Subsidio(900, "Motivo 6");
        investigador3.agregarSubsidio(subsidio6);
        
        
        
        
        Proyecto proyecto= new Proyecto("Vamos ekipo",221,"Eduardo Domínguez");
        proyecto.agregarInvestigador(investigador1);
        proyecto.agregarInvestigador(investigador2);
        proyecto.agregarInvestigador(investigador3);
        
        proyecto.otorgarTodos("Santiago Ascacibar");
        
        System.out.println(proyecto.toString());
    }
    
}
