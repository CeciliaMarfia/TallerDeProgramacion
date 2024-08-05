{1.- Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los almacene en un vector con dimensión física igual a 10 y 
retorne el vector.
b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.
c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector..
d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres leídos. El programa debe informar 
el valor retornado.
e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con los caracteres leídos.
f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el mismo orden que están almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en orden inverso al que están almacenados.
}
Program ejercicio1P2;
const 
	dimF = 5;// deberia ser 10
	fin ='.' ;
type 
vector = array [1..dimF] of char;

     lista = ^nodo;
     nodo = record
              dato: char;
              sig: lista;
            end;
{-------------FIN DEL TYPE-------}
//carga de forma recursiva
procedure CargarVector (var v: vector; var dimL: integer);

  procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var
		caracter: char;
  begin
    write ('Ingrese un caracter: ');
    readln(caracter);  
    if (caracter <> fin) and (dimL < dimF)  then begin
          dimL:= dimL + 1;
          v[dimL]:= caracter;
          CargarVectorRecursivo (v, dimL);
         end;
  end;
  
  begin
  dimL:= 0;
  CargarVectorRecursivo (v, dimL);
end;

procedure ImprimirVector (v: vector; dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do
        write(v[i], ' | ');
 end;   
 
//  impresion de forma recursiva
 procedure ImprimirVectorRecursivo (v:vector;  dimL:integer; var i:integer);
 begin
	if (dimL = 0) then 
		writeln ('--- Vector sin elementos ---')
	else 
		if(i <=dimL) then begin
		write(v[i],' |');
		i:=i+1;
		ImprimirVectorRecursivo (v, dimL,i);
		end;
end;
{NO DEBERIA LEER NI ESCRIBIR EN UNA FUNCION
function contarCaracteres():integer;
var
	caracter:char;
begin
	writeln ('Ingrese un caracter: ');
    readln(caracter);  
    if(caracter <> fin) then 
		contarCaracteres:=contarCaracteres()+1
	else
		ContarCaracteres:=0 ; // porque ya
end;}
  procedure contarCaracteres(var cant:integer);
var
	caracter:char;
begin
	writeln ('Ingrese un caracter: ');
    readln(caracter);  
    if(caracter <> fin) then begin 
		cant:=cant+1;
		contarCaracteres(cant);
	end;
end;
  
 procedure cargarListaDeCaracteres (var l:lista; var ult:lista);
	procedure agregarAtras (var pri, ult: lista; dato: char);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato := dato;
		aux^.sig := nil;
		if (pri = nil) then // si esta vacia
			pri := aux
		else // si no esta vacia
			ult^.sig := aux;
		ult := aux;
	end;
var
	caracter:char;
 begin
	writeln ('Ingrese un caracter: ');
    readln(caracter);  
   if(caracter <> fin) then begin
		agregarAtras(l,ult,caracter);	
		cargarListaDeCaracteres (l,ult);
	end;
 end;
  procedure imprimirLista(l:lista);
  begin
	writeln('--Imprimir en orden--');
	if (l<> nil) then begin
		writeln(l^.dato);
		imprimirLista(l^.sig);
	end;
  end;
  
  procedure   imprimirListaRecursivaAlReves(l:lista);
  begin
  if (l<> nil) then begin
		imprimirLista(l^.sig);
		writeln(l^.dato);
	end;
  end;
// ---------Programa Principal---------
var 
	dimL,cantCar: integer;
	v: vector;
	i:integer;
	l,ult:lista;
begin 
  CargarVector (v, dimL);
  writeln ('--- Vector de forma secuencial: ---');
  imprimirVector(v,dimL);
  writeln ('--- Vector de forma recursiva: ---');
  i:=1;
  ImprimirVectorRecursivo (v, dimL,i);
  writeln();
  //cantCar:= contarCaracteres();
  cantCar:=0;
  contarCaracteres(cantCar);
  writeln ('cantidad de caracteres ingresados: ',cantCar); // ver de hacer funcion, no?
  l:=nil;
  ult:=nil;
  cargarListaDeCaracteres(l,ult);
  if (l = nil) then 
		writeln ('--- Lista sin elementos ---')
  else
  imprimirLista(l);
 if (l = nil) then 
		writeln ('--- Lista sin elementos ---')
  else
  imprimirListaRecursivaAlReves(l);
  end.
