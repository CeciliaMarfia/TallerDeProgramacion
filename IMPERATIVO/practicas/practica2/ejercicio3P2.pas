{3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random”
mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se
encuentra en la lista o falso en caso contrario.}
program ejercicio3P3;
const
	fin = 0;
type
	lista = ^nodo;

	nodo = record
	dato:integer;
	sig: lista;
	end;

{---------FIN DEL TYPE--------}

procedure crearLista(var l:lista);
	procedure AgregarAdelante (var l: lista; elem:integer);
	var 
		nue:lista;
	begin
		new(nue);
		nue^.dato:=elem;
		nue^.sig:=l;
		l:=nue;
	end;
var
	num:integer;
begin
	num:= random(10);// debería decir 100, pongo 10 para probar, el 100 da numeros del 0 al 99, por lo tanto va a imprimir el 0 como para cortar
	writeln('Numero:', num);
	if (num <> fin) then begin
		agregarAdelante(l,num);
		crearLista(l);
	end
end;

procedure imprimirLista(l: lista);
begin
	if (l <> nil) then begin //no llegué al final de la lista, si llega a nil ya está
		writeln('Num:', l^.dato); //imprimo el dato
		imprimirLista(l^.sig); //voy al siguiente invocando al módulo de forma recursiva
  end;
end;

function calcularMinimo(l:lista; min:integer):integer;
begin
	if(l = nil) then //llegué al final de la lista
calcularMinimo:=min //retorno el mínimo
else begin
	if(l^.dato < min) then //compruebo si es el minimo
		min:=l^.dato ; //actualizo el minimo
	calcularMinimo:= calcularMinimo(l^.sig,min);// llamo recursivamente a la funcion
	end;
end;

function calcularMaximo(l:lista; max: integer):integer;
begin
	if(l = nil) then //llegué al final de la lista
		calcularMaximo:=max //retorno el mínimo
	else begin
		if(l^.dato > max) then //compruebo si es el maximo
	max:=l^.dato ;//actualizo el maximo
	calcularMaximo:= calcularMaximo(l^.sig,max);// llamo recursivamente a la funcion
	end;
end;

function existeElNro(l:lista; nro:integer;  ok:boolean): boolean;
begin
	if(l = nil) then //llegué al final de la lista
		existeElNro:= ok //retorno el valor del booleano
	else begin
		if(l^.dato = nro) then //compruebo si es el valor que estoy buscando
			ok:=true ; //actualizo el valor de la variable
	existeElNro:= existeElNro(l^.sig,nro,ok);// llamo recursivamente a la funcion
	end;
end;

var
l:lista;
max,min,num:integer;
ok: boolean;
begin
	randomize;
	l:=nil;
	max:= -1;
	min:= 999;
	ok:=false;
	crearLista(l);
	if (l = nil) then
		writeln('--Lista vacia--');// si lo pongo dentro del imprimir me imprime esto al final
	writeln('--LA LISTA:');
	imprimirLista(l);
	writeln('Minimo:', calcularMinimo(l,min));
	writeln('Máximo:', calcularMaximo(l,max));
	writeln ('Ingrese el valor a buscar, de 1 a 99:');
	readln(num);
	If(existeElNro(l, num, ok)) then
		writeln (num, ' se encuentra en la lista!')
	else
		writeln (num, ' no se encuentra en la lista!');
end. 
