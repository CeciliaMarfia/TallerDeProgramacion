{2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número
leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo
recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe
imprimir 2 5 6}
program ejercicioPractica;
const

	fin = 0 ;

{---------------Fin del type----------------}
procedure imprimir(num:integer);
var 
	dig: integer;
begin
	if (num <> 0) then begin
		dig:= num mod 10; {me quedo con el último dígito} 
		num:=num div 10; {achico el nro}
		imprimir(num);
		writeln(dig);
	end;
		
end;
procedure leerNumero();
var
	num:integer;
begin
	writeln('ingrese un número:');
	readln(num);
	while (num <> fin) do begin
		imprimir(num);
		writeln('ingrese un número:');
		readln(num);
	end;
end;


{---------------Programa Principal----------------}
var
	num:integer;
begin
	leerNumero();
	imprimir(num);
end.
