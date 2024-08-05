{3. Una facultad nos ha encargado procesar la información de sus alumnos de la carrera XXX.
Esta carrera tiene 30 materias. Implementar un programa con:
a. Un módulo que lea la información de los finales rendidos por los alumnos y los
almacene en dos estructuras de datos.
i. Una estructura que para cada alumno se almacenen sólo código y nota de las
materias aprobadas (4 a 10). De cada final rendido se lee el código del alumno, el
código de materia y la nota (valor entre 1 y 10). La lectura de los finales finaliza con
nota -1. La estructura debe ser eficiente para buscar por código de alumno.
ii. Otra estructura que almacene para cada materia, su código y todos los finales
rendidos en esa materia (código de alumno y nota).
b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los
códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.
c. Un módulo que reciba la estructura generada en i., dos códigos de alumnos y un valor
entero, y retorne la cantidad de alumnos con cantidad de finales aprobados igual al
valor ingresado para aquellos alumnos cuyos códigos están comprendidos entre los dos
códigos de alumnos ingresados.
}
program ejercicio3P4;
const
    fin = -1;
    dimF = 30;
type
    rangoNota = 1..10;
    rangoAprobado = 4..10;
    rangoMaterias = 1..dimF;
    
    vectorMateria = array [rangoMaterias] of  rangoAprobado;
    
    infoAlumno = record
        codigo:integer;
        nota:vectorMateria;
    end;
    
    arbol = ^nodoArbol;
    
    nodoArbol = record
        dato:infoAlumno;
        HI:arbol;
        HD:arbol;
    end;
    
    infoFinal = record
        legajo: integer;
        codMateria:rangoMaterias;//leer pero no guardar
        nota:rangoNota;
    end;
    
    lista = ^nodo;
    
    nodo = record
		dato: infoFinal;
		sig: lista;
    end;
    
    vectorAlumnos = array [rangoMaterias] of lista;
    
    
    
{---------------fin del type---------------}
procedure generarArbol(var a:arbol);
	procedure inicializarVectorAlumnos(va:vectorAlumnos);
	var
		i:rangoMaterias;
	begin
		for i := 1 to dimF do
			va[i]:=nil;
	end;
	
   procedure leerFinal( var v:vectorMateria);
	var
		cod : integer;
		nota : integer;
	begin
		cod:= random(30)+1;
		writeln('Codigo de la materia');
		nota:= random(10)-1;
		writeln('Nota: ',nota);
		while (nota <> -1) do begin
				If ((nota >= 4) and (cod <= dimF)) then 
					v[cod] := nota;
				cod:= random(30)+1;
			writeln('Codigo de la materia');
			nota:= random(10)-1;
			writeln('Nota: ',nota);
		end;
	end;
		
    
        procedure generarNodo (var a : arbol; alu : infoAlumno);
		begin
			If (a = nil) then begin
				new(a);
				a^.dato := alu;
				a^.HI := nil; 
				a^.HD := nil;
			end 
			else If (a.codigo <= a^.dato.codigo) then
				generarNodo(a^.HI)
			else
				generarNodo(a^.HD);
		end;
        
var
    f:infoFinal; ia:infoAlumno;
begin
    a:=nil;
    ia.codigo:=random(10)-1;
    writeln('Codigo del alumno:',ia.codigo);
    while(ia.codigo <> fin) do begin
		leerFinal(ia.nota);
       generarNodo(ia,alu);
        leerFinal(fr);
    end;
end;
{---------programa principal--------------}
var
    a:arbol;
begin
    randomize;
    generarArbol(a);
  
end.
