/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej04repaso;

/**
 *
 * @author ceciliamarfia
 */
public class Semicircular extends Coro {

    private Corista[] vector;
    private int dimF;
    private int dimL;

    public Semicircular(int dimF, String nombre, Director director) {
        super(nombre, director, dimF);
        this.vector = new Corista[dimF];
        this.dimF = dimF;
        this.dimL = 0;
    }

    public int getDimF() {
        return dimF;
    }

    public int getDimL() {
        return dimL;
    }

    private boolean estaLleno() {
        return dimL == dimF;
    }

    @Override
    public void agregarCorista(Corista unCorista) {
        if (!estaLleno()) {
            vector[dimL] = unCorista;
            dimL++;
        }
    }

    @Override
    public String stringDeLaFormacion() {
        String aux = " ";
        for (int i = 0; i < dimL; i++) {
            aux += vector[i];
        }
        return aux;
    }

    public boolean ordenado() {
        boolean estaOrdenado = true;
        int i = 0;
        while ((i < dimL) && (estaOrdenado)) {
            if (vector[i].getTonoFundamental() < vector[i + 1].getTonoFundamental()) {
                estaOrdenado = false;
                return estaOrdenado;
            } else {
                i++;
            }
        }
        return estaOrdenado;
    }

}
