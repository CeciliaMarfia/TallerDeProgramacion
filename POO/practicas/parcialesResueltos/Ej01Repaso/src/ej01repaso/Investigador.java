/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej01repaso;

/**
 *
 * @author ceciliamarfia
 */
public class Investigador {
    private String nombreCompleto;
    private int categoria;
    private String especialidad;
    private Subsidio[] subsidios;
    private int dimL;
    
    //b. Un investigador sólo debería poder construirse con nombre, categoría y especialidad

    public Investigador(String nombreCompleto, int categoria, String especialidad) {
        this.nombreCompleto = nombreCompleto;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.subsidios = new Subsidio[5];
        this.dimL = 0;
    }
    
    //metodos getters y setters, ver que estén todos ok

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getDimL() {
        return dimL;
    }
    
    private boolean subsidioDisponible (){
        return this.dimL < 5;
    }

    
    //II) b. agregar un subsidio al investigador.
    public void agregarSubsidio(Subsidio unSubsidio){
        if (subsidioDisponible ()){
            this.subsidios[dimL] = unSubsidio;
            this.dimL++;
        }
    }
    
    public double calcularTotalSubOtorgado(){
        double total = 0;
        for (int i = 0; i < getDimL(); i++) {
            if(this.subsidios[i].isOtorgado()){
                total+= this.subsidios[i].getMonto();
            }
        }
        return total;
        
    }
    
    public void verSubsidio(){
        for (int i = 0; i < this.dimL; i++) {
          if(!subsidios[i].isOtorgado()){
              subsidios[i].otorgarSubsidio();
          }
        }
        
    }
   
    
    @Override
    public String toString() {
        return " \n Nombre completo:" + this.nombreCompleto + "\n categoria: " + this.categoria + "\n especialidad: " + this.especialidad + "\n Total de dinero de total de dinero de sus subsidios otorgados: "+Math.round(this.calcularTotalSubOtorgado()* 100.0) / 100.0;
                }
   
}
