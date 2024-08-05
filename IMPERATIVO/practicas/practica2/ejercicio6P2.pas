{6.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).
Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.}
program ejercicio6P2; 
const
	fin = 0;
{procedure armarBinario(num:integer);
var
	bin,dig:integer;
begin
	if (num <> 0) then begin
		dig:= num mod 10; //me quedo con el último digito
		 bin:= dig mod 2; // me quedo con el resto de la division por 2, si es par queda 0 y si es impar da 1
		 num:= num div 2; //me quedo con el resto de la división por 2 para analizar el número siguiente, por ej si era el 23, una vez calculado el 3 ahora hace el 2
		armarBinario(num); //lama a la recursion
		write(bin); // imprime de atras para adelante para que quede el binario "en orden"
	end;	
end;}

procedure armarBinario(num:integer);

begin
	if (num <> 0) then begin		
		armarBinario(num div 2); //lama a la recursion
		write(num mod 2); // imprime de atras para adelante para que quede el binario "en orden"
	end;	
end;


procedure leerNumeros();
var
	num:integer;
begin
	writeln('Ingrese un numero:');
	readln(num);
	while (num <> fin) do begin
		armarBinario(num);
		writeln();
		writeln('Ingrese un numero:');
		readln(num);
	end;
end;

begin
	leerNumeros();
end.

