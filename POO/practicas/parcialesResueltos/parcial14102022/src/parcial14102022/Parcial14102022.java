/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial14102022;

/**
 *
 * @author ceciliamarfia
 */
public class Parcial14102022 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Presencial presencial = new Presencial(4,2023,5);
        Distancia distancia = new Distancia ("info.unlp.edu.ar",2023,3);
        
        Alumno alumno1 = new Alumno(888,"Chechu",0,0);
        presencial.agregarAlumno(alumno1);
        Alumno alumno2 = new Alumno(222,"Solci",0,0);
        presencial.agregarAlumno(alumno2);
        
        Alumno alumno3 = new Alumno(555,"Valen",0,0);
        distancia.agregarAlumno(alumno3);
        Alumno alumno4 = new Alumno(777,"Paul",0,0);
        distancia.agregarAlumno(alumno4);
        Alumno alumno5 = new Alumno(444,"Ailu",0,0);
        distancia.agregarAlumno(alumno5);
        
        alumno1.incrementarAsistencia();
        alumno1.incrementarAsistencia();
        alumno1.incrementarAsistencia();
        alumno2.incrementarAsistencia();
        alumno3.incrementarAsistencia();
        alumno4.incrementarAsistencia();
        alumno4.incrementarAsistencia();
        alumno4.incrementarAsistencia();
        alumno4.incrementarAsistencia();
        alumno5.incrementarAsistencia();
        
        alumno1.incrementarAutoevaluacion();
        alumno2.incrementarAutoevaluacion();
        alumno2.incrementarAutoevaluacion();
        alumno2.incrementarAutoevaluacion();
        alumno3.incrementarAutoevaluacion();
        alumno4.incrementarAutoevaluacion();
        alumno4.incrementarAutoevaluacion();
        alumno4.incrementarAutoevaluacion();
        alumno5.incrementarAutoevaluacion();
       
        int prueba = distancia.cantPuedenRendir();
        int prueba2 = presencial.cantPuedenRendir();
        
        int prueba3 = prueba;
    }
    
}
