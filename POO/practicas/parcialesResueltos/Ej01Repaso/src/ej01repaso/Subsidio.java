/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej01repaso;

/**
 *
 * @author ceciliamarfia
 */
public class Subsidio {
    private double monto;
    private String motivo;
    private boolean otorgado;
    
    //c. Un subsidio sólo debería poder construirse con el monto pedido y el motivo. Un subsidio siempre se crea en estado no-otorgado.

    public Subsidio(double monto, String motivo) {
        this.monto = monto;
        this.motivo = motivo;
        this.otorgado = false;
    }
    
    //getters y setters - ver que esten ok

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean isOtorgado() {
        return otorgado;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
    
    public void otorgarSubsidio(){
        this.otorgado = true;
    }
}
