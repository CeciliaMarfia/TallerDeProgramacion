/*
2) Un psicólogo necesita un sistema para organizar su agenda semanal. El sistema
mantiene para c/u de los 5 días de atención y c/u de los 6 turnos (horarios) del día, la
información del paciente que tomó el turno. De los pacientes guarda: nombre, si tiene
obra social y costo a abonar por la sesión.
a)Genere las clases necesarias. Implemente constructores para iniciar: el sistema sin
pacientes; los pacientes a partir de toda su información.
b) Lea atentamente y luego implemente métodos que permitan:
- Agendar al paciente P en el primer día que tenga libre el turno T. Retornar el día
asignado. Asuma que hay un día con dicho turno libre y que T es válido.
- Dado un día D y el nombre de un paciente, liberar el turno ocupado por el paciente en
ese día.
-Calcular y devolver la cantidad de turnos agendados del paciente nombre N.
c)Realice un programa que instancie el sistema. Cargue varios pacientes al sistema.
Libere turnos agendados. Para finalizar, imprima el resultado del inciso b-.iii.
 */
package parcialpsicofm2;

/**
 *
 * @author ceciliamarfia
 */
public class ParcialPsicoFM2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Sistema sistema = new Sistema();
        
        Paciente paciente1 = new Paciente ("Felipe", false,1000);
        sistema.agregarPaciente(paciente1,4,3 );
        Paciente paciente2 = new Paciente ("Juani",true,6000);
        sistema.agregarPaciente(paciente2,1, 1);
        Paciente paciente3 = new Paciente ("Abutina",true,4000);
        sistema.agregarPaciente(paciente3, 2, 4);
        Paciente paciente4 = new Paciente ("Chechu",false,3500);
        sistema.agregarPaciente(paciente4, 2, 6);
        sistema.agregarPaciente(paciente4, 3, 1);
        
        System.out.println("Liberemos al puto fiero de Juani "+sistema.liberarTurno("Juani",1));
        System.out.println("Cantidad de turnos agendados del paciente Chechu: "+sistema.cantTurnosAgendados("Chechu"));
        
    }
    
}
