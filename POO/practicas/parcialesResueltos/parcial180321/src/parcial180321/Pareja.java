/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial180321;

/**
 *
 * @author ceciliamarfia
 */
public class Pareja {
    private Participante participante1;
    private Participante participante2;
    private String estiloDeBaile;

    public Pareja(Participante participante1, Participante participante2, String estiloDeBaile) {
        this.participante1 = participante1;
        this.participante2 = participante2;
        this.estiloDeBaile = estiloDeBaile;
    }

    public Participante getParticipante1() {
        return participante1;
    }

    public void setParticipante1(Participante participante1) {
        this.participante1 = participante1;
    }

    public Participante getParticipante2() {
        return participante2;
    }

    public void setParticipante2(Participante participante2) {
        this.participante2 = participante2;
    }

    public String getEstiloDeBaile() {
        return estiloDeBaile;
    }

    public void setEstiloDeBaile(String estiloDeBaile) {
        this.estiloDeBaile = estiloDeBaile;
    }
    
    public int diferenciaDeEdad(){ 
        int resultado =participante1.getEdad()- participante2.getEdad();
        if (resultado<0){
            resultado= (-1) *resultado;
        }
        return resultado;
    }
}
