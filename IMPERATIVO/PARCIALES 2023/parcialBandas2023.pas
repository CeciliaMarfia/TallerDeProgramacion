{La ciudad de La Plata está organizando un festival de música. 
 Para ello abrió la inscripción para que las bandas locales puedan participar del festival. 
 De cada banda se desea conocer su nombre, estilo musical (un string) y cantidad de integrantes.
a) Implementar un módulo que permita la inscripción de las bandas. 
 El ingreso de datos finaliza con la banda que tiene cero integrantes. 
Los datos deben estar almacenados en una estructura ordenada por nombre de banda y ser eficiente para la búsqueda por ese criterio.
b) Implementar un módulo que reciba la estructura generada en a) 
 y devuelva una nueva estructura, ordenada por estilo musical, con todos los solistas (bandas con cantidad de integrantes igual a uno).
c) Implementar un módulo recursivo que reciba la estructura generada en a) y devuelva el nombre de la banda con
más integrantes.}
program parcialBandas2023;
const
	fin = 0;
type
	rangoEstilos = 1..15; 
	rangolntegrantes = 1..20;
	
	registro = record
		nombre: string;
		estilo: rangoEstilos;
		integrantes: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato:registro;
		HI:arbol;
		HD:arbol;
	end;
	
	solista = record
		nombre:string;
		estilo: rangoEstilos;
	end; 
	
	lista = ^nodoLista;
	nodoLista = record
		dato:solista;
		sig:lista;
	end;
	
	vector = array [rangoEstilos] of lista;
{-----fin del type----}
procedure generarArbol(var a:arbol);
	procedure leerRegistro(var reg:registro);
	begin
			reg.integrantes:=random(3);
		writeln('Integrantes: ',reg.integrantes);
		if (reg.integrantes <> fin) then begin
			reg.estilo:= random(15)+1;
			writeln('Estilo musical: ',reg.estilo);
			write('Nombre de la Banda: ');
			readln(reg.nombre);
			writeln('---------- ');
		end;
	end;
	
	procedure agregarAlArbol(var a:arbol; reg:registro);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:=reg;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if (reg.nombre <= a^.dato.nombre ) then
			agregarAlArbol(a^.HI, reg)
		else
			agregarAlArbol(a^.HD, reg);
	end;
var
	reg:registro;
begin
	a:=nil;
	leerRegistro(reg);
	while (reg.integrantes <> fin) do begin
		agregarAlArbol(a,reg);
		leerRegistro(reg);
	end;
end;

procedure imprimirArbol(a:arbol);
	procedure imprimirA(a:arbol);
	begin
		if (a<> nil) then begin
			imprimirA(a^.HI);
			writeln('Nombre de la Banda: ', a^.dato.nombre);
			writeln('Estilo: ', a^.dato.estilo);
			writeln('Integrantes: ', a^.dato.integrantes);
			writeln('--------------');
			imprimirA(a^.HD);
		end;
	end;
begin
	if (a = nil) then
		writeln('**arbol vacio**')
	else
		imprimirA(a);
end;

procedure imprimirLista(l:lista);
begin
	while (l<> nil) do begin
		writeln('Nombre de la Banda: ', l^.dato.nombre);
		writeln('Estilo: ', l^.dato.estilo);
		l:=l^.sig;
	end;
end;
procedure generarVector(a:arbol; var v:vector);

	procedure inicializarVector(var v:vector);
		var
			i:rangoEstilos;
		begin
			for i:=1 to 15 do 
				v[i]:= nil;
		end;
	procedure imprimirVector(v:vector);
	var
			i:rangoEstilos;
		begin
			for i:=1 to 15 do begin
				writeln('Estilo: ',i);
				while (v[i] <> nil) do begin
					writeln('Nombre de la Banda: ', v[i]^.dato.nombre);
					writeln('-----------------');
					v[i]:=v[i]^.sig;
				end;
			end;		
	end;
	procedure recorrerArbol(a:arbol; var v:vector; var sol:solista; var l:lista);
		procedure cargarRegistro(reg:registro; var sol:solista);
		begin
			sol.nombre:= reg.nombre;
			sol.estilo:= reg.estilo;
		end;
		
		procedure agregarAdelante(var l:lista;sol:solista);
		var
			aux:lista;
		begin
			new(aux);
			aux^.dato:= sol;
			aux^.sig:=l;
			l:=aux;
		end;
	begin
		if (a <> nil) then begin
			if (a^.dato.integrantes = 1) then begin
				cargarRegistro(a^.dato,sol);
				agregarAdelante(v[a^.dato.estilo],sol);
			end;
				recorrerArbol(a^.HI, v,sol,l);
				recorrerArbol(a^.HD, v,sol,l);		
		end;
	end;
var
	sol:solista;
	l:lista;
begin
	l:=nil;
	inicializarVector(v);
	if (a = nil) then
	writeln('**arbol vacio**')
	else begin
		recorrerArbol(a,v,sol,l);
		imprimirVector(v);
	end;
end;

procedure masIntegrantes(a:arbol);
	procedure  buscarMax(a:arbol; var nomMax:string; var cantMax:integer);
		procedure actualizarMaximo(integrantes:integer; var nomMax:string; var cantMax:integer ;nom:string);
		begin
			if (integrantes > cantMax) then begin
				cantMax:=integrantes;
				nomMax:= nom
			end;
		end;
	begin
		if (a <> nil) then begin
			actualizarMaximo(a^.dato.integrantes,nomMax, cantMax, a^.dato.nombre);
			buscarMax(a^.HI, nomMax, cantMax);
			buscarMax(a^.HD, nomMax, cantMax);	
		end;
	end;
var
	nomMax:string;
	cantMax:integer;
begin
	cantMax:=-1;
	if (a = nil) then
		writeln('ARBOL VACIO')
	else begin
		buscarMax(a, nomMax,cantMax);
		if (cantMax <> -1) then
			writeln('La banda: ',nomMax, ' posee más integrantes.',(cantMax));	
	end;
end;
{----prog principal-----}
var
	a:arbol;
	v:vector;
begin
	randomize;
	generarArbol(a);
	writeln('**Fin de la carga**');
	imprimirArbol(a);
	generarVector(a,v);
	masIntegrantes(a);
end.
