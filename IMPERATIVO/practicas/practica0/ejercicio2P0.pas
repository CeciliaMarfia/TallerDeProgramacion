{2.- Implementar un programa que procese información de propiedades que están a la venta en una inmobiliaria.
Se pide:
a) Implementar un módulo para almacenar en una estructura adecuada, las propiedades agrupadas por zona.
Las propiedades de una misma zona deben quedar almacenadas ordenadas por tipo de propiedad. 
Para cada propiedad debe almacenarse el código, el tipo de propiedad y el precio total. 
De cada propiedad se lee: zona (1 a 5), código de propiedad, tipo de propiedad, cantidad de metros cuadrados y precio del metro cuadrado. 
La lectura finaliza cuando se ingresa el precio del metro cuadrado -1.
b) Implementar un módulo que reciba la estructura generada en a), un número de zona y un tipo de propiedad y 
retorne los códigos de las propiedades de la zona recibida y del tipo recibido.}
program ejercicioPractica;
const
	dimF =  5;
	fin =  -1;
	valorAlto= 999;
type
	rangoZona = 1..dimF;
	cadena10 = String[10];

	propiedad = record
		zona:rangoZona;
		codigo: integer;
		tipo: cadena10;
		metrosCuadrados:real;
		precioTotal:real;
		precioMetroCuadrado:real;
	end;

	lista = ^nodo;  // ordenada por tipo de propiedad

    nodo = record      
    	dato: propiedad;
    	sig: lista;
    end;

    vectorDeZonas = array [rangoZona] of lista; //almacena la lista de propiedades las cuales estaran ordenadas por tipo
    
    listaRetorno = ^nodoRetorno;
    
	nodoRetorno = record      
		dato: integer;
		sig: listaRetorno;
	end;


{---------------Fin del type----------------}
procedure cargarVectorDeListas(var vec:vectorDeZonas);
	procedure inicializarVectorDeListas(var vec:vectorDeZonas);
	var
		i: rangoZona;
	begin
		for i:=1 to dimF do
			vec[i]:= nil;
	end;
	
	procedure leerPropiedad(var prop: propiedad);
	begin
		with prop do begin
			writeln('Precio por metro cuadrado: ');
			readln(precioMetroCuadrado);
			if (precioMetroCuadrado <> fin) then begin
				zona:= random(5)+1;
				writeln('Zona: ', zona);
				codigo:= random(100)+1;
				writeln('Código de propiedad: ',codigo);
				write('Tipo de propiedad: ');
				readln(tipo);
				metrosCuadrados:= random(50)+1;
				writeln('Metros cuadrados: ',metrosCuadrados:2:2);
				precioTotal := metrosCuadrados * precioMetroCuadrado;
				writeln('Precio total: ',precioTotal:4:2);
			end;
			writeln('---------------------');
		end;
	end;
	
	procedure insertarOrdenado (var pri: lista; dato: propiedad);
	var
		aux, ant, act: lista;
	begin
		new(aux);   
		aux^.dato := dato;
		act := pri; // ubico act al inicio de la lista
		while (act <> nil) AND (act^.dato.tipo < dato.tipo) do begin
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
	prop:propiedad;
begin
	inicializarVectorDeListas(vec);
	leerPropiedad(prop);
	while (prop.precioMetroCuadrado <> fin) do begin
		insertarOrdenado(vec[prop.zona], prop);// guardo en la posicion indicada por la zona la propiedad leída
		leerPropiedad(prop);
	end;
end;

procedure buscarEnVector(vec:vectorDeZonas; zonaProp:rangoZona; tipoProp:cadena10; var lr:listaRetorno);
	procedure agregarAdelante (var pri: listaRetorno; dato: integer);
	var
		 aux: listaRetorno;
	begin
		new (aux);
		aux^.dato := dato;
		aux^.sig := pri;
		pri := aux;
	end;

begin
	lr:=nil; //inicializo la lista
	while(vec[zonaProp] <> nil) and (vec[zonaProp]^.dato.tipo <= tipoProp) do begin //recordar que las listas estan ordenadas por tipo por lo tanto debo ir comparando
		if (vec[zonaProp]^.dato.tipo = tipoProp) then //aca chequeo que efectivamente sea del tipo que busco
			agregarAdelante(lr, vec[zonaProp]^.dato.codigo);
		vec[zonaProp]:=vec[zonaProp]^.sig; //avanzo a la siguiente propiedad
		end;
end;

procedure imprimirlistaCodigos(l:listaRetorno);
begin
	if (l= nil) then writeln('--LISTA DE CODIGOS VACÍA--')
	else
		while(l <> nil) do begin
			writeln('--LISTA DE CODIGOS--');
			writeln(l^.dato);
			l:= l^.sig;
		end;
		
end;
{---------------Programa Principal----------------}
var
	vec:vectorDeZonas;
	zonaProp:rangoZona; 
	tipoProp:cadena10;
	lr:listaRetorno;
begin
	randomize;
	cargarVectorDeListas(vec);
	writeln('--Ingrese la zona a buscar:');
	readln(zonaProp);
	writeln('-- Ingrese el tipo de vivienda:');
	readln(tipoProp);
	buscarEnVector(vec,zonaProp,tipoProp,lr);
	imprimirlistaCodigos(lr); // no lo pide pero lo hago para verificar
end.
