    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialturnoh2023;

/**
 *
 * @author ceciliamarfia
 */
public class ParcialTurnoH2023 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estadio estadio = new Estadio("Estadio Monumental","en la conxa de tu hermana",1000);
        
        Concierto concierto1 = new Concierto("Miranda", 100,80);
        estadio.registrarConcierto(concierto1, 1);
        Concierto concierto2 = new Concierto("Maria Becerra", 300,50);
        estadio.registrarConcierto(concierto2, 5);
        Concierto concierto3 = new Concierto("Tini", 500,70);
        estadio.registrarConcierto(concierto3, 5);
        Concierto concierto4 = new Concierto("Andres Calamaro", 200,30);
        estadio.registrarConcierto(concierto4, 10);
        
        System.out.println("Conciertos para el mes de Mayo:"+estadio.listarConciertos(5));
        System.out.println("Recaudación de Mayo:$"+Math.round(estadio.calcularRecaudacion(5)*100.0/100.0));
        System.out.println(estadio.toString());
    }
    
}
