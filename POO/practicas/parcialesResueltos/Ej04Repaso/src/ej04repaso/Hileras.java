/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej04repaso;

/**
 *
 * @author ceciliamarfia
 */
public class Hileras extends Coro {

    private Corista[][] matriz;
    private int dimF;
    private int dimC;
    private int filaLlena;
    private int dimL;

    public Hileras(String nombre, Director director, int dimF, int dimC) {
        super(nombre, director, dimF);
        this.matriz = new Corista[dimF][dimC];
        this.dimF = dimF;
        this.dimC = dimC;
        this.filaLlena = 0;
        this.dimL = 0;
    }

    public int getDimF() {
        return dimF;
    }

    public int getDimC() {
        return dimC;
    }

    private boolean estaLleno() {
        return filaLlena == dimF;

    }

    @Override
    public void agregarCorista(Corista unCorista) {
        if (!estaLleno()) {
            matriz[filaLlena][dimL] = unCorista;
            dimL++;
            if (dimL == dimC) {
                filaLlena++;
                dimL = 0;
            }
        }
    }

    @Override
    public String stringDeLaFormacion() {
        String aux = "";
        for (int i = 0; i < filaLlena; i++) {
            for (int j = 0; j < dimC; j++) {
                aux += matriz[i][j].toString();
            }
        }
        if (!estaLleno()) {
            for (int k = 0; k < dimL; k++) {
                aux += matriz[filaLlena + 1][k].toString();
            }
        }
        return aux;
    }

    public boolean ordenado() {
        int i = 0, j = 0, k = 0;
        boolean estaOrdenado = true;
        while ((i < filaLlena) && (estaOrdenado)) {
            while ((j < dimC) && (estaOrdenado)) {
                if (matriz[i][j].getTonoFundamental() != matriz[i][j + 1].getTonoFundamental()) {
                    return estaOrdenado = false;
                } else {
                    j++;
                }
            }

        }
        if (!estaLleno()) {
            while (k) {

            }
        }

        return estaOrdenado;
    }
