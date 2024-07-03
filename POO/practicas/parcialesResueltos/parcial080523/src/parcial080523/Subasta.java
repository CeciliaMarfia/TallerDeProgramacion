/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial080523;

/**
 *
 * @author ceciliamarfia
 */
public class Subasta {

    private int cantCategorias;//fila
    private int cantMaxArt;// columna
    private Articulo[][] matriz;
    private int[] vector;

    public Subasta(int cantCategorias, int cantMaxArt) {
        this.cantCategorias = cantCategorias;
        this.cantMaxArt = cantMaxArt;
        this.matriz = new Articulo[cantCategorias][cantMaxArt];
        this.vector = new int[cantCategorias];
        inicializarVector();
    }

    public int getCantCategorias() {
        return cantCategorias;
    }

    public void setCantCategorias(int cantCategorias) {
        this.cantCategorias = cantCategorias;
    }

    public int getCantMaxArt() {
        return cantMaxArt;
    }

    public void setCantMaxArt(int cantMaxArt) {
        this.cantMaxArt = cantMaxArt;
    }

    public Articulo[][] getMatriz() {
        return matriz;
    }

    public void setMatriz(Articulo[][] matriz) {
        this.matriz = matriz;
    }

    private void inicializarVector() {
        for (int i = 0; i < cantCategorias; i++) {
            vector[i] = 0;
        }
    }

    public void agregarArticulo(Articulo unArticulo, int determinadaCategoria) {
        matriz[determinadaCategoria][vector[determinadaCategoria]] = unArticulo;
        vector[determinadaCategoria]++;
    }

    private Articulo buscarId(int unIdentificador) {
        boolean encontreWaldoDeMierda = false;
        int i = 0, j = 0;
        while ((i < cantCategorias) && (!encontreWaldoDeMierda)) {//filas
            j = 0;
            while (((j < this.vector[i])) && (!encontreWaldoDeMierda)) {// columnas
                if (matriz[i][j].getRolIdentificador() == unIdentificador) {
                    encontreWaldoDeMierda = true;
                }
                j++;
            }i++;
        }
        return matriz[i-1][j-1];
    }

    public void ofertarArticulo(int unIdentificador, Persona persona, double monto) {
        buscarId(unIdentificador).actualizarArticulo(persona, monto);
    }

    public Persona calcularMaximo(int unIdentificador) {
        return buscarId(unIdentificador).getPersona();
       
    }

    public Articulo Oferton(int determinadaCategoria) {
        double max = -1, montoActual;
        Articulo artMax = null;
        for (int i = 0; i < vector[determinadaCategoria]; i++) {
            montoActual = matriz[determinadaCategoria][i].getMontoOfertado();
            if (montoActual > max) {
                max = montoActual;
                artMax = matriz[determinadaCategoria][i];
            }
        }
        return artMax;
    }
}
