/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial11turnoetema1;


import PaqueteLectura.GeneradorAleatorio;
public class Parcial11TurnoETema1 {


    public static void main(String[] args) {
        int i, cbu, dni, moneda, monto;
        String alias;
        Tradicional t = new Tradicional("Banco Tradicional",5,"Calle Martinez","La Plata");
        Virtual v = new Virtual("Banco Virtual",3,"www.aprobame.com");
        for (i = 0; i < 5; i++){
            cbu = GeneradorAleatorio.generarInt(10);
            alias = GeneradorAleatorio.generarString(5);
            dni = GeneradorAleatorio.generarInt(100000);
            moneda = GeneradorAleatorio.generarInt(2);
            monto = GeneradorAleatorio.generarInt(100000);
            Cuenta c = new Cuenta(cbu,alias,dni,moneda,monto);
            t.agregarCuenta(c);
        }
        System.out.println(t.toString());
        System.out.println(t.puedeRecibir(8));
        t.deposito(100000,8);
        System.out.println(t.toString());
    }
    
}
