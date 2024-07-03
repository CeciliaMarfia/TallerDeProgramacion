/*
2- Queremos un sistema para gestionar estacionamientos. Un estacionamiento conoce su
nombre, dirección, hora de apertura, hora de cierre, y almacena para cada número de piso
(1..N) y número de plaza (1..M), el auto que ocupa dicho lugar. De los autos se conoce
nombre del dueño y patente.
a) Genere las clases, incluyendo getters y setters adecuados.
b) Implemente constructores. En particular, para el estacionamiento:
- Un constructor debe recibir nombre y dirección, e iniciar el estacionamiento
con hora de apertura “8:00”, hora de cierre “21:00”, y para 5 pisos y 10 plazas
por piso. El estacionamiento inicialmente no tiene autos.
- Otro constructor debe recibir nombre, dirección, hora de apertura, hora de
cierre, el número de pisos (N) y el número de plazas por piso (M) e iniciar el
estacionamiento con los datos recibidos y sin autos. 

 */
package ej02repaso;

/**
 *
 * @author ceciliamarfia
 */
public class Estacionamiento {

    private String nombre;
    private String direccion;
    private int horaApertura;
    private int horaCierre;
    private Auto[][] matriz;
    private int dimF;//piso - fila
    private int dimC;//plaza - columna

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = 800;
        this.horaCierre = 2100;
        this.dimF = 5;
        this.dimC = 10;
        this.matriz = new Auto[dimF][dimC];
    }

    public Estacionamiento(String nombre, String direccion, int horaApertura, int horaCierre, int dimF, int dimC) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.dimF = dimF;
        this.dimC = dimC;
        this.matriz = new Auto[dimF][dimC];
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

    public int getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(int horaApertura) {
        this.horaApertura = horaApertura;
    }

    public int getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(int horaCierre) {
        this.horaCierre = horaCierre;
    }

    public int getDimF() {
        return dimF;
    }

    public int getDimC() {
        return dimC;
    }

    /*
- Dado un auto A, un número de piso X y un número de plaza Y, registrar al auto
en el estacionamiento en el lugar X,Y. Suponga que X, Y son válidos (es decir,
están en rango 1..N y 1..M respectivamente) y que el lugar está desocupado.
     */
    public void agregarAuto(Auto unAuto, int piso, int plaza) {
        this.matriz[piso][plaza] = unAuto;

    }

    /*- Dada una patente, obtener un String que contenga el número de piso y plaza
donde está dicho auto en el estacionamiento. En caso de no encontrarse,
retornar el mensaje “Auto Inexistente”.
    
     */
    public String obtenerAuto(String unaPatente) {// USO WHILE PORQUE ESTOY BUSCANDO
        int i = 0, j = 0;
    boolean encontre = false;
    
    while (i < this.dimF && !encontre) {
        j = 0; // Reiniciar j al comienzo de cada fila (piso)
        
        while (j < this.dimC && !encontre) {
            if (lugarVacio(i,j) && matriz[i][j].getPatente().equals(unaPatente)) {
                encontre = true;
            } else {
                j++; // Avanzar a la siguiente plaza si no encontré
            }
        }
        
        if (!encontre) {
            i++; // Avanzar al siguiente piso
        }
    }

    if (encontre) {
        return "Patente encontrada en el piso " + (i) + " y plaza " + (j);
    } else {
        return "Patente Inexistente";
    }
}
    
    private boolean lugarVacio(int piso, int plaza){//solo quiero acceder desde esa clase
        return this.matriz[piso][plaza] != null;
    }
        
    
    /*- Obtener un String con la representación del estacionamiento. Ejemplo: “Piso 1
Plaza 1: libre Piso 1 Plaza 2: representación del auto …
 Piso 2 Plaza 1: libre … etc”
- Dado un número de plaza Y, obtener la cantidad de autos ubicados en dicha
plaza (teniendo en cuenta todos los pisos).
    
    */
    
    @Override
   public String toString() {
    String aux = "";

    for (int i = 0; i < this.dimC; i++) {
        for (int j = 0; j < this.dimF; j++) {
            aux += "Piso: " + i + " Plaza " + j;
            if (lugarVacio(i,j)) {
                aux += matriz[i][j].toString();
            } else {
                aux += " libre";
            }
            aux+="\n";
        }
    }
    return aux;
}
   /*
   Dado un número de plaza Y, obtener la cantidad de autos ubicados en dicha
plaza (teniendo en cuenta todos los pisos).
   */
   
   public int contarAutos(int nroPlaza){
       int cantAutos =0;
       for (int i = 0; i < this.dimF; i++) {
               if(lugarVacio(i,nroPlaza)){
                   cantAutos++;
               }
           }
       return cantAutos;
   }
}
