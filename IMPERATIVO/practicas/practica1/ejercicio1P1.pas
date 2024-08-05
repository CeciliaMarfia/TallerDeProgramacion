{1.- Se desea procesar la información de las ventas de productos de un comercio (como máximo
50).
Implementar un programa que invoque los siguientes módulos:
a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el día de la venta, código del producto (entre 1 y 15) y cantidad vendida  
(como máximo 99 unidades). El código debe generarse automáticamente (random) y la cantidad se debe leer. El ingreso de las ventas finaliza con el día de venta 0 (no se procesa).
b. Un módulo que muestre el contenido del vector resultante del punto a).
c. Un módulo que ordene el vector de ventas por código.
d. Un módulo que muestre el contenido del vector resultante del punto c).
e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos
valores que se ingresan como parámetros.
f. Un módulo que muestre el contenido del vector resultante del punto e).
g. Un módulo que retorne la información (ordenada por código de producto de menor a
mayor) de cada código par de producto junto a la cantidad total de productos vendidos.
h. Un módulo que muestre la información obtenida en el punto g).}

program ejercicio1P1;

const
  dimF =50;
  fin = 0;
  maxVenta = 99;

type
  rangoVenta = 1..dimF;
  rangoProd = 1..15;
  rangoDia = 0..31;
  cantidadDeVentas = 0..maxVenta;

  venta = record
	dia:rangoDia;
    codProducto: rangoProd;
    cantVendida: cantidadDeVentas;
  end;

	infoVenta = record
		codProducto: rangoProd;
		totalVendido: integer;
	end;
	
  vectorDeVentas = array [rangoVenta] of venta; //ordenado por como se lee
  vectorMenorAMayor = array [rangoVenta] of infoVenta; //ordenado de menorAMayor

 {--------------------------------Fin del type ----------------------------------------}

 {--------------------------------Carga del vector de ventas ----------------------------------------}
procedure cargarVectorDeVentas(var vec: vectorDeVentas; var dimL: rangoVenta);

 {--------------------------------Carga del registro de venta ----------------------------------------}
  procedure leerVenta(var vent: venta);
  begin
	vent.dia:=random(10); //deberia ser 32, uso 10 de prueba
	writeln('Día de la venta: ', vent.dia);
    if (vent.dia <> fin) then begin
		vent.codProducto := random(15)+1;
		writeln('Código del producto: ', vent.codProducto);
		write('Cantidad vendida del producto: ');
		readln(vent.cantVendida);
		writeln('..........................');
    end;
  end;

var
  vent: venta;
begin
  dimL := 0;
  leerVenta(vent);
  while (vent.dia <> fin) and (dimL < dimF) do begin
    dimL := dimL + 1;
    vec[dimL] := vent;
    leerVenta(vent);
  end;
end;
{--------------------------------Ordenar por Selección----------------------------------------}
procedure ordenarSeleccion (var v: vectorDeVentas; dimL: rangoVenta); // de mayor a menor
var
   i, j, min: integer; {uso min en lugar de "p" xq es mas explicativo}
    item: venta;
begin
    for i := 1 to dimL-1 do begin
        min := i;{ necesito guardar la pos minima actual porque es el inicio }
        for j := i+1 to dimL do{para buscar el elemento mínimo en cada pasada}
            if (v[j].codProducto > v[min].codProducto) then {verifico si hay actualizar el min}
                 min := j;
        {intercambia v[i] con v[min], incluso si no es necesario }
       item := v[min];{guardo el elemento mínimo en una variable auxiliar}
        v[min] := v[i];{en la posición actual guardo el mínimo}
        v[i] := item;
    end;
end;



{--------------------------------Ordenar por Inserción----------------------------------------}
procedure ordenInsercion (var v: vectorMenorAMayor; dimL2: rangoVenta);
var
    i, j: integer;
    actual: infoVenta;
begin
    for i := 2 to dimL2 do begin
        actual := v[i];
        j := i - 1;
        while (j > 0) AND (v[j].codProducto > actual.codProducto ) do begin
            v[j+1] := v[j]; { hago el corrimiento }
            j := j - 1; { decremento en uno a j para que compare con todos los valores anteriores a él }
        end;
        v[j + 1] := actual { inserto el dato en la posición que le corresponde }
    end;
end;

