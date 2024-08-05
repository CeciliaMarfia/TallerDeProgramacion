{Aerolineas Argentinas necesita procesas los pasajes vendidos durante 2023. De cada pasaje se conoce el código de vuelo,
código del cliente, código ciudad de destino y monto del pasaje.
a) Implementar un módulo que lea pasajes, genere y retorne una estructura adecuada para la búsqueda por código de ciudad destino,
donde para cada código de ciudad destino se almacenan juntos todos los pasajes(código de vuelo, código de cliente y monto del pasaje).
La lectura finaliza con el monto de pasaje 0. Se sugiere utilizar el módulo leerPasaje();
b)Implementar un módulo que reciba la estructura generada en a) y un código de ciudad destino y retorne todos los pasajes hacia esa ciudad destino.
c)Realizar un módulo que reciba la estructura generada en a) y retorne el código de ciudad de destino con mayor cantidad de pasajes vendidos.}
program parcialAerolineas2023;

const
	fin = 0;
type
	pasaje = record
		vuelo: integer;
		cliente:integer;
		destino:integer;
		monto:real;
	end;
	
	infoPasaje = record
		codVuelo:integer;
		codCliente:integer;
		monto:real;
	end;
	
	lista = ^nodoLista;
	 nodoLista = record
		dato:infoPasaje;
		sig:lista;
	 end;
	
	vuelo = record
		codigoDestino:integer;
		l:lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: vuelo;
		HI: arbol;
		HD:arbol;
	end;
	
{--------- fin del type-------------}

procedure generarArbol(var a :arbol);
	procedure leerPasaje (var p:pasaje);
	begin 
		p.monto:= random(9999) / (random(10)+1);
		writeln('monto: $',p.monto:5:2);
		if (p.monto <>  fin) then begin
			p.vuelo:=random(7000);
			writeln(' Vuelo: ',p.vuelo);
			p.cliente:=random(100)+1;
			writeln(' Cliente: ',p.cliente);
			p.destino:=random(500)+1;
			writeln(' Destino: ',p.destino);
			writeln('---------------- ');
		end;
	end;
	
	
	procedure insertarAlArbol (var a :arbol; pas:pasaje; info:infoPasaje);
		procedure agregarAdelante(var l:lista; info:infoPasaje );
		var
			aux:lista;
		begin
			new(aux);
			aux^.dato:=info;
			aux^.sig:= nil;
			l:=aux;
		end;
		
	begin
		if(a = nil) then begin
			new(a);
			a^.dato.codigoDestino:=pas.vuelo;
			a^.dato.l:= nil;
			agregarAdelante(a^.dato.l,info);
			a^.HI:= nil;
			a^.HD:= nil
		end
		else
			if (pas.vuelo = a^.dato.codigoDestino) then
				agregarAdelante(a^.dato.l,info)
			else
				if (pas.vuelo < a^.dato.codigoDestino) then
					insertarAlArbol(a^.HI, pas,info )
				else
					insertarAlArbol(a^.HD, pas,info)
		
	end;
	procedure cargarRegistro(pas:pasaje;var info:infoPasaje);
	begin
		info.codVuelo:=pas.vuelo;
		info.codCliente:=pas.cliente;
		info.monto:=pas.monto;
	end;
var
	pas:pasaje;
	info:infoPasaje;
begin
	a:=nil;
	leerPasaje(pas);
	while (pas.monto <> fin ) do begin
		cargarRegistro(pas,info);
		insertarAlArbol(a,pas,info);
		leerPasaje(pas);
	end;
end;
procedure imprimirLista(l:lista);
	begin
		while (l <> nil) do begin
			writeln('-Código de vuelo :', l^.dato.codVuelo);
			writeln('-Código de cliente :', l^.dato.codCliente);
			writeln('-Monto : $  ', l^.dato.monto:4:2);
			l:=l^.sig; 
		end;
	end;
procedure imprimirArbol(a:arbol);
	procedure imprimirA(a:arbol);
	begin
		if (a<> nil) then begin
			writeln('**Código de Destino : ', a^.dato.codigoDestino);
			imprimirLista(a^.dato.l);
			writeln('-*-*-*-*-*-*-*- ');
			imprimirA(a^.HI);
			imprimirA(a^.HD);
			end;
	end;
begin
	if (a = nil) then
		writeln('--Arbol vacío-- ')
	else
		imprimirA(a);
end;


procedure buscarDestino(a:arbol);
	function destino (a:arbol; cod:integer ): lista;
	begin
		if (a <> nil) then
			if (a^.dato.codigoDestino = cod) then
				destino:= a^.dato.l
			else
				if (a^.dato.codigoDestino > cod) then
					destino(a^.HI, cod)
				else
					destino(a^.HD, cod)
	end;
var
	codigo:integer;
	l: lista;
begin
	write('Ingrese el destino a buscar: ');
	readln(codigo);
	if (a = nil) then
		writeln('--Arbol vacío-- ')
	else 
		l:=destino(a, codigo);
		if ( l = nil) then 
			writeln(' El destino con código: ', codigo, ' no posee pasajes.')
		else
			imprimirLista(l);
end;
procedure mayorCantidad(a:arbol);
	function buscarMax(a:arbol; var max:integer):integer;
	var
		cant:integer;
	begin
		cant:=0;
		while(a^.dato.l <> nil) do begin
			cant:=cant+1;
			a^.dato.l:=a^.dato.l^.sig;
		end;
		if (cant > max) then
			buscarMax:=a^.dato.codigoDestino;
	end;
var
	max,codMax:integer;
begin
	max:=-1;
	if(a = nil) then
		codMax:=-1
	else if (a^.dato.l <> nil) then begin
			codMax:= buscarMax(a,max);
		mayorCantidad(a^.HI);
		mayorCantidad(a^.HD);
	end;
	writeln('Código de ciudad de destino con mayor cantidad de pasajes vendidos: ',  codMax);
end;

{-----------programa principal-----------}
var
	a:arbol;
begin
	randomize;
	generarArbol(a);
	imprimirArbol(a);
	buscarDestino(a);
	mayorCantidad(a);
end.
