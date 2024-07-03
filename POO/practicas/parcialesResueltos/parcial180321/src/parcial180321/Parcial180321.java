/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial180321;

/**
 *
 * @author ceciliamarfia
 */
public class Parcial180321 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Concurso concurso = new Concurso(2);
        Participante participante1 = new Participante(1111, "Vero", 36);
        Participante participante2 = new Participante(2222, "El ruso", 38);
        Participante participante3 = new Participante(33333, "Gonza", 40);
        Participante participante4 = new Participante(4444, "Ana", 60);
        Pareja pareja1 = new Pareja(participante1, participante2,"Reggaeton");
        concurso.agregarPareja(pareja1);
        Pareja pareja2 = new Pareja(participante3, participante4,"Bachata");
        concurso.agregarPareja(pareja2);

        Pareja parejaMayorDif = concurso.parejaConMayorDiferencia();
        if (parejaMayorDif != null) {
            String nombre1 = parejaMayorDif.getParticipante1().getNombre(), nombre2 = parejaMayorDif.getParticipante2().getNombre();
            System.out.println("Los participantes con más diferencia de edad son: "+ nombre1+ " y "+nombre2);
        } else {
            System.out.println("No se cargó ninguna pareja");
        }

    }
}
