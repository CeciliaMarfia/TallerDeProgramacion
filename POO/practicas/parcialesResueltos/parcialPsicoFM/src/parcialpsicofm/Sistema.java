/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialpsicofm;

/**
 *
 * @author ceciliamarfia
 */
public class Sistema {

    private int turnoFila;
    private int diaColumna;
    private Paciente[][] matriz;
    private String infoPaciente;

    public Sistema() {
        this.turnoFila = 6;
        this.diaColumna = 5;
        this.matriz = new Paciente[turnoFila][diaColumna];
        inicializarMatriz();
        this.infoPaciente = infoPaciente;
    }

    public int getTurnoFila() {
        return turnoFila;
    }

    public int getDiaColumna() {
        return diaColumna;
    }

    public String getInfoPaciente() {
        return infoPaciente;
    }

    public void setInfoPaciente(String infoPaciente) {
        this.infoPaciente = infoPaciente;
    }

    private void inicializarMatriz() {
        for (int i = 0; i < turnoFila; i++) {
            for (int j = 0; j < diaColumna; j++) {
                matriz[i][j] = null;
            }
        }
    }

    //- Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son válidos.
    public void agregarPaciente(Paciente unPaciente, int diaD, int turnoT) {
        matriz[turnoT - 1][diaD - 1] = unPaciente;
    }

    //- Dado el nombre de un paciente, liberar todos sus turnos.
    public boolean liberarTurno(String unNombre) {
        boolean libero = false;
        for (int i = 0; i < turnoFila; i++) {
            for (int j = 0; j < diaColumna; j++) {
                if ((matriz[i][j] != null) && (matriz[i][j].compararNombre(unNombre))) {
                    matriz[i][j] = null;
                    libero = true;
                }
            }
        }
        return libero;
    }

// Dado un día D y el nombre de un paciente, devolver si el paciente tiene agendado un turno ese día. Asuma que D es válido.
    public boolean tieneTurno(String unNombre, int diaD) {
        boolean tiene = false;
        int i = 0;
        while ((i < turnoFila) && (!tiene)) {
            if ((matriz[i][diaD - 1] != null) && (matriz[i][diaD - 1].compararNombre(unNombre))) {
                tiene = true;
            }
            i++;
        }
        return tiene;
    }

    @Override
    public String toString() {
        return "Turno: " + turnoFila + ", Dia: " + diaColumna;
    }

}
