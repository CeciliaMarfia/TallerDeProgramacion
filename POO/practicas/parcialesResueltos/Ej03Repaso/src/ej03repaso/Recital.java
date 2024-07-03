package ej03repaso;

/*
3- Un productor musical desea administrar los recitales que organiza, que pueden ser:
eventos ocasionales y giras.
 De todo recital se conoce el nombre de la banda y la lista de temas que tocarán durante
el recital. 
 */

/**
 *
 * @author ceciliamarfia
 */
public abstract class Recital {
    private String nombreBanda;
    private String[] vector; //lista de temas
    private int dimF;
    private int dimL;

    public Recital(String nombreBanda, int cantTemas) {
        this.nombreBanda = nombreBanda;
        this.dimF = cantTemas;
        this.vector = new String[dimF];
        this.dimL = 0;
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public int getDimF() {
        return dimF;
    }

    public int getDimL() {
        return dimL;
    }

    private boolean estaLleno(){
        return dimL == dimF;
    }
//agregarTema que recibe el nombre de un tema y lo agrega a la lista de temas
    public void agregarTema (String nombreTema){
        if(!estaLleno()){
            vector[dimL]= nombreTema;
            dimL++;
        }
    }
    //actuar que imprime (por consola) para cada tema la leyenda “y ahora tocaremos…” seguido por el nombre del tema.
    public void actuar(){
        for (int i = 0; i < dimL; i++) {
            System.out.println("y ahora tocaremos...");
            System.out.println(vector[i]);
        }
    }

    /*iv. Todo recital debe saber responder al mensaje calcularCosto teniendo en cuenta lo
siguiente. Si es un evento ocasional devuelve 0 si es a beneficio, 50000 si es un show de TV
y 150000 si es privado. Las giras deben devolver 30000 por cada fecha de la misma*/
    public abstract double calcularCosto();
    
}
