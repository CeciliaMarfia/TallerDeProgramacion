{Todos saben que Juani le ha insistido mucho a Abutina. 
* De cada insistencia se conoce: número de insistencia, veces que Juani dijo perdón  y código de gravedad de la insistencia (1 a 20).
Implementar un módulo que lea información de las insistencias y
  retorne una estructura de datos eficiente para la búsqueda por veces que Juani dijo perdón que contenga las veces que Juani dijo perdón
y todas sus insistencias. La lectura finaliza al ingresar una insistencia con el número de insistencia 0 que no debe procesarse.
Realizar un módulo que reciba la estructura generada previamente y un numero de veces que Juani dijo perdón,
 y retorne una nueva estructura que contenga la cantidad total de insistencias de cada código de gravedad de la insistencia
 para las veces que Juani pide perdón superior al número de veces que Juani pide perdón recibido.
Realizar un módulo recursivo que reciba la estructura generada en inciso anterior y retorne la misma estructura con la información ordenada por cantidad de insistencias.}
program perimetral;
const
	fin = 0;
	dimF = 20;
type
	rangoGravedad=1..dimF;

	insistencia = record
		nroInsistencia:integer;
		cantPedidoPerdon:integer;
		codGravedad:rangoGravedad;
	end;
	
	infoInsistencia = record
		nroInsistencia:integer;
		codGravedad:rangoGravedad;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato:infoInsistencia;
		sig:lista;
	end;
	
	infoPerdon = record
		cantPedidoPerdon:integer;
		l:lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato:infoPerdon;
		HI:arbol;
		HD:arbol;
	end;
	vector = array [rangoGravedad] of integer;
{-- fin del type--}	
procedure generarArbol(var a:arbol);
	procedure leerInsistencia(var ins:insistencia);
	begin
		with ins do begin
			nroInsistencia:=random(10);
			writeln('Nro insistencia: ',nroInsistencia);
			if(nroInsistencia <> fin) then begin
				cantPedidoPerdon:=random(10)+1;
				writeln('Cant. Pedido Perdon: ',cantPedidoPerdon);
				codGravedad:=random(10);
				writeln('Cod. gravedad: ',codGravedad);
				writeln('................ ');
				end;
		end;
	end;
	procedure cargarRegistro(ins:insistencia; var info:infoInsistencia);
	begin
		info.nroInsistencia:=ins.nroInsistencia;
		info.codGravedad:=ins.codGravedad;
	end;
	procedure agregarAdelante(var l:lista; info:infoInsistencia);
	var
		aux:lista;
	begin
		new(aux);
		aux^.dato:=info;
		aux^.sig:=l;
		l:=aux;
	end;
	
	procedure agregarAlArbol(var a:arbol;ins:insistencia; info:infoInsistencia);
	begin
		if(a = nil) then begin
		new(a);
		a^.dato.cantPedidoPerdon:=ins.cantPedidoPerdon;
		a^.dato.l:=nil;
		agregarAdelante(a^.dato.l,info);
		a^.HI:=nil;
		a^.HD:=nil;
		end
		else
			if(ins.cantPedidoPerdon = a^.dato.cantPedidoPerdon) then
				agregarAdelante(a^.dato.l,info)
			else
				if (ins.cantPedidoPerdon < a^.dato.cantPedidoPerdon) then
				agregarAlArbol(a^.HI,ins,info)
			else
				agregarAlArbol(a^.HD,ins,info);
	end;
var
	ins:insistencia; info:infoInsistencia;
begin
	a:=nil;
	leerInsistencia(ins);
	while (ins.nroInsistencia <> fin) do begin
		cargarRegistro(ins,info);
		agregarAlArbol(a,ins,info);
		leerInsistencia(ins);
	end;
end;


procedure imprimirArbol(a:arbol);
	procedure imprimirA(a:arbol);
		procedure imprimirLista(l:lista);
		begin
			while (l <> nil) do begin
			writeln('Nro insistencia: ',l^.dato.nroInsistencia);
			writeln('Cod. gravedad: ',l^.dato.codGravedad);
			writeln('____________');
				l:=l^.sig;
			end;
		end;
	begin
		if (a <> nil) then begin
			imprimirA(a^.HI);
			writeln('Cant. Pedido Perdon: ',a^.dato.cantPedidoPerdon);
			imprimirLista(a^.dato.l);
			imprimirA(a^.HD);
		end;
	end;
begin
	if(a = nil) then
		writeln('Arbol vacío como su corazón')
	else
		imprimirA(a);
end;

procedure pedidosDeDisculpas(a:arbol;var v:vector);
	procedure inicializarVector(var v:vector);
	var
		i:integer;
	begin
		for i:=1 to dimF do
		v[i]:=0;
	end;
	
procedure recorrerArbol(a:arbol; var v:vector; cantVeces:integer);
	begin
		if(a<> nil) then
			if(a^.dato.cantPedidoPerdon > cantVeces)then begin
				while(a^.dato.l <> nil ) do begin
					v[a^.dato.l^.dato.codGravedad]:=v[a^.dato.l^.dato.codGravedad]+ 1;
					a^.dato.l :=a^.dato.l^.sig;
				end;
				recorrerArbol(a^.HI,v,cantVeces);
				recorrerArbol(a^.HD,v,cantVeces);
			end
		else
			recorrerArbol(a^.HD,v,cantVeces);
	end;
var
	cantVeces:integer;
begin
	inicializarVector(v);
	write('Ingrese la Cantidad de veces: ');
	readln(cantVeces);
		if (a = nil) then
			writeln('Arbol vacío como su corazón')
		else
		recorrerArbol(a,v,cantVeces);
end;

procedure imprimirVector(v:vector);
var
		i:integer;
	begin
		for i:=1 to dimF do begin
			writeln('Gravedad: ', i);
			writeln('Cant.: ',v[i]);
			writeln('.-.-.-..-.-.-.-');
		end;
	end;
	procedure ordenarSeleccion(var v:vector);
	var
		i,j,min:integer;
		elem:integer;
	begin
		for i:=1 to dimF-1 do begin
			min:=1;
			for j:=i+1 to dimF do
				if(v[j] <v[min]) then
					min:=j;
			elem:=v[min];
			v[min]:=v[i];
			v[i]:=elem;
		end;
	end;
	
{--programa principal--}	
var
	a:arbol;
	v:vector;
begin
	randomize;
	generarArbol(a);
	writeln('-- FIN DE LA CARGA');
	imprimirArbol(a);
	pedidosDeDisculpas(a,v);
	imprimirVector(v);
	ordenarSeleccion(v);
	writeln('ahora ordenado!!!!!');
	imprimirVector(v);
end.
