{PlayStation Store requiere procesar las compras realizadas por sus clientes durante el año 2022.
a) Implementar un módulo que lea compras de videojuegos. 
De cada compra se lee código del videojuego, código de cliente, día y mes. La lectura finaliza con el código de cliente 0. Se sugiere utilizar el módulo leerCompra(). Se deben
retornar 2 estructuras de datos:
i. Una estructura eficiente para la búsqueda por código de cliente.
ii. Otra estructura que almacena la cantidad de compras realizadas en cada mes.
b) Implementar un módulo que reciba la estructura generada en a) i, un código de cliente, retorne todas las compras
que realizó dicho cliente.
c) Implementar un módulo que reciba la estructura generada en a) ii y retorne la misma estructura ordenada por
cantidad de mayor a menor.
NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.}
program parcialjuegos;
const
	fin = 0;
	dimF = 12;
type
	sub_dia = 1..31;
	sub_mes = 1..12;
	
	compra = record
		videojuego: integer;
		cliente: integer;
		dia: sub_dia;
		mes: sub_mes;
	end;
	
	vector = array [sub_mes] of integer;
	
	arbol = ^nodo;
	nodo = record
		dato: compra;
		HI:arbol;
		HD:arbol;
	end;
	
	infoCompra = record
		videojuego: integer;
		dia: sub_dia;
		mes: sub_mes;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato:infoCompra;
		sig:lista;
	end;
	
	{-----fin del type--------}
procedure generarArbol(var a:arbol; var v:vector);
	procedure leerCompra(var c : compra);
	begin
		c.cliente := Random(100);
		writeln('cliente :',c.cliente );
		if (c.cliente <> 0) then begin
			c.dia:= Random(31) + 1;
			writeln('dia: ',c.dia);
			c.mes := Random(12) + 1;
			writeln(' mes: ',c.mes );
			c. videojuego := Random(20000) + 1;
			writeln(' videojuego: ',c. videojuego);
		end;
	end;
	
	procedure inicializarVector(var v:vector);
	var
		i:sub_mes;
	begin
		for i:=1 to 12 do
			v[i]:=0;
	end;
	procedure insertarAlArbol(var a:arbol; com:compra);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:=com;
			a^.HI:=nil;
			a^.HD:= nil;
	end
	else
		if (com.cliente<= a^.dato.cliente) then
			insertarAlArbol(a^.HI,com)
		else
			insertarAlArbol(a^.HD,com);
	end;
var
	com:compra;
begin
	leerCompra(com);
	inicializarVector(v);
	while (com.cliente <> fin) do begin
		v[com.mes]:=v[com.mes]+1;
		insertarAlArbol(a, com);
		leerCompra(com);
	end;
end;
procedure imprimirArbol(a:arbol);
	procedure imprimirA(a:arbol);
	begin
		if (a<> nil) then begin
			imprimirA(a^.HI);
			writeln('**Código de videojuego : ', a^.dato.videojuego);
			writeln('Cliente : ', a^.dato.cliente);
			writeln('Día : ', a^.dato.dia);
			writeln('Mes : ', a^.dato.mes);
			writeln('-*-*-*-*-*-*-*- ');
			imprimirA(a^.HD);
			end;
	end;
begin
	if (a = nil) then
		writeln('--Arbol vacío-- ')
	else
		imprimirA(a);
end;

procedure ordenarSeleccion (var v: vector; dimF: integer);
var
    i, j, min: integer; 
    item: integer;
begin
    for i := 1 to dimF-1 do begin
        min := i; { necesito guardar la pos minima actual porque es el inicio }
        for j := i+1 to dimF do{para buscar el elemento mínimo en cada pasada}
            if (v[j] > v[min]) then {verifico si hay actualizar el min}
                  min := j;
        { intercambia v[i] con v[min], incluso si no es necesario }
        item := v[min];{guardo el elemento mínimo en una variable auxiliar}
        v[min] := v[i];{en la posición actual guardo el mínimo}
        v[i] := item;
    end;
end;
procedure imprimirVector(v:vector);
var
	i:sub_mes;
begin
	for i:= 1 to dimF do begin
		writeln('Mes: ', i);
		writeln('Cantidad: ', v[i]);
	end;
end;
procedure retornarCompraCliente(a:arbol);
	procedure comprasClientes(a:arbol;codigo:integer;var l:lista);
		procedure cargarRegistro(c:compra; var info:infoCompra);
		begin
			info.videojuego:=c.videojuego;
			info.dia:=c.dia;
			info.mes:= c.mes;
		end;
		procedure agregarAdelante(var l:lista; info:infoCompra);
		var
			nue:lista;
		begin
			new(nue);
			nue^.dato:=info;
			nue^.sig:=nil;
			l:=nue;
		end;
	var
		info:infoCompra;
	begin
		if (a =nil) then
			l:= nil
		else
			if (a^.dato.cliente = codigo) then begin
				cargarRegistro(a^.dato,info);
				agregarAdelante(l,info);
				comprasClientes(a^.HI, codigo,l);
			end
			else
				if (codigo < a^.dato.cliente) then 
					comprasClientes(a^.HI, codigo,l)
				else comprasClientes(a^.HD, codigo,l);
				
	end;
	
	procedure imprimirLista(l:lista);
	begin
		while (l<> nil) do begin
			writeln('Videojuego: ', l^.dato.videojuego);
			writeln('dia: ', l^.dato.dia);
			writeln('mes: ', l^.dato.mes);
			l:=l^.sig;
		end;
	end;
var
	l:lista; codigo:integer;
begin
	write(' Ingrese un código de cliente para buscar sus compras:');
	readln(codigo);
	if (a = nil) then
		writeln('--Arbol vacio--')
	else begin
		comprasClientes(a,codigo,l);
		imprimirLista(l);
	end;
end;
var
	a:arbol; v:vector;
begin
	generarArbol(a,v);
	imprimirArbol(a);
	retornarCompraCliente(a);
	writeln('Vector resultante: ');
	imprimirVector(v);
	ordenarSeleccion(v,dimF);
	writeln('Ahora ordenado: ');
	imprimirVector(v);
end.
