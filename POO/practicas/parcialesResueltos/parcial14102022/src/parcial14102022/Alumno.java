/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial14102022;

/**
 *
 * @author ceciliamarfia
 */
public class Alumno {

    private int DNI;
    private String Nombre;
    private int asistencia;
    private int autoevAprobada;

    public Alumno(int DNI, String Nombre, int asistencia, int autoevAprobada) {
        this.DNI = DNI;
        this.Nombre = Nombre;
        this.asistencia = 0;
        this.autoevAprobada = 0;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public int getAsistencia() {
        return asistencia;
    }

    public void setAsistencia(int asistencia) {
        this.asistencia = asistencia;
    }

    public int getAutoevAprobada() {
        return autoevAprobada;
    }

    public void setAutoevAprobada(int autoevAprobada) {
        this.autoevAprobada = autoevAprobada;
    }

    public void incrementarAsistencia() {
        asistencia++;
    }
    
    public void incrementarAutoevaluacion() {
        autoevAprobada++;
    }
    
   
}


