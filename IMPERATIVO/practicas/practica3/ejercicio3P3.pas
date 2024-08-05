{3. Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
de las materias finaliza con el código de materia -1.
b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.
c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
alumno con mayor promedio.
f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

program ejercicio3P3;
const
    finAlu =0;
    finCod = -1;
type
    final = record
        codigo:integer;
        nota:integer;
    end;
    
    lista = ^nodo;
    
    nodo= record
        dato:final;
        sig: lista;
    end;
    alumno = record
        legajo: integer;
        DNI: integer;
        anioI: integer;
        materia: lista;
    end;
    
    arbol = ^nodoArbol;
    
    nodoArbol = record
        dato:alumno;
        HI: arbol;
        HD: arbol;
    end;
    
    dniEIngreso = record
		dni:integer;
		anioI: integer;
    end;
    
    lista2 = ^nodo2;
    
    nodo2= record
        dato:dniEIngreso;
        sig: lista2;
    end;
	
{-------------Fin del type--------------}
procedure generarArbol(var a :arbol);
    procedure leerAlumno(var alu:alumno);
        procedure leerMateria(var mat: final);
    begin
        mat.codigo:= random(10)-1;
        writeln('Código de materia',mat.codigo) ;
        if (mat.codigo <> finCod) then begin
            mat.nota:=random(10)+1;
            writeln('Nota: ', mat.Nota);
        end;
    end;
        procedure agregarAdelante(var l:lista; mat:final);
        var aux:lista;
        begin
            new(aux);
            aux^.dato:= mat;
            aux^.sig:= l;
            l:= aux;
        end;
    var
        materia:final;
    begin
        alu.legajo:= random(10);
        writeln('Legajo: ', alu.legajo);
        if(alu.legajo <> finAlu) then begin
            alu.DNI:= random(5);
            writeln('DNI: ',alu.DNI);
            alu.anioI:=random(24)+2000;
            writeln('Anio de ingreso: ', alu.anioI);
            alu.materia := nil;
            leerMateria(materia);
            while (materia.codigo <> finCod) do begin
                agregarAdelante(alu.materia, materia);
                leerMateria(materia);
            end;
            writeln('----------------');
        end;
    end;

    procedure agregarAlArbol(var a:arbol; alu:alumno);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato:= alu;
            a^.HI:= nil;
            a^.HD:= nil;
        end
        else
            if(alu.legajo<= a^.dato.legajo) then
                agregarAlArbol(a^.HI, alu)
            else
                agregarAlArbol(a^.HD, alu)
    end;
var
    alu:alumno;
begin
    a:=nil; //inicializo la estructura
    leerAlumno(alu);
    while (alu.legajo <> finAlu) do begin
        agregarAlArbol(a,alu);
        leerAlumno(alu);
    end;
end;

procedure imprimirArbol(a:arbol);
var l:lista;
begin
    if (a <> nil) then begin
        imprimirArbol(a^.HI);
         writeln('Legajo: ', a^.dato.legajo);
         writeln('DNI: ', a^.dato.DNI);
         writeln('Anio de ingreso: ', a^.dato.anioI);
        l:= a^.dato.materia;
        while (l <> nil) do begin
            writeln('Codigo de materia: ', l^.dato.codigo);
            writeln('Nota: ', l^.dato.nota);
            l := l^.sig;//avanzo a la siguiente materia
        end;
        writeln();
        imprimirArbol(a^.HD);
        writeln('__________________');
    end;
end;

procedure recorrerYArmar(a:arbol; var l:lista2; leg:integer);
	procedure agregarAdelante(var l:lista2; dei:dniEIngreso);
	var
		nue:lista2;
	begin
		new(nue);
		nue^.dato:= dei;
		nue^.sig:= l;
		l:=nue;
	end;
var
	dei:dniEIngreso;
begin
	if (a<> nil) then begin //si el arbol no está vacío
		if( a^.dato.legajo < leg) then begin // si el que encontré es menor al legajo que me dan
			dei.dni := a^.dato.dni; //cargo el registro
			dei.anioI :=  a^.dato.anioI;
			agregarAdelante(l,dei); //lo cargo en la lista
		end;
		recorrerYArmar(a^.HI,l ,leg); //busco por el HI 
		recorrerYArmar(a^.HD,l ,leg); //busco por el HD
	end;
end;
procedure imprimirLista(l:lista2);
begin
	while(l <> nil) do begin
		writeln('DNI ',l^.dato.dni);
		writeln('AÑO DE INGRESO ',l^.dato.anioI);
		writeln('------------');
		l:= l^.sig;
	end;
end;

function LegajoMasGrande (a:arbol):integer;
begin
	if(a^.HD = nil) then //llegué al nodo "más grande", el que está más a la derecha
		LegajoMasGrande:=a^.dato.legajo
	else
		LegajoMasGrande:=LegajoMasGrande(a^.HD );
end;

 {procedure dniMasGrande(a:arbol);
	   procedure actualizarMaximo(var maxElem : integer; nuevoValor, nuevoElem : integer);
	begin
	  if (nuevoValor >= maxValor) then
	  begin
		maxValor := nuevoValor;
		maxElem := nuevoElem;
	  end;
	end;
	* 
	procedure dniMayor (a: arbol; var maxDNI: integer);
	begin
	   if (a <> nil) then  begin //si el arbol no está vacío
		  actualizarMaximo(maxDNI,a^.dato.dni); //actualizo el máximo
		  dniMayor(a^.hi, maxEdad,maxDNI); //recorro por el hijo izquiero y voy actyualizando
		  dniMayor(a^.hd, maxEdad,maxDNI); //recorro por el hijo derecho y voy actualizando
	   end; 
	end;
var
	maxDNI:integer;
 begin
	maxDNI:=-1;
	dniMayor (a, maxDNI);
	if (maxDNI = -1) then
		writeln('-- El árbol está vacío --')
	else
		writeln ('Numero de DNI más grande: ', maxDNI);
 end;}

function legajosImpares(a:arbol):integer;
begin
	if (a = nil) then
		legajosImpares:= 0
		else
			legajosImpares:= ((legajosImpares(a^.hi) + legajosImpares(a^.hd)) + (a^.dato.legajo mod 2));
end;

{-----------Programa Principal------------}
var
    a:arbol;
    l2:lista2;
    leg:integer;
begin
    randomize;
    generarArbol(a);
    writeln('-------- Listado de Alumnos --------');
    imprimirArbol(a);
    write('Ingrese un legajo:');
    readln(leg);
    recorrerYArmar(a,l2,leg);
    imprimirLista(l2);
    writeln('Legajo más grande:', LegajoMasGrande(a));
   // dniMasGrande(a))
    writeln('Cantidad de Legajos impares:', legajosImpares(a));

    
    
end.
