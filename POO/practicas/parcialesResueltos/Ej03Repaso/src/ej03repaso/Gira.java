package ej03repaso;

/*
Una gira es un recital que además tiene un nombre y las “fechas” donde se repetirá la
actuación. De cada “fecha” se conoce la ciudad y el día. Además la gira guarda el
número de la fecha en la que se tocará próximamente (actual).
 */

/**
 *
 * @author ceciliamarfia
 */
public class Gira extends Recital{
    private String nombreGira;
    private Fecha [] vector;
    private int proximaFecha;
    private int dimL;
    private int dimF;

    public Gira(String nombreGira, int proximaFech, int dimF, String nombreBanda, int cantTemas) {
        super(nombreBanda, cantTemas);
        this.nombreGira = nombreGira;
        this.vector = new Fecha[dimF];
        this.proximaFecha = 0;
        this.dimL = 0;
        this.dimF = dimF;
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public Fecha[] getVector() {
        return vector;
    }

    public void setVector(Fecha[] vector) {
        this.vector = vector;
    }

    public int getProximaFecha() {
        return proximaFecha;
    }

    public void setProximaFecha(int proximaFecha) {
        this.proximaFecha = proximaFecha;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }

    public int getDimF() {
        return dimF;
    }

    public void setDimF(int dimF) {
        this.dimF = dimF;
    }
    
    private boolean estaLleno(){
        return dimL == dimF;
    }
/*agregarFecha que recibe una “fecha” y la agrega adecuadamente*/
public void agregarFecha (Fecha unaFecha){
    if (!estaLleno()){
        vector[dimL] = unaFecha;
        dimL++;
    }
}

  /*La gira debe responder al mensaje actuar de manera distinta. Imprime la leyenda
“Buenas noches …” seguido del nombre de la ciudad de la fecha “actual”. Luego
debe imprimir el listado de temas como lo hace cualquier recital. Además debe
establecer la siguiente fecha de la gira como la nueva “actual”.*/
    @Override
    public void actuar(){
        System.out.println("Buenas noches...");
        System.out.println(vector[proximaFecha].getCiudad());
        super.actuar();
        proximaFecha++;
    }
    
     /*iv. Todo recital debe saber responder al mensaje calcularCosto teniendo en cuenta lo
siguiente. Las giras deben devolver 30000 por cada fecha de la misma*/
    @Override
    public double calcularCosto(){
        return 30000.0* (dimL+1);
    }
}
