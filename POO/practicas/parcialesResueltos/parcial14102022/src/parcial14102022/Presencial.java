/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial14102022;

/**
 *
 * @author ceciliamarfia
 */
public class Presencial extends Curso {
     private int nroSala;

    public Presencial(int nroSala, int añoCursada, int dimF) {
        super(añoCursada,dimF);
        this.nroSala = nroSala;
    }

    public int getNroSala() {
        return nroSala;
    }

    public void setNroSala(int nroSala) {
        this.nroSala = nroSala;
    }
    
    
     @Override
    public boolean puedeRendir(Alumno unAlumno){
         return unAlumno.getAsistencia()>=3;
    
    }
     
}
