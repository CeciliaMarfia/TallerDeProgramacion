{1.- Implementar un programa que procese la información de los alumnos de la Facultad de Informática.
a) Implementar un módulo que lea y retorne, en una estructura adecuada, la información de todos los alumnos. 
De cada alumno se lee su apellido, número de alumno, año de ingreso, cantidad de materias aprobadas (a lo sumo 36) 
y nota obtenida (sin contar los aplazos) en cada una de las materias aprobadas. La lectura finaliza cuando se ingresa el número de alumno 11111, el cual debe procesarse.
b) Implementar un módulo que reciba la estructura generada en el inciso a) y retorne número de alumno y promedio de cada alumno.
c) Analizar: ¿qué cambios requieren los puntos a y b, si no se sabe de antemano la cantidad de materias aprobadas de cada alumno, 
y si además se desean registrar los aplazos? ¿cómo puede diseñarse una solución modularizada que requiera la menor cantidad de cambios?}
program ejercicioPractica;
const
	dimF =  36;
	fin =  1;// va 11111 pero pongo 1 parapoder probar
	valorAlto= 999;
type
	rangoMaterias = 0..dimF;
	rangoAnio = 2000..2023;
	cadena20 = String[20];
	
	vectorMaterias = array [rangoMaterias] of integer;  
	
	alumno = record
		apellido: cadena20;
		numAlu: integer;
		anioIngreso:integer;
		matAprobadas: rangoMaterias;
		notaObtenida: vectorMaterias;
	end;

 lista = ^nodo;

    nodo = record           
    	dato: alumno;
    	sig: lista;
    end;

	alumnoFinal = record
		nroAlu: integer;
		promedio:real;
	end;

 lista2 = ^nodo2;

    nodo2 = record           
    	dato: alumnoFinal;
    	sig: lista2;
    end;



 {----Fin del type----------------}
 {a) Implementar un módulo que lea y retorne, en una estructura adecuada, la información de todos los alumnos. 
De cada alumno se lee su apellido, número de alumno, año de ingreso, cantidad de materias aprobadas (a lo sumo 36) 
y nota obtenida (sin contar los aplazos) en cada una de las materias aprobadas. La lectura finaliza cuando se ingresa el número de alumno 11111, el cual debe procesarse.}
procedure cargarLista(var l:lista);

	procedure leerAlumno (var alu:alumno);
		procedure cargarNotasObtenidas(var v:vectorMaterias; matAprobadas:rangoMaterias);
		var
			i:rangoMaterias;
		begin
			for i:=1 to matAprobadas do
				v[i]:= random(6)+4;
		end;
	begin
		with alu do begin
			 numAlu:= random(10);
			 writeln('Nro de alumno: ',numAlu);
			if(numAlu <> fin) then begin
				write('Apellido del alumno: ');
				readln(apellido);
				anioIngreso:= random(24)+2000;
				writeln('Año de ingreso: ',anioIngreso);
				matAprobadas:= random(dimF);
				writeln('Cantidad de materias aprobadas (a lo sumo 36) : ',matAprobadas);
				if matAprobadas > 0 then
					cargarNotasObtenidas(notaObtenida, matAprobadas); //ver en caso de else?
			end;
		end;
	end;
	procedure agregarAdelante(var pri: lista; alu: alumno);
	var
		 aux: lista;
	begin
		new (aux);
		aux^.dato := alu;
		aux^.sig := pri;
		pri := aux;
	end;

var
	alu:alumno;
begin
	l:=nil;
	repeat
		leerAlumno(alu);
		if(alu.numAlu <> fin) then //verifico no cargar el registro con el num de alu 11111
			agregarAdelante(l,alu);
	until (alu.numAlu = fin);
	writeln('--FIN DE LA CARGA--');
end;
{b) Implementar un módulo que reciba la estructura generada en el inciso a) y retorne número de alumno y promedio de cada alumno.}
procedure recorrerLista(l:lista; var l2:lista2);
	function calcularPromedio(vec:vectorMaterias; matAprobadas:rangoMaterias):real;
		var
			i: rangoMaterias;
			suma:integer;
		begin
			suma:=0;
			for i:=1 to matAprobadas do
				suma:= suma + vec[i];
			calcularPromedio:= suma/matAprobadas;
		end;
	procedure cargarAlumno2(var aluFinal: alumnoFinal; numAlu:integer;promedio:real);
	begin
		aluFinal.nroAlu:= numAlu;
		aluFinal.promedio:= promedio;
	end;
	procedure cargarLista2(aluFinal: alumnoFinal; var l2: lista2);
	var
		aux: lista2;
	begin
		new(aux);
		aux^.dato := aluFinal;
		aux^.sig := l2;
		l2 := aux;
	end;

var
	promedio:real;
	aluFinal: alumnoFinal;
begin
	while (l <> nil) do begin
		promedio := calcularPromedio(l^.dato.notaObtenida, l^.dato.matAprobadas);
		cargarAlumno2(aluFinal, l^.dato.numAlu, promedio);
		cargarLista2(aluFinal, l2);
		l := l^.sig;
	end;
end;
procedure informarAlumno( l2:lista2);
	begin
		while (l2<> nil) do begin
			writeln('Nro de alumno: ',l2^.dato.nroAlu);
			writeln('Promedio:', l2^.dato.promedio:1:2);
			l2:=l2^.sig;
		end;
	end;

{---------------Programa Principal----------------}
var
	l:lista;
	l2:lista2;
begin
	randomize;
	cargarLista(l);
	recorrerLista(l,l2);
	informarAlumno(l2);
end.
