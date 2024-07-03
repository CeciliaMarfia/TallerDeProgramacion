/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoh2023;

/**
 *
 * @author ceciliamarfia
 */
public class Estadio {

    private String nombre;
    private String direccion;
    private int capacidad;
    private int mes;//fila
    private int dia;//columna
    private Concierto[][] agenda;
    private int vector[];
    
    public Estadio(String nombre, String direccion, int capacidad) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.capacidad = capacidad;
        this.mes = 12;
        this.dia = 31;
        this.agenda = new Concierto[mes][dia];
        this.vector = new int[mes];// por cada mes tengo la diml de los dias
        inicializarVector();
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public int getMes() {
        return mes;
    }

    public int getDia() {
        return dia;
    }
    
    private void inicializarVector() {
        for (int i = 0; i < mes; i++) {
           vector[i]=0;
            
        }
    }

    private boolean estaEnRangoElMes(int mesM) {
        return mesM >= 1 && mesM <= 12;
    }

    //Registrar un concierto C en la agenda. El método recibe un mes M y debe registrar el concierto en el siguiente día disponible del mes M.
    public void registrarConcierto(Concierto c, int mesM) {
    if (estaEnRangoElMes(mesM)) {
            agenda[mesM - 1][vector[mesM - 1]] = c;//cargo en ese d;ia
            vector[mesM-1]++;
        }
    }


    public String listarConciertos(int mesM) {
        String aux = "";
        if (estaEnRangoElMes(mesM)) {
            for (int i = 0; i < vector[mesM-1]; i++) {
                    aux += agenda[mesM - 1][i].toString();
        }
    }
    return aux ;
}

public double calcularRecaudacion(int mesM){
        double total=0;
        if(estaEnRangoElMes(mesM)){
            for (int i = 0; i < vector[mesM-1]; i++) {
                    total+=agenda[mesM-1][i].totalRecaudado();
            }
        }
        return (double)total/2;
    }

    @Override
public String toString() {
        String aux="Estadio: "+this.nombre+" Dirección: "+this.direccion+" Capacidad: "+this.capacidad;
        for (int i = 0; i < mes; i++) {
            if(agenda[i][0]!=null){// si el primer dia tiene un concierto imprimo el mes
                aux+="\n Mes:"+(i+1);
            }for (int j = 0; j < dia; j++) {
                if (agenda[i][j]!=null){
                    aux+="\n Dia: "+(j+1)+agenda[i][j].toString();
                }
            }
   
        }
        return aux;
    }
    
    
}
