/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial14102022;

/**
 *
 * @author ceciliamarfia
 */
public abstract class Curso {
    private int añoCursada;
    private Alumno [] vector;
    private int dimF;
    private int dimL;

    public Curso(int añoCursada,int dimF) {
        this.añoCursada = 2023;
        this.dimF=dimF;
        this.vector = new Alumno[dimF];
        this.dimL = 0;
    }

    public int getAñoCursada() {
        return añoCursada;
    }

    public void setAñoCursada(int añoCursada) {
        this.añoCursada = añoCursada;
    }

   
    public int getDimL() {
        return dimL;
    }
    
    public int getDimF() {
        return dimF;
    }

    private boolean estaLleno(){
        return dimL==dimF;
    }
    
    public boolean agregarAlumno(Alumno unAlumno){
        boolean pudo = false;
        if(!estaLleno()){
            vector[dimL] = unAlumno;
            dimL++;
            pudo = true;
        }
        return pudo;
    }
    
  public void incrementarAsistenciaAlumno(int unDNI){
     boolean encontre = false;
     int i=0;
     while((i< dimL)&&(!encontre)){
         if (vector[i].getDNI()==unDNI){
             encontre = true;
             vector[i].incrementarAsistencia();
         }else{
             i++;
         }
     }
  }
  
  public void aprobarAutoevaluacionAlumno(int unDNI){
     boolean encontre = false;
     int i=0;
     while((i< dimL)&&(!encontre)){
         if (vector[i].getDNI()==unDNI){
             encontre = true;
             vector[i].incrementarAutoevaluacion();
         }else{
             i++;
         }
     }
  }
 
  public abstract boolean puedeRendir(Alumno unAlumno);
  
  
  
  public int cantPuedenRendir(){
      int cantAlu=0;
      for (int i = 0; i < dimL; i++) {
          if(puedeRendir(vector[i])){
              cantAlu++;
          }
      }
      return cantAlu;
  }
}
