{5.- Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el
siguiente encabezado:

	Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);

Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector}
program ejercicio5P2;
const
	dimF = 5;
type
	indice = 1..dimF;
	vector = array [indice] of integer;
{--------fin del type-----------}
procedure cargarVector(var v:vector); //una vez corregido el ejercicio 4 ver el tema de la carga y hacer esta recursiva
var
	i,num:integer;
begin
	for i:=1 to dimF do begin
		writeln('Ingrese un numero:');
		readln(num);
		v[i]:=num;
	end;
end;
procedure imprimirVectorRecursivo(v: vector; i: integer);
begin
  if (i <= dimF) then
  begin
    write(v[i], ' |');
    imprimirVectorRecursivo(v, i + 1);
  end;
end;

Procedure busquedaDicotomica (v: vector; ini,fin: integer; dato:integer; var pos: integer);
Var
     medio: integer;
begin
	if (ini > fin) then begin {1er caso base}
		pos:= -1;
		end
	else begin
		medio:= (ini + fin) div 2;
		 if v[medio] = dato then {2do caso base}
			pos := medio  // encontre el dato
		 else
		 if (dato < v[medio]) then //llamados a la recursion
				busquedaDicotomica (v, ini, medio - 1, dato, pos)
	   	 else
			busquedaDicotomica (v, medio + 1,fin , dato, pos)
		end;
end;

{--------programa principal-----}
var
	v:vector;
	ini,fin,dato,pos:integer;
begin
	ini:=1;
	fin:=dimF;
	cargarVector(v);
	imprimirVectorRecursivo(v,1);
	writeln;
	writeln('.......................');
	write('Ingrese el valor a buscar:');
	readln(dato);
	busquedaDicotomica (v,ini,fin,dato,pos );// se rompeee :(
	if (pos <> -1) then
		writeln( dato,' fue encontrado!')
	else
		writeln( dato,' no fue encontrado!')
end.
