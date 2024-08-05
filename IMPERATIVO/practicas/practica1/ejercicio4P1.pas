{4.- Una librería requiere el procesamiento de la información de sus productos. De cada producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura de datos adecuada. 
El ingreso de los productos finaliza cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que puede haber más o menos de 30 productos del rubro 3. 
Si la cantidad de productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos métodos vistos en la teoría.
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d).
}
program ejercicioPractica;
const
	dimF =  8;
	fin =  0;
	dimF2 = 30;

type
	rangoRubro = 1..dimF;
	rangoRubro3 = 0..dimF2;
	producto = record
		codProducto:integer;
		codRubro: rangoRubro;
		precio:real;
	end;

 lista = ^nodo;  // ordenada por codigo de producto

    nodo = record                   
    	dato: producto;
    	sig: lista;
    end;

    vector = array [rangoRubro] of lista;  // ordenada por rubro
	vectorRubro3 = array [rangoRubro3] of producto; //ordenada por codigo de producto
   

{---------------Fin del type----------------}
procedure cargarProductos(var l:lista;var v:vector);
	procedure inicializarVectorDeListas(var v:vector);
	var
		i:rangoRubro;
	begin
		for i:=1 to dimF do
			v[i]:= nil;
	end;


	procedure leerProducto (var prod: producto);
	begin
		with prod do begin
			precio:= random (50);
			writeln('PRECIO: $',precio:3:2);
			if( precio <> fin) then begin
				codProducto := random (99);
				writeln('CODIGO DEL PRODUCTO: ',codProducto);
				codRubro:= random (8)+1;
				writeln('CODIGO DEL RUBRO: ',codRubro);
				writeln('.....................');
			end;
		end;
	end;

	procedure insertarOrdenado (var pri: lista; prod: producto);
	var
		aux, ant, act: lista;
	begin
		new(aux);   
		aux^.dato := prod;
		act := pri; // ubico act al inicio de la lista
		while (act <> nil) AND (act^.dato.codProducto < prod.codProducto) do begin
				ant := act;
				act := act^.sig; // avanzo en la lista
		end;
		if (act = pri) then // si está vacía o hay que insertar al inicio
				pri := aux
		else // el nuevo nodo va en el medio o al final de la lista
				ant^.sig := aux; // actualizo puntero para insertar nuevo nodo
		aux^.sig := act; // inserto nuevo nodo
	end;

var
	prod:producto;
begin
	l:=nil;
	inicializarVectorDeListas(v);
	leerProducto(prod);
	while(prod.precio <> fin) do begin
		insertarOrdenado(v[prod.codRubro],prod);
		leerProducto(prod);
	end;
end;

procedure imprimirCodigosDeProductos(v:vector);
var
	i:rangoRubro;
begin
	writeln('**CÓDIGOS DE PRODUCTOS **');
	for i:=1 to dimF do begin
		writeln('RUBRO: ',i);
		if v[i] = nil then 
			writeln('--Rubro vacío--')
		else begin
			while(v[i] <> nil) do begin
				writeln('CODIGO DEL PRODUCTO: ',v[i]^.dato.codProducto);
				writeln('.....................');
				v[i]:=v[i]^.sig;
			end;
		end;
	end;
end;

procedure crearVectorRubro3(var v2:vectorRubro3; v:vector;var dimL2:rangoRubro3);
begin
	dimL2:=0;
	while(v[3]<> nil)and (dimL2 < dimF2)do begin
		dimL2:=dimL2+1;
		v2[dimL2]:=v[3]^.dato;
		v[3] := v[3]^.sig; // Avanzar en la lista de productos del rubro 3
	end;
end;

procedure imprimirVectorRubro3(v:vectorRubro3; dimL2:rangoRubro3);
var
    i: rangoRubro3;
begin
	 writeln('--- VECTOR DEL RUBRO 3---');
	 if (dimL2> fin) then
		for i := 1 to dimL2 do
		begin
			writeln('Número de producto: ', i);
			writeln('CODIGO DEL PRODUCTO: ', v[i].codProducto);
			writeln('Precio: $', v[i].precio:3:2);
			writeln('.....................');
		end
	else
		writeln('**Vacío**');
end;

procedure ordenarSeleccion (var v: vectorRubro3; dimL2: integer);
var
    i, j, min: integer; {uso min en lugar de "p" xq es mas explicativo}
    item: producto;
begin
    for i := 1 to dimL2-1 do begin
        min := i; { necesito guardar la pos minima actual porque es el inicio }
        for j := i+1 to dimL2 do{para buscar el elemento mínimo en cada pasada}
            if (v[j].precio < v[min].precio) then {verifico si hay actualizar el min}
                  min := j;
        { intercambia v[i] con v[min], incluso si no es necesario }
        item := v[min];{guardo el elemento mínimo en una variable auxiliar}
        v[min] := v[i];{en la posición actual guardo el mínimo}
        v[i] := item;
    end;
end;

{procedure ordenInsercion (var v: vectorRubro3; dimL2: rangoRubro3);
var
    i, j: integer;
    actual: producto;
begin
    for i := 2 to dimL2 do begin
        actual := v[i];
        j := i - 1;
        while (j > 0) AND (v[j].precio > actual.precio) do begin
            v[j+1] := v[j]; }{ hago el corrimiento }
           // j := j - 1; { decremento en uno a j para que compare con todos los valores anteriores a él }
        //end;
        //v[j + 1] := actual { inserto el dato en la posición que le corresponde }
    {end;
end;}


procedure imprimirPrecios(v2:vectorRubro3 ;dimL2:rangoRubro3);
var
	i:rangoRubro3;
begin
	if (dimL2> 0) then begin
		writeln('--Precios del rubro 3 ORDENADOS:');
		for i:=1 to dimL2 do begin
			writeln('Precio: $',v2[i].precio:2:2);
			writeln('.....................');
		end;
	end
	else
		writeln('-- El vector para productos del rubro 3 se encuentra vacío --');
end;

function calcularPromedio (v2:vectorRubro3 ;dimL2:rangoRubro3):real;
var
	suma:real;
	i:rangoRubro3;
begin 
	suma:=0;
	for i:=1 to dimL2 do begin
		suma:= suma+ v2[i].precio;
	end;
	calcularPromedio:= suma/dimL2;
end;
{---------------Programa Principal----------------}
var
	v:vector;
	l:lista;
	v2:vectorRubro3;
	dimL2:rangoRubro3;
	promedio:real;
begin
	randomize;
	promedio:=0;
	cargarProductos(l,v);
	imprimirCodigosDeProductos(v);
	crearVectorRubro3(v2,v,dimL2);
	imprimirVectorRubro3(v2,dimL2);
	ordenarSeleccion (v2,dimL2);
	//ordenInsercion(v2,dimL2);
	imprimirPrecios(v2,dimL2);
	if (dimL2> fin) then begin 
		promedio:= calcularPromedio(v2,dimL2);
		writeln('-- Promedio de precios: $',promedio:2:2);
	end
	else
		writeln('-- Promedio de precios: $',promedio:2:2, ' ya que el vector se encuentra vacío');
end.
