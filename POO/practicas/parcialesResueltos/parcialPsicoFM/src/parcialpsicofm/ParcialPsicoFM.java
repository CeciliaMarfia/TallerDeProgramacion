/*
1) Un psicólogo necesita un sistema para organizar su agenda semanal. El sistema
mantiene para c/u de los 5 días de atención y c/u de los 6 turnos (horarios) del día, la
información del paciente que tomó el turno. De los pacientes guarda: nombre, si tiene
obra social y costo a abonar por la sesión.
a)Genere las clases necesarias. Implemente constructores para iniciar: el sistema sin
pacientes; los pacientes a partir de toda su información.
b)Lea atentamente y luego implemente métodos que permitan:
- Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son
válidos.
- Dado el nombre de un paciente, liberar todos sus turnos.
- Dado un día D y el nombre de un paciente, devolver si el paciente tiene agendado un
turno ese día. Asuma que D es válido.
C) Realice un programa que instancie el sistema. Cargue varios pacientes al sistema.
Libere turnos agendados. Para finalizar, imprima el resultado del inciso b-.iii
 */
package parcialpsicofm;

/**
 *
 * @author ceciliamarfia
 */
public class ParcialPsicoFM {

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
        Paciente paciente4 = new Paciente ("Chechu",false,2500);
        sistema.agregarPaciente(paciente4, 2, 6);
       
        if(sistema.liberarTurno("Abutina")){
            System.out.println("Se liberaron los turnos ");
        }else
            System.out.println("No se liberaron los turnos");
        
        if(sistema.tieneTurno("Felipe", 4)){
            System.out.println("pimm pete,Tiene turno!");
        }else
            System.out.println("Oh!, no tiene turno :(");
    }
    
}
