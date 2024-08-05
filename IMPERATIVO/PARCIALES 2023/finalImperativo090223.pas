{Final Taller de programación - Práctico - Módulo imperativo
09/02/2023
Una escuela secundaria organiza un concurso de fotografía entre todos sus alumnos
* . Cada alumno presenta una fotografia, la cual es valorada por un jurado experto el cuál le asigna un puntaje (número real) entre O y 100. De los alumnos se desea
registrar su nombre, DNI y puntaje otorgado a su fotografía.
Implemente en pascal:
a) Un módulo que realice la inscripción de los alumnos almacenando toda la información en una estructura que permita la búsqueda eficiente de alumnos por puntaje otorgado.
*  La carga finaliza hasta leer el alumno con DNI igual
a cero.
b) Un módulo que reciba la estructura generada en a), un rango de puntajes (dos números reales, por ejemplo, 60,5 y 80,2) y devuelva una lista ordenada por puntaje;
 donde en esta lista se encuentren todos los alumnos cuyo puntaje esté incluido en el rango recibido. Nota: este módulo debe ser lo más eficiente posible en cuánto a tiempo de ejecución.
c) Un módulo que reciba la estructura generada en a) y devuelva el puntaje del alumno con DNI más chico.}
program fotografias2023;
const
	fin = 0;
type
	cadena30 = string[30];

	alumno = record
		nombre:cadena30;
		dni:integer;
		puntaje:real;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		dato:alumno;
		HI:arbol;
		HD:arbol;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato:alumno;
		sig:lista;
	end;
{---fin del type ----}
procedure generarArbol(var a:arbol);
	procedure leerAlumno(var alu:alumno);
	begin
		with alu do begin
			dni:=random(5);
			writeln(' DNI: ',dni );
			if (dni <> fin) then begin
				write(' Nombre: ');
				readln(nombre);
				puntaje:=random(100)+1; //ver el tema de reales
				writeln('Puntaje : ', puntaje:2:2);
				writeln(' ................. ');
			end;
		end;
	end;
	
	procedure insertarAlArbol(var a:arbol; alu:alumno);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:=alu;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
			if (alu.puntaje <= a^.dato.puntaje) then
				insertarAlArbol(a^.HI, alu)
			else
				insertarAlArbol(a^.HD, alu);
				
	end;

var
	alu:alumno;
begin
	a:=nil;
	leerAlumno(alu);
	while (alu.dni <> fin) do begin
		insertarAlArbol(a,alu);
		leerAlumno(alu);
	end;
end;

procedure imprimirArbol(a:arbol);
	procedure imprimirA(a:arbol);
	begin
		if (a <> nil) then begin
			imprimirA(a^.HI);
			writeln('Nombre: ',a^.dato.nombre);
			writeln('DNI: ',a^.dato.dni);
			writeln('Puntaje: ',a^.dato.puntaje:2:2);
			writeln('______________');
		imprimirA(a^.HD);
		end;	
	end;
	
begin
	if (a = nil) then
		writeln('arbol vacio')
	else
		imprimirA(a);
end;
procedure generarLista(a:arbol; var l:lista);
	procedure imprimirLista(l:lista);
	begin
		if (l= nil) then
		writeln('lista vacia')
		else begin
			while(l<> nil) do begin
				writeln('Nombre: ',l^.dato.nombre);
				writeln('DNI: ',l^.dato.dni);
				writeln('Puntaje: ',l^.dato.puntaje:2:2);
				writeln('______________');
				l:=l^.sig;
			end;	
		end;
	end;
	
	procedure agregarAdelante(var l:lista; alu:alumno);
	var
		aux:lista;
	begin
		new(aux);
		aux^.dato:=alu;
		aux^.sig:=l;
		l:=aux;
	end;
		
	procedure entreValores(a:arbol; var l:lista; inf, sup:real);
	begin
		if ( a <> nil) then begin
			if (a^.dato.puntaje > inf) and (a^.dato.puntaje< sup) then begin
				entreValores(a^.HI,l, inf, sup);
				agregarAdelante(l,a^.dato);
				entreValores(a^.HD,l, inf, sup);
			end
			else
				if (a^.dato.puntaje< inf) then 
					entreValores(a^.HD,l, inf, sup)
				else
					if(a^.dato.puntaje > sup) then
						entreValores(a^.HI,l, inf, sup);
		end;
	end;
var
	inf,sup:real;
begin
	l:=nil;
	write('Íngrese el limite inferior: ');
	readln(inf);
	write('Íngrese el limite superior: ');
	readln(sup);
	if (a = nil) then
		writeln('arbol vacio')
	else begin
		entreValores(a,l, inf, sup);
		imprimirLista(l);
	end;
end;

procedure dniMasChico(a:arbol);
	procedure calcularMin(a:arbol; var puntajeMin:real; var dniMin:integer);
		procedure actualizarMin(alu:alumno; var puntajeMin:real; var dniMin:integer);
		begin
			if(alu.dni < dniMin) then begin
				puntajeMin:=alu.puntaje;
				dniMin:=alu.dni;
			end;
		end;
	begin
		if(a <> nil) then begin
			actualizarMin(a^.dato,puntajeMin,dniMin);
		    calcularMin(a^.HI,puntajeMin,dniMin);
		    calcularMin(a^.HD,puntajeMin,dniMin)
		end;
	end;
	
var
	dniMin:integer;
	puntajeMin:real;
begin
	dniMin:=999;
	if(a = nil) then
		writeln('arbol vacio')
	else begin
		calcularMin(a,puntajeMin,dniMin);
			writeln(' Puntaje ',puntajeMin:2:2,'para el DNI más chico: ',dniMin );	
	end;
end;
{--programa principal----}
var
	a:arbol;
	l:lista;
begin
	generarArbol(a);
	writeln();
	writeln('** FIN DE LA CARGA**');
	imprimirArbol(a);
	generarLista(a,l);
	dniMasChico(a);
end.
