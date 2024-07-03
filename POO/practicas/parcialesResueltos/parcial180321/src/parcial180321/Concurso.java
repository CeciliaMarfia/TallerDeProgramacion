/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial180321;

/**
 *
 * @author ceciliamarfia
 */
public class Concurso {

    private Pareja[] vector;
    private int dimF;
    private int dimL;

    public Concurso(int dimF) {
        this.dimF = dimF;
        this.vector = new Pareja[dimF];
        this.dimL = 0;
    }

    public int getDimF() {
        return dimF;
    }

    public int getDimL() {
        return dimL;
    }

    public void agregarPareja(Pareja unaPareja) {
        vector[dimL] = unaPareja;
        dimL++;
    }

    public Pareja parejaConMayorDiferencia() {
        int maxDiferencia = -1, resultado, nroPareja = -1;
        for (int i = 0; i < dimL; i++) {
            resultado = vector[i].diferenciaDeEdad();
            if (resultado > maxDiferencia) {
                maxDiferencia = resultado;
                nroPareja = i;
            }
        }
        if (nroPareja != -1) {
            return vector[nroPareja];
        } else {
            return null;
        }
    }

}
