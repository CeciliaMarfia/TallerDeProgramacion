{4. Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se lee código, DNI de la persona, año y tipo de reclamo. La lectura finaliza con el código de
igual a -1. Se pide:
a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.
c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.
d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.}

program ejercicio4p5;
const
	fin = -1;
type
	cadena20 = string[20];
	
    reclamo  = record
		codigo: integer;
		dni:integer;
		anio:integer;
		tipoReclamo:integer;
    end;
    
    infoReclamo = record
		codigo:integer;
		anio:integer;
		tipoReclamo:integer;
    end;
    
    lista = ^nodoLista;
    nodoLista = record
		dato:infoReclamo;
		sig:lista;
    end;
    
    infoDNI = record
		dni:integer;
		reclamo:lista;
		cantReclamos:integer;
    end;
       
	arbol = ^nodo;
	nodo = record
	    dato: infoDNI;
	    HI:arbol;
	    HD:arbol;
	end;

{----fin del type------}
procedure generarArbol(var a:arbol);
	procedure 	leerReclamo(var rec:reclamo);
	begin
		with rec do begin
			codigo:= random(10)-1;
			writeln('Codigo: ', codigo);
			if (codigo <> fin) then begin
				dni:= random(5)+1;
				writeln('DNI: ',dni);
				anio:= random(24)+2000;
				writeln('anio: ', anio);
				tipoReclamo:= random(5)+1;
				write('reclamo: ',tipoReclamo);
				writeln('.....................');
			end;
		end;
	end;
	
	procedure cargarRegistro(rec:reclamo; var info:infoDNI);
	begin
		info.codigo:= rec.codigo;
		info.anio:= rec.anio;
		info.tipoReclamo:= rec.tipoReclamo;
	end;
	
	procedure agregarAlArbol(var a:arbol; info:infoDNI;dni:infoDNI);
	 procedure agregarAdelante(var l:lista;info: infoRegistro);
	 var
		aux:lista;
	 begin
		new(aux);
		aux^.dato:=info;
		aux^.sig:=l;
		l:=aux;
	 end;
	 
	begin
		if (a = nil) then begin
				new(a);
				a^.dato:=dni;
				a^.dato.dni:=info.dni;
				a^.dato.cantReclamos:=1;
				a^.dato.reclamo:=nil;
				agregarAdelante(a^.dato.reclamo,info);
				a^.HI:=nil;
				a^.HD:=nil;
			end
			else
				if (info.dni = a^.dato.dni ) then begin
					agregarAdelante(a^.dato.reclamo,info);
					a^.dato.cantReclamos:=a^.dato.cantReclamos+1;
				end
			else if (info.dni < a^.dato.dni ) then
				agregarAlArbol(a^.HI, info)
			else
				agregarAlArbol(a^.HD, info);
	end;
	
var
	rec:reclamo;
	info:infoDNI;
begin
	a:=nil;
	leerReclamo(rec);
	while (rec.codigo <> fin) do begin
		cargarRegistro(rec,info);
		agregarAlArbol(a, info);
		leerReclamo(rec);
	end;
end;

procedure imprimirArbol(a:arbol);
	procedure imprimirA(a:arbol);
	begin
		if(a <> nil) then begin
			imprimirA(a^.HI);
			writeln('DNI: ',a^.dato.dni);
			writeln('reclamo: ',a^.dato.cantReclamos);
			writeln('----------------');
			imprimirA(a^.HD);
		end;
	end;
begin
	if (a = nil) then
		writeln('--ARBOL VACIO--')
	else
		imprimirA(a);
end;

procedure buscarDNI(a:arbol);
	function cantXDNI(a:arbol;dniABuscar:integer):integer;
	begin
		if(a = nil) then
			cantXDNI:=0
		else
			if (dniABuscar = a^.dato.dni) then
			cantXDNI:=a^.dato.cantReclamos
			else
				if (dniABuscar < a^.dato.dni) then
					cantXDNI(a^.HI,dniABuscar)
				else
					cantXDNI(a^.HD,dniABuscar)
	end;
var
	dniABuscar,total:integer;
begin
	writeln('DNI a buscar: ');
	readln(dniABuscar);
	total:=cantXDNI(a,dniABuscar);
	writeln('Cantidad de reclamos para el ',dniABuscar,' es: ',total);
	
end;
{-----programa principal-----}
var
	a:arbol;
begin
	randomize;
	generarArbol(a);
	imprimirArbol(a);
	buscarDNI(a);
end.
