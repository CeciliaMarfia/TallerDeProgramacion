{4.- Escribir un programa con:
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
menores a 100.
b. Un módulo recursivo que devuelva el máximo valor del vector.
c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}
program ejercicio4P2;
const
	dimF = 20;
type
	rango = 1..20;
	vector = array[rango] of integer;
{---------FIN DEL TYPE ----------}
procedure cargarVector(var v:vector; i:integer); //de forma recursiva
var
	num:integer;
begin
	num:=random(10)+1;// Debería ser 100
	writeln('Numero: ',num);
	if (i <=dimF) then begin
		v[i]:= num;
		i:= i+1;
		cargarVector(v, i);
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


function calcularMinimo (v: vector; min:integer; i: integer): integer;
begin
  if (i = dimF) then
    calcularMinimo := min
  else begin
    if (v[i] < min) then
		min:=v[i];
      calcularMinimo := calcularMinimo (v,min, i+1);
  end;
end;

function calcularMaximo(v: vector; max:integer; i: integer): integer;
begin
  if (i = dimF )then
    calcularMaximo := max
  else begin
    if (v[i] > max) then
		max:=v[i];
      calcularMaximo := calcularMaximo (v,max, i+1);
  end;
end;

function calcularSuma(v: vector; total:integer; i: integer): integer;
begin
  if (i = dimF )then
    calcularSuma :=total
  else begin
    if (i <= dimF) then
		total:= total+v[i];
      calcularSuma := calcularSuma (v,total, i+1);
  end;
end;

var
	v: vector;
	i,max,min,total: integer;
begin
  randomize;
  i := 1;
  min := 999; 
  max := -1;   
  total:= 0;
  cargarVector(v, i);
  imprimirVectorRecursivo(v,1); //ayuda, me imprime al final 0 :(
  writeln;
  writeln('------------------------');
  writeln('Minimo:', calcularMinimo(v,min, i)); 
  writeln('Máximo:', calcularMaximo(v, max,i));
  writeln('Suma total:', calcularSuma(v, total,i));
end.




