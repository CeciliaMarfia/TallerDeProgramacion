/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial14102022;

/**
 *
 * @author ceciliamarfia
 */
public class Distancia extends Curso {

    private String link;

    public Distancia(String link, int añoCursada,int dimF) {
        super(añoCursada, dimF);
        this.link = link;
    }


    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Override
    public boolean puedeRendir(Alumno unAlumno) {
        return (unAlumno.getAutoevAprobada() >= 3) && (unAlumno.getAsistencia() >= 1);

    }
}
