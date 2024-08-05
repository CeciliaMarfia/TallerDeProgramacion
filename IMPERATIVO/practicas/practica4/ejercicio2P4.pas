{Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.
c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.
d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.}
program ejercicio2p4;
const
	fin = -1;
type
    rangoDia= 1..31;
    rangoMes = 1..12;
    
    prestamo = record
        isbn: integer;
        nroSocio:integer;
        dia:rangoDia;
        mes:rangoMes;
        cantDias:integer;
    end;
    
	arbol = ^nodo;
	
	nodo = record
		dato:prestamo;
		HI:arbol;
		HD:arbol;
	end;
	
	infoPrestamo = record
        nroSocio:integer;
        dia:rangoDia;
        mes:rangoMes;
        cantDias:integer;
    end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato:infoPrestamo;
		sig:lista;
	end;
	
	infoLibro = record
		isbn:integer;
		l: lista;
	end;
	
	arbol2 = ^nodo2;
	
	nodo2 = record
		dato:infoLibro;
		HI:arbol2;
		HD:arbol2;
	end;
		
{-------fin del type---------}
procedure generarArboles(var a: arbol; var a2: arbol2);
    procedure leerPrestamo(var pres: prestamo);
    begin
        with pres do begin
            isbn := random(7) - 1;
            writeln('ISBN: ', isbn);
            if (isbn <> fin) then begin
                nroSocio := random(10) + 1;
                writeln('Nro de socio: ', nroSocio);
                dia := random(31) + 1;
                writeln('Día: ', dia);
                mes := random(12) + 1;
                writeln('Mes: ', mes);
                cantDias := random(5) + 1;
                writeln('cantidad de días prestados: ', cantDias);
                writeln('......................');
            end;
        end;
    end;

    procedure agregarAlArbol(var a: arbol; pres: prestamo);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato := pres;
            a^.HI := nil;
            a^.HD := nil;
        end
        else if (pres.isbn <= a^.dato.isbn) then
            agregarAlArbol(a^.HI, pres)
        else
            agregarAlArbol(a^.HD, pres);
    end;

    procedure agregarAlArbol2(var a2: arbol2; info: infoLibro);
        procedure agregarAdelante(var l: lista; infoP: infoPrestamo);
        var
            aux: lista;
        begin
            new(aux);
            aux^.dato := infoP;
            aux^.sig := l;
            l := aux;
        end;
   begin
       if (a2 = nil) then begin
            new(a2);
            a2^.dato := info;
            a2^.dato.l:=nil;
            agregarAdelante(a2^.dato.l,infoP);//para guardar el primer nodo de la lista
            a2^.HI := nil;
            a2^.HD := nil;
        end
        else if (info.isbn = a2^.dato.isbn) then
             agregarAdelante(a2^.dato.l,infoP)
        else if (info.isbn < a2^.dato.isbn) then
            agregarAlArbol2(a2^.HI, infoP)
        else
            agregarAlArbol2(a2^.HD, infoP);
    end;
	procedure cargarRegistroInfoPres(pres:prestamo ; var  infoPres:infoPrestamo);
	begin
		infoPres.nroSocio:= pres.nroSocio;
		infoPres.dia:= pres.dia;
        infoPres.mes:= pres.mes;
		infoPres.cantDias:= pres.cantDias;	
	end;
var
    pres: prestamo;
    info: infoLibro;
    infoPres
begin
    a := nil;
    a2 := nil;
    leerPrestamo(pres);
    while (pres.isbn <> fin) do begin
        agregarAlArbol(a, pres);
		cargarRegistroInfoPres(pres, infoPres);
        info.isbn:= pres.isbn;
        agregarAlArbol2(a2, info);
        leerPrestamo(pres);
    end;
end;


procedure imprimirArboles(a:arbol; a2:arbol2);
	procedure imprimirArbol1(a:arbol);
	begin
		if (a <> nil) then begin
			imprimirArbol1(a^.HI);
			writeln ('ISBN: ',a^.dato.isbn);
			writeln ('NRO. SOCIO: ',a^.dato.nroSocio);
			writeln ('DIA: ',a^.dato.dia);
			writeln ('MES: ',a^.dato.mes);
			writeln ('DIAS PRESTADOS: ',a^.dato.cantDias);
			writeln ('______');
			imprimirArbol1(a^.HD);
		end;
	end;
	procedure imprimirArbol2(a2:arbol2);
	var
		l:lista;
	begin
			 if (a2 <> nil) then begin
				l:=a2^.dato;
				imprimirArbol2(a2^.HI);
				while (l <> nil) do begin
					writeln ('ISBN: ',l^.dato.isbn);
					writeln ('NRO. SOCIO: ',l^.dato.nroSocio);
					writeln ('DIA: ',l^.dato.dia);
					writeln ('MES: ',l^.dato.mes);
					writeln ('DIAS PRESTADOS: ',l^.dato.cantDias);
					writeln ('______________');
				l:=l^.sig;
				end;
				imprimirArbol2(a2^.HD);
			end;
	end;
begin
	if (a = nil) then
        writeln ('-árbol vacío--')
    else 
    writeln('--ARBOL DE PRESTAMOS--');
    if (a = nil) then
        writeln ('-árbol vacío--')
    else 
		imprimirArbol1(a);
    writeln('--ARBOL X ISBN--');
     if (a = nil) then
        writeln ('-árbol vacío--')
      else
		imprimirArbol2(a2);
end;

procedure calcularMaximoYMinimoiSBN(a:arbol);
	function isbnMayor(a:arbol): integer;
	begin
		if(a^.HD = nil) then
			isbnMayor:=(a^.dato.isbn)
		else 
			isbnMayor:=isbnMayor(a^.HD);
	end;
	
	function isbnMenor(a:arbol): integer;
	begin
		if(a^.HI = nil) then
			isbnMenor:=(a^.dato.isbn)
		else 
			isbnMenor:=isbnMenor(a^.HI);
	end;
	
begin
	writeln('Mayor  ISBN es: ', isbnMayor(a));
	writeln('Menor  ISBN es: ', isbnMenor(a));
end;

procedure calcularPrestamosSocio(a:arbol);
function calcularPrestamo(a: arbol; numSoc:integer):integer;
begin
	if(a = nil) then
		calcularPrestamo:=0
	else
		if(a^.dato.nroSocio = numSoc) then
			calcularPrestamo:=calcularPrestamo(a^.HI,numSoc) + calcularPrestamo(a^.HD,numSoc) +1
		else
			calcularPrestamo:=calcularPrestamo(a^.HI,numSoc) + calcularPrestamo(a^.HD,numSoc);
end;

var
	numSocio:integer;
begin
	write('Ingrese un número de socio:');
	readln(numSocio);
	write('Cantidad de prestamos para el socio', numSocio,' es : ',calcularPrestamo(a, numSocio));
end;
{-------programa principal---------}
var
    a:arbol;
    a2:arbol2;
begin
    randomize;
    generarArboles(a, a2);
	calcularMaximoYMinimoISBN(a);
	calcularPrestamosSocio(a);
end.
