/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoc2022tema2;

/**
 *
 * @author ceciliamarfia
 */
public class Funcion {

    private String titulo;
    private String fecha;
    private int hora;
    private Butaca[][] matriz;
    private int dimF;
    private int dimC;

    public Funcion(String titulo, String fecha, int hora, int dimF, int dimC) {
        this.titulo = titulo;
        this.fecha = fecha;
        this.hora = hora;
        this.dimF = dimF;
        this.dimC = dimC;
        this.matriz = new Butaca[dimF][dimC];
        crearButaca();// porque necesito crear todas las butacas
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getHora() {
        return hora;
    }

    public void setHora(int hora) {
        this.hora = hora;
    }

    public int getDimF() {
        return dimF;
    }

    public int getDimC() {
        return dimC;
    }

    private void crearButaca() {
        for (int i = 0; i < dimF; i++) {
            for (int j = 0; j < dimC; j++) {
                matriz[i][j] = new Butaca("Butaca " + (i + 1) + " - " + (j + 1), 800 + 100 * (i + 1), false, (i + 1));
            }
        }
    }

    public double ocuparButaca(int b, int f) {
        matriz[f - 1][b - 1].ocuparLa();// resto 1 por las posiciones, y ocuparLa le corresponde a la butaca
        return matriz[f - 1][b - 1].getPrecio();
    }

    public void desocuparButaca(int f) {
        for (int i = 0; i < dimC; i++) {
            if (matriz[f - 1][i].isEstado() == true) {// para no desocupar una que ya esté desocupada...
                matriz[f - 1][i].desOcuparla();
            }
        }
    }
    
    public String representacion(int b){
        String aux ="";
        for (int i = 0; i < dimF; i++) {
            aux+= matriz[i][b-1].toString();// la columna es fija, me muevo por fila
        }
        return aux;
    }
        @Override
        public String toString(){
            String aux = "Titulo: "+this.titulo+ " fecha: "+ this.fecha+" hora: "+this.hora;
            for (int i = 0; i < dimF; i++) {
                    aux+="\n Fila: "+(i+1);
                for (int j = 0; j < dimC; j++) {
                    aux+="\n Butaca: "+(j+1)+matriz[i][j].toString();
                }
                
            }
            return aux;
        }
}
