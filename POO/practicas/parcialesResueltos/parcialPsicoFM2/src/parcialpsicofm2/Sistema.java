/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialpsicofm2;

/**
 *
 * @author ceciliamarfia
 */
public class Sistema {

    private int turnoFila;
    private int diaColumna;
    private Paciente[][] matriz;
    private int vector[];

    public Sistema() {
        this.turnoFila = 6;
        this.diaColumna = 5;
        this.matriz = new Paciente[turnoFila][diaColumna];
        this.vector = new int[turnoFila];
    }

    public int getTurnoFila() {
        return turnoFila;
    }

    public int getDiaColumna() {
        return diaColumna;
    }

 

    /*- Agendar al paciente P en el primer día que tenga libre el turno T. Retornar el día
asignado. Asuma que hay un día con dicho turno libre y que T es válido.*/
    public void agregarPaciente(Paciente unPaciente, int diaD, int turnoT) {
            matriz[turnoT - 1][vector[turnoT-1]] = unPaciente;// con el vector voy manteniendo el orden por eso no uso if previamente
            vector[turnoT-1]++;
    }

//- Dado un día D y el nombre de un paciente, liberar el turno ocupado por el paciente eese día.
    public boolean liberarTurno(String unNombre, int diaD){
        int i=0;
        boolean encontre = false;
        while((i < turnoFila) &&(!encontre)){
            if ((matriz[i][diaD-1]!=null)&&(matriz[i][diaD-1].chequearNombre(unNombre))){
                matriz[i][diaD-1]=null;
                encontre = true;
            }
            i++;
        }
        return encontre;
    }
    
    //Calcular y devolver la cantidad de turnos agendados del paciente nombre N.

    public int cantTurnosAgendados(String unNombre){
        int total = 0;
        for (int i = 0; i < turnoFila; i++) {
            for (int j = 0; j < diaColumna; j++) {
                if((matriz[i][j]!=null)&&(matriz[i][j].chequearNombre(unNombre))){
                    total++;
                }
            }
        }
        return total;
    }
    
    @Override
    public String toString() {
       return "Turno: " + turnoFila + ", Dia: " + diaColumna;
    }


}
