program MarfiaCecilia;
const
	dimF =  20;
	fin =  0;
	valorAlto= 999;
type
	rango = 1..dimF;
	cadena = String[];

	venta = record
        codprod:1..15;
        cantVendida:0..99;
	end;
    
    vectorVentas = array [rango] of venta;  // ordenada por ...
    
    {lista = ^nodo;  // ordenada por ...

    nodo = record                    //SI HAY MAS DE UNA LISTA O UN ARBOL CAMBIAR NOMBRE
    	dato: DATO;
    	sig: lista;
    end;}

    
{---------------Fin del type----------------}

procedure leerVenta (var v: venta);
begin
	with v do begin
		codProd := random (14)+1;
		if( codProd <> fin) then begin
            writeln('INGRESE LA CANTIDAD VENDIDA:');
            readln(cantVendida);
		end;
	end;
end;

procedure inicializarVector (var v:vectorVentas);
var
    i:rango;
    ven:venta;
begin
    for i:= 1 to dimF do
        leerVenta(ven);
end;

procedure imprimir_vector(v: vector);
    var
        i: integer;
    begin
        for i := 1 to DIM do
            writeln(v[i].nombre, ' ', v[i].legajo, ' ');
        readln; // toque enter para imprimir el siguiente
    end;

{---------------Programa Principal----------------}
var
    v:vectorVentas;

begin
    cargarVector(v);
	randomize;
    imprimir_vector(v);
	//lalista:=nil;
end.
