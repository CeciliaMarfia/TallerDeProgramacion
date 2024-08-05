{3.- Implementar un programa que procese las ventas de un supermercado. 
El supermercado dispone de una tabla con los precios y stocks de los 1000 productos que tiene a la venta.
a) Implementar un módulo que retorne, en una estructura de datos adecuada, los tickets de las ventas. 
De cada venta se lee código de venta y los productos vendidos. Las ventas finalizan con el código de venta -1. 
De cada producto se lee código y cantidad de unidades solicitadas. 
Para cada venta, la lectura de los productos a vender finaliza con cantidad de unidades vendidas igual a 0.
 El ticket debe contener:
- Código de venta, Detalle (código de producto, cantidad y precio unitario) de los productos que se pudieron vender. 
En caso de no haber stock suficiente, se venderá la máxima cantidad posible.
- Monto total de la venta.
c) Implementar un módulo que reciba la estructura generada en el inciso a) y un código de producto y retorne la cantidad de unidades vendidas de ese código de producto.}
program ejercicioPractica;
const
	dimF = 1000;
	finVenta =  -1;
	fin0 =  0;
	valorAlto= 999;
type
	rango = 1..dimF;

	infoProducto = record
		precio:real;
		stock:integer;
	end;
	
	producto = record
		codProducto:integer;
		cantProd:integer;
	end;
	
	listaProducto = ^nodoProducto;
	
	nodoProducto = record             
    	dato: producto;
    	sig: listaProducto;
    end;

	venta = record
		codVenta:integer;
		prod:listaProducto;
	end;
	
	listaDeVentas = ^nodoVentas;
	
	nodoVentas = record
		dato: venta;
    	sig: listaDeVentas;
    end;
	
	detalle = record
		codigoProducto:integer;
		cantidad:integer;
		precioUnitario:real;
	end;
	
	ticket = record
		codigoVenta:integer;
		det:detalle;
		montoTotal:real;
	end;
	
	
 lista = ^nodo;  // ordenada por ...

    nodo = record             
    	dato: ticket;
    	sig: lista;
    end;

    tablaProductos = array [rango] of infoProducto;  // se dispone


{---------------Fin del type----------------}
procedure generarVentas(var l:listaDeVentas);
		procedure agregarAdelante (var pri: listaDeVentas; dato: venta);
		var
			 aux: listaDeVentas;
		begin
			new (aux);
			aux^.dato := dato;
			aux^.sig := pri;
			pri := aux;
		end;

	procedure leerVenta (var ven: venta);
		
		procedure insertarOrdenado (var pri: listaProducto; dato: producto);
		var
			aux, ant, act: listaProducto;
		begin
			new(aux);   
			aux^.dato := dato;
			act := pri; // ubico act al inicio de la lista
			while (act <> nil) AND (act^.dato.codProducto < dato.codProducto) do begin
					ant := act;
					act := act^.sig; // avanzo en la lista
			end;
			if (act = pri) then // si está vacía o hay que insertar al inicio
					pri := aux
			else // el nuevo nodo va en el medio o al final de la lista
					ant^.sig := aux; // actualizo puntero para insertar nuevo nodo
			aux^.sig := act; // inserto nuevo nodo
		end;

		
		procedure leerProducto (var prod: producto);
		begin
			with prod do begin
				cantProd := random (10);
				writeln('codigo del producto: ',cantProd);
				if( cantProd <> fin0) then begin
					codProducto:= random (100)+1;
					writeln('codigo del producto: ',codProducto);
				end;
			end;
		end;
	var
		lp:listaProducto;
		prod:producto;
	begin
		lp:=nil;
		ven.codVenta := random (10);
		writeln('codigo de venta: ',ven.codVenta);
		if( ven.codVenta <> finVenta) then begin
			leerProducto(prod);
			while(prod.cantProd <> fin0) do begin
				insertarOrdenado(lp,prod);
				leerProducto(prod);
			end;
		end;
	end;
var
	ven:venta;
begin
	leerVenta(ven);
	while( ven.codVenta <> finVenta) do begin
		agregarAdelante(l, ven);
		leerVenta(ven);
	end;
end;

procedure generarTickets(lv:listaDeVentas; var  l:lista;tProd:tablaProductos);
	procedure leerDetalle(det:detalle; codProd:integer;tProd:tablaProductos);
	begin
		det.codigoProducto:= codProd;
		writeln('Ingrese la cantidad de unidades vendidas para el producto: ', codProd);
		readln(det.cantidad);
		det.precioUnitario := tProd[det.codigoProducto].precio; // Debes obtener el precio del producto desde la tabla de productos
  end;
	procedure cargarTicket(ven:venta; var t:ticket;tProd:tablaProductos);
	var
		productoActual:listaProducto;
	begin
		t.codigoVenta := ven.codVenta;
		productoActual := ven.prod;
		while productoActual <> nil do begin
			leerDetalle(t.det, productoActual^.dato.codProducto, tProd);
			t.det.precioUnitario := tProd[t.det.codigoProducto].precio;
			t.montoTotal := t.montoTotal + t.det.cantidad * t.det.precioUnitario;
		productoActual := productoActual^.sig; // Avanzo al siguiente producto en la lista
		end;
end;
var
	t:ticket;
begin
	while (lv <>  nil) do begin
		cargarTicket(lv^.dato,t,tProd);
		l:=l^.sig;
	end;
end;

procedure cargarTabla( var tablaProd:tablaProductos);//se dispone
begin
end;
{---------------Programa Principal----------------}
var
	tablaProd:tablaProductos;
	lv:listaDeVentas;
	lt:lista;
begin
	randomize;
	cargarTabla(tablaProd);//se dispone
	generarVentas(lv);
	generarTickets(lv, lt,tablaProd);
end.
