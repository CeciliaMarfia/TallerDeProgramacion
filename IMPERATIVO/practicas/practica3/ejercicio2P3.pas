{2. Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.
Nota: El módulo debe retornar los dos árboles.

b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.
 c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.}
program ejercicio2P3;
const
    fin = 0;

type
    cadena10 = string[10];
    venta = record
        codProd: integer;
        fecha: cadena10;
        cant: integer;
    end;

    arbol = ^nodo;

    nodo = record
        dato: venta;
        HI: arbol;
        HD: arbol;
    end;

    producto = record
        codProd: integer;
        total: integer;
    end;

    arbol2 = ^nodo2;

    nodo2 = record
        dato: producto;
        HI: arbol2;
        HD: arbol2;
    end;


procedure generarArbolYArbol2(var a: arbol; var a2: arbol2);
	procedure leerVenta(var ven: venta);
	begin
		with ven do begin
			write('Codigo producto:');
			readln(codProd);
			if (codProd <> fin) then begin
				write('Fecha: ');
				readln(fecha);
				write('Cantidad: ');
				readln(cant);
				writeln('-------------');
			end;
		end;
	end;
	
	
	procedure insertarAlArbol(var a: arbol; ven: venta);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato := ven;
			a^.HI := nil;
			a^.HD := nil;
		end
		else
			if (ven.codProd <= a^.dato.codProd) then
				insertarAlArbol(a^.HI, ven)
			else
				insertarAlArbol(a^.HD, ven);
	end;

	procedure insertarAlArbol2(var a2: arbol2; prod: producto);
	begin
		if (a2 = nil) then begin
			new(a2);
			a2^.dato := prod;
			a2^.HI := nil;
			a2^.HD := nil;
		end
		else
			if (prod.codProd = a2^.dato.codProd) then
				a2^.dato.total := a2^.dato.total + prod.total
			else if (prod.codProd <= a2^.dato.codProd) then
				insertarAlArbol2(a2^.HI, prod)
			else
				insertarAlArbol2(a2^.HD, prod);
	end;

var
    ven: venta;
    prod: producto;
begin
    a := nil;
    a2 := nil;
    leerVenta(ven);
    while (ven.codProd <> fin) do begin
        insertarAlArbol(a, ven);
        // Actualizar el árbol de productos vendidos
        prod.codProd := ven.codProd;
        prod.total := ven.cant;
        insertarAlArbol2(a2, prod);
        leerVenta(ven);
    end;
end;

procedure imprimirArbol(a: arbol);
begin
    if (a <> nil) then begin
        imprimirArbol(a^.HI);
        writeln('Código de producto: ', a^.dato.codProd);
        writeln('Fecha: ', a^.dato.fecha);
        writeln('Cantidad vendida: ', a^.dato.cant);
        writeln('-------------');
        imprimirArbol(a^.HD);
    end;
end;

procedure imprimirArbol2(a2: arbol2);
begin
    if (a2 <> nil) then begin
        imprimirArbol2(a2^.HI);
        writeln('Código de producto: ', a2^.dato.codProd);
        writeln('Total vendido: ', a2^.dato.total);
        writeln('-------------');
        imprimirArbol2(a2^.HD);
    end;
end;


procedure sumarCantidad(a : arbol; cod : integer; var total : integer);

begin
    If (a <> nil) then begin
        If (a^.dato.codProd = cod) then begin
            total := total + a^.dato.cant;
            SumarCantidad(a^.HI,cod,total);
        end
       else if (a^.dato.codProd > cod) then
            SumarCantidad(a^.HI,cod,total)
          else 
            SumarCantidad(a^.HD,cod,total); 
        end;
end;

procedure calcularVendidoXProd(a2:arbol2);
	function totalVendido(a2:arbol2; codigo:integer):integer;
	begin
		if (a2 = nil) then totalVendido:= 0;
		If (a2^.dato.codProd = codigo) then
				totalVendido:=  a2^.dato.total
		else
			if (a2^.dato.codProd <codigo) then
				totalVendido:=  totalVendido(a2^.HD,codigo)
		else
			totalVendido:=  totalVendido(a2^.HI,codigo);
	end;
var
	total, codigo:integer;
begin
	writeln('Ingrese el número de código a buscar para ver el total vendido:');
	readln(codigo);
	if (a2 = nil ) then
		writeln('--Arbol 2 vacío --')
	else begin
		total:= totalVendido(a2,codigo);
		writeln('Para el código ',codigo, ' el total vendido fue: ', total);
	end;
end;

var
    a:arbol;
    a2: arbol2;
    cod,total:integer;
begin
	total:=0;
    generarArbolYArbol2(a, a2);
    writeln('---Arbol de ventas generado---');
    imprimirArbol(a);
    writeln('---Arbol de productos vendidos generado---');
    imprimirArbol2(a2);
    writeln('Ingrese el número de código a buscar para ver el total vendido:');
	readln(cod);
    sumarCantidad(a,cod,total);
    writeln('Para el código', cod, ' el total vendido fue: ', total);
    calcularVendidoXProd(a2);
end.
