/*
 Una estación de servicio quiere administrar la información correspondiente a la carga de combustible. La estación posee una dirección y la información de los surtidores (a lo sumo 6). De cada surtidor se conoce el combustible que dispensa, el precio por litro y la información de las ventas (como máximo V). De cada venta se registra: DNI del cliente, cantidad de litros cargados, monto abonado y el medio de pago utilizado (débito, crédito o efectivo).
1- Genere las clases necesarias. Provea constructores para crear: la estación con la dirección y con capacidad para 6 surtidores (inicialmente sin surtidores); cada surtidor con el combustible que dispensa (String), precio por litro y con capacidad para V ventas (inicialmente sin ventas); y cada venta a partir de la información necesaria
2- Implemente los métodos necesarios, en las clases que corresponda, para:
a) Dado un surtidor, agregarlo a los surtidores de la estación.
• b) Dado un número N de surtidor, el DNI de un cliente, una cantidad de litros y una forma de pago, generar la venta correspondiente y agregarla en dicho surtidor de la estación. Asumir que el número N de surtidor es válido.
c)
Obtener el número del surtidor que recaudó el mayor monto total en efectivo (entre todas sus ventas).
d)
Obtener un String que represente la estación siguiendo el ejemplo:
"Estación de Servicio: Dirección; Cantidad de surtidores.
Surtidor 1; Combustible dispensado, precio por litro; Ventas: (DNI del cliente, cantidad de litros cargados, monto abonado; ...]
Surtidor 2; Combustible dispensado, precio por litro; Ventas: (DNI del cliente, cantidad de litros cargados, monto abonado; ...)
- Realice un programa que instancie una estación. Agregue surtidores. Realice ventas. Compruebe el correcto incionamiento de los métodos implementados.
 */
package parcialturnoc;

/**
 *
 * @author ceciliamarfia
 */
public class ParcialTurnoC {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estacion estacion = new Estacion("Siempreviva 742");
        
        Surtidor surtidor1 = new Surtidor("infinia", 50,3);
        estacion.agregarSurtidor(surtidor1);
        Surtidor surtidor2 = new Surtidor("super", 15,5);
        estacion.agregarSurtidor(surtidor2);
        Surtidor surtidor3 = new Surtidor("premium", 20,3);
        estacion.agregarSurtidor(surtidor3);
        
        estacion.generarVenta(1, 111, 40, "efectivo");
        estacion.generarVenta(1, 222, 60, "efectivo");
        
        estacion.generarVenta(2, 333, 50, "mercadopago");
        estacion.generarVenta(2, 333, 60, "efectivo");
        estacion.generarVenta(2, 222, 60, "cuentaDNI");
        
        estacion.generarVenta(0, 555, 50, "debito");
        System.out.println("El surtidor que recaudó el mayor monto total en efectivo (entre todas sus ventas): "+Math.round(estacion.mayorMontoRecaudado()*100.0)/100.0);
        System.out.println(estacion.toString());
        
        
        }
    
}
