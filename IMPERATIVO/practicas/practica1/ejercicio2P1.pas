{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa modularizado que:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa el código de identificación, 
DNI del propietario y valor de la expensa. La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}
program ejercicio2P2;
const
	dimF =  300;
	fin =  -1;
type
	rango = 1..dimF;
	oficina = record
		codIdentificacion:integer;
		DNI:integer;
		valorExpensa:real;
	end;

    vector = array [rango] of oficina;  // sin orden

    
{---------------Fin del type----------------}
{---------------Carga del vector----------------}
procedure cargarVector(var vec:vector; var dimL: integer);

	procedure leerOficina (var ofi: oficina);
	begin
		with ofi do begin
			codIdentificacion := random (301)-1;
			writeln('CODIGO DE IDENTIFICACION: ',codIdentificacion);
			if( codIdentificacion <> fin) then begin
				DNI:= random (500)+1;
				writeln('DNI DEL PROPIETARIO: ',DNI);
				valorExpensa:= random (900)+10000;
				writeln('VALOR DE LA EXPENSA: $',valorExpensa:4:2);
			end;
		end;
	end;
var
	ofi:oficina;
begin
	dimL:=0;
	leerOficina(ofi);
	while (ofi.codIdentificacion <> fin) and (dimL< dimF) do begin
		dimL:=dimL+1;
		vec[dimL]:=ofi;
		leerOficina(ofi);
	end;

end;
{--------------------------------Ordenar por Seleccion----------------------------------------}
{procedure ordenarSeleccion (var v: vector; dimL: integer);
var}
 //   i, j, min: integer; {uso min en lugar de "p" xq es mas explicativo}
  {  item: oficina;
begin
    for i := 1 to dimL-1 do begin
        min := i;} { necesito guardar la pos minima actual porque es el inicio }
       // for j := i+1 to dimL do{para buscar el elemento mínimo en cada pasada}
            //if (v[j].codIdentificacion < v[min].codIdentificacion) then {verifico si hay actualizar el min}
                //  min := j;
        { intercambia v[i] con v[min], incluso si no es necesario }
      //  item := v[min];{guardo el elemento mínimo en una variable auxiliar}
        //v[min] := v[i];{en la posición actual guardo el mínimo}
        //v[i] := item;
    {end;
end;}


{--------------------------------Ordenar por Inserción----------------------------------------}
procedure ordenInsercion(var v: vector; dimL: integer);
var 
	i, j: integer;
	actual:oficina;
begin

	for i:= 2 to dimL do begin
   		actual:=v[i];
   		j:= i-1;
   		while (j > 0) and (v[j].codIdentificacion > actual.codIdentificacion) do begin
     			v[j+1]:=v[j];
     			j := j-1;
     		end;
		v[j+1] := actual;
	end;
end;


 {--------------------------------Imprimir el vector resultante----------------------------------------}
procedure imprimirVectorResultante(vec: vector; dimL: integer);
var
  i: integer;
begin
  writeln('** VECTOR RESULTANTE **');
  for i := 1 to dimL do
  begin
    writeln('Posición ', i, ' : ');
    writeln('Código de identificación: ', vec[i].codIdentificacion);
    writeln('DNI del propietario: ', vec[i].DNI);
    writeln('VALOR DE LA EXPENSA: $: ', vec[i].valorExpensa:4:2);
    writeln('-------------------------');
  end;
end;
{---------------Programa Principal----------------}
var
	vec:vector;
	dimL:integer;
begin
	randomize;
	cargarVector(vec, dimL);
	imprimirVectorResultante(vec,dimL);
	//ordenarSeleccion (vec,dimL);
	ordenInsercion(vec, dimL);
	writeln('//////////////////////////////');
	imprimirVectorResultante(vec, dimL);
	
end.