{--------------------------------Eliminar ventas por rango de código----------------------------------------}
procedure eliminarVentasPorRango(var vec: vectorDeVentas; var dimL: rangoVenta; var ok:boolean);// ver la forma de hacerlo aprovechando que está ordenado y hacer la cant dee corrimientos según la cantidad de elementos a eliminar
var
  i, j: rangoVenta;
  rangoInicio, rangoFin: rangoProd; 
begin
  i := 1;// Me paro al inicio del vector
  ok:=false;
  write('Ingrese el rango de inicio del código:(entre 1 y 15): ');
  readln(rangoInicio);
  write('Ingrese el rango de fin del código:(entre 1 y 15): ');
  readln(rangoFin);
  while (i <= dimL) do begin //recorro las ventas hasta llegar al final del vector
    if (vec[i].codProducto >= rangoInicio) and (vec[i].codProducto <= rangoFin) then begin //si está en ese rango
      for j := i to dimL - 1 do//acá empieza el corrimiento
        vec[j] := vec[j + 1]; // Realiza el corrimiento hacia la izquierda
      dimL := dimL - 1; // Reduce la dimensión lógica
      ok:=true;
    end
    else
      i := i + 1; // Solo avanza si no elimina el elemento actual
  end;
end;
 {--------------------------------Imprimir el vector resultante----------------------------------------}
procedure imprimirVectorResultante(vec: vectorDeVentas; dimL: integer);
var
  i: integer;
begin
  writeln('** VECTOR RESULTANTE **');
  for i := 1 to dimL do
  begin
    writeln('Posición ', i, ' : ');
    writeln('Día de la venta: ', vec[i].dia);
    writeln('Código del producto: ', vec[i].codProducto);
    writeln('Cantidad vendida del producto: ', vec[i].cantVendida);
    writeln('-------------------------');
  end;
end;

 {--------------Crear vector ordenado de menor a mayor por código de productos, solo aquellos pares-------------------}
 procedure crearVector2(var vec2: vectorMenorAMayor; vec: vectorDeVentas; dimL: rangoVenta; var dimL2: rangoVenta);

  function esPar(codigo: rangoProd): boolean;
  begin
    esPar := codigo mod 2 = 0;
  end;


	
	procedure cargarInfoVenta(var infoV:infoVenta; codProducto:rangoProd; cantVendida:cantidadDeVentas);
	begin
		infoV.codProducto:=codProducto;
		infoV.totalVendido:=infoV.totalVendido+cantVendida;
	end;
var
	i:rangoVenta;
	infoV: infoVenta;
begin
	dimL2 := 0;
	for i:=1 to dimL do begin
		if esPar(vec[i].codProducto) then begin
			dimL2 := dimL2 + 1;
			cargarInfoVenta(infoV,vec[i].codProducto,vec[i].cantVendida);
			vec2[dimL2] := infoV;
			writeln(dimL2);
		end;
	end;
end;

 {--------------------------------Imprimir el vector resultante----------------------------------------}
procedure imprimirVectorResultante2(vec: vectorMenorAMayor; dimL2: rangoVenta);
var
  i: rangoVenta;
begin
	writeln('** VECTOR RESULTANTE DE CÓDIGOS PARES **');
	if ( dimL2 = 0) then
		writeln('** El vector está vacío **')
	else begin
		writeln(dimL2);
		for i := 1 to dimL2 do begin
			writeln('Posición ', i, ' : ');
			writeln('Código del producto: ', vec[i].codProducto);
			writeln('Cantidad total vendida del producto: ', vec[i].totalVendido);
			writeln('-------------------------');
		 end
	end;
		
end;


 {--------------------------------Programa principal ----------------------------------------}
var
  vec: vectorDeVentas;
  dimL,dimL2: rangoVenta;
  ok:boolean;
  vec2:vectorMenorAMayor;
begin
  randomize;
  cargarVectorDeVentas(vec, dimL);
  imprimirVectorResultante(vec, dimL);
  ordenarSeleccion(vec, dimL);
  writeln('---Vector ordenado:');
  imprimirVectorResultante(vec, dimL);
  eliminarVentasPorRango(vec, dimL, ok);
  if (ok) then begin
	write('---Vector resultante: ');
	imprimirVectorResultante(vec, dimL);
 end
 else write('---El vector no ha eliminado elementos. ');
  crearVector2(vec2,vec, dimL,dimL2);
  ordenInsercion(vec2,dimL);
  imprimirVectorResultante2(vec2, dimL2);
end.

