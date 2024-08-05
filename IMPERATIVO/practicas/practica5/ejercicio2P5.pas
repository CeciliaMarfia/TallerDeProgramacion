{2. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta. Implementar un programa que:
a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}
program ejercicio2P5;
const
    fin = '.';
    dimF = 2018;
type
    cadena5 = string[5];
    cadena10 = string[10];
    rangoFab = 2010..2018;
    
    auto = record
        patente:cadena5;
        anioFab:rangoFab;
        marca: cadena10;
        modelo:cadena10;
    end;
    
    arbol = ^nodoArbol;
    
    nodoArbol = record
        dato:auto;
        HI:arbol;
        HD:arbol;
    end;
    
    autoMismaMarca = record
        patente:cadena5;
        anioFab:rangoFab;
        modelo:cadena10
    end;
    
    lista = ^nodo;
    
    nodo = record
        dato:autoMismaMarca;
        sig:lista;
    end;
    
    reg = record
        marca: cadena10;
        listaAutos: lista;
    end;
    
    arbol2 = ^nodoArbol2;
    
    nodoArbol2 = record
        dato: reg;
        HI:arbol2;
        HD:arbol2;
    end;
    
    autoSAnio = record
		patente:cadena5;
        marca: cadena10;
        modelo:cadena10;
    end;
    
     lista2 = ^nodoLista2;
    
    nodoLista2 = record
        dato: autoSAnio;
        sig:lista2;
    end;
    vector = array [rangoFab] of lista2;
{--------fin del type-----------}
procedure generarArboles(var a:arbol;var a2:arbol2);
        procedure leerAuto(var aut:auto);
        begin
            with aut do begin
                writeln('Ingrese una patente: ');
                readln(patente);
                if (patente <> fin) then begin
                    anioFab:=random(19)+2000;
                    writeln('Año de fabricación: ',anioFab);
                    writeln('Ingrese la marca: ');
                    readln(marca);
                    writeln('Ingrese el modelo: ');
                    readln(modelo);
                    writeln('.........');
                end;
        end;
    end;
    procedure agregarAlArbol(var a:arbol; aut:auto);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato:= aut;
            a^.HI:= nil;
            a^.HD:= nil;
        end
        else
            if (aut.patente <= a^.dato.patente) then
                agregarAlArbol(a^.HI, aut)
            else
                agregarAlArbol(a^.HD, aut);
    end;
    
    procedure agregarAlArbol2(var a2:arbol2; marca: cadena10; a: autoMismaMarca);
        procedure agregarAdelante(var l:lista);
        var
            aux:lista;
        begin
            new(aux);
            aux^.dato:=a;
            aux^.sig:=l;
            l:=aux;
        end;
    begin
        if (a2 = nil) then begin
            new(a2);
            a2^.dato.listaAutos:=nil;
            agregarAdelante(a2^.dato.listaAutos);
            a2^.dato.marca:= marca;
            a2^.HI:= nil;
            a2^.HD:= nil;
        end
        else
            if (marca = a2^.dato.marca) then
                agregarAdelante(a2^.dato.listaAutos)
            else if (marca < a2^.dato.marca) then
                agregarAlArbol2(a2^.HI, marca, a)
                else
                agregarAlArbol2(a2^.HD, marca, a);
    end;
  procedure armarRegistro (aut: auto; var info: autoMismaMarca);
    begin
        with info do begin
            patente:=aut.patente;
            anioFab:=aut.anioFab;
            modelo:=aut.modelo;
        end;
    end;
var
    aut:auto;
    info: autoMismaMarca;
begin
    a:=nil;
    a2:=nil;
    leerAuto(aut);
    while(aut.patente <> fin) do begin
         agregarAlArbol(a, aut);
         armarRegistro(aut, info);
         agregarAlArbol2(a2, aut.marca, info);
         leerAuto(aut);
    end;
end;
procedure imprimirArboles(a:arbol; a2:arbol2);
    procedure imprimirArbol(a:arbol);
    begin
        if (a <> nil) then begin
            imprimirArbol(a^.HI);
            writeln('Patente: ',a^.dato.patente);
            writeln('Año de fabricación: ',a^.dato.anioFab);
            writeln('Marca: ',a^.dato.marca);
            writeln('Modelo: ',a^.dato.modelo);
            writeln('-------------');
            imprimirArbol(a^.HD);
        end;
    end;
    
    procedure imprimirArbol2(a2:arbol2);
		procedure imprimirLista(l:lista);
		begin
			while (l <> nil) do begin
					writeln('Marca: ', a2^.dato.marca);
					writeln('Patente: ', l^.dato.patente);
					writeln('Año de fabricación: ', l^.dato.anioFab);
					writeln('Modelo: ', l^.dato.modelo);
					writeln('-------------');
			 l := l^.sig;
            end;
         end;
 
    begin
        if (a2 <> nil) then  begin
			writeln ('lista de autos para la marca: ', a2^.dato.marca);
			ImprimirLista (a2^.dato.listaAutos);
            imprimirArbol2(a2^.HI);
            imprimirArbol2(a2^.HD);
    end;
end;

begin
    if (a = nil) then 
        writeln('--arbol vacío--')
    else begin
		writeln('--Arbol x autos');
        imprimirArbol(a);
    writeln('*****');
    end;
    if (a2 = nil) then 
        writeln('--arbol vacío--')
    else begin
    writeln('--Arbol x Marca--');
        imprimirArbol2(a2);
     end
end;

procedure calcularAutosXMarcaA(a:arbol);
	function totalAutosXMarca(a:arbol;nomMarca:cadena10):integer;
	begin
		if(a = nil) then
			totalAutosXMarca:=0
		else
			if(a^.dato.marca = nomMarca) then
				totalAutosXMarca:=totalAutosXMarca(a^.HI,nomMarca)+totalAutosXMarca(a^.HD,nomMarca)+1
			else
					totalAutosXMarca:=totalAutosXMarca(a^.HI,nomMarca)+totalAutosXMarca(a^.HD,nomMarca);
				
	end;
var
	totalAutos:integer;
	nomMarca:cadena10;
begin
	write('Ingrese una marca de autos: ');
	readln(nomMarca);
	totalAutos:=totalAutosXMarca(a,nomMarca);
	writeln('Total de autos para la marca ', nomMarca ,' : ',totalAutos);
	
end;

procedure calcularAutosXMarcaA2(a2:arbol2);
	procedure totalAutosXMarca(a2:arbol2;  nomMarca:cadena10; var total:integer);
    	begin
    	    if (a2<>nil) then begin
    			if (a2^.dato.marca = nomMarca) then begin// busco si el nombre de la marca para ese nodo coincide con el buscado
    				while (a2^.dato.listaAutos <> nil) do begin //voy avanzando en la lista para contar cuántos tiene
    					total := total + 1;
    					a2^.dato.listaAutos := a2^.dato.listaAutos^.sig;//avanzo en la lista
    				end;
    			end
    			else if (a2^.dato.marca > nomMarca) then //si no coincide el nodo busco en el resto del arbol
    			    totalAutosXMarca(a2^.HI, nomMarca, total)
    			    else
    			        totalAutosXMarca(a2^.HD, nomMarca, total);
    	end;
    end;
var
	totalAutos:integer;
	nomMarca:cadena10;
begin
	write('Ingrese una marca de autos: ');
	readln(nomMarca);
	totalAutosXMarca(a2,nomMarca,totalAutos);
	writeln('Total de autos para la marca ', nomMarca ,' : ',totalAutos);
	
end;

procedure generarVector(a:arbol; var v:vector);
	procedure inicializarVector(var v:vector);
	var i:rangoFab;
	begin
		for i:=2010 to dimF do 
			v[i]:= nil;
	end;
	procedure cargarRegistro(aut:auto; var aut2: autoSAnio);
	begin
		aut2.patente:=aut.patente;
        aut2.marca:=aut.marca;
        aut2.modelo:=aut.modelo;
    end;
  
   procedure agregarAdelante(var l:lista2; aut2: autoSAnio );
        var
            aux:lista2;
        begin
            new(aux);
            aux^.dato:=aut2;
            aux^.sig:=l;
            l:=aux;
        end;
  
 var
	aut2:autoSAnio;
begin
	if (a <> nil) then begin
		cargarRegistro(a^.dato, aut2);
		agregarAdelante(v[a^.dato.anioFab],aut2);
    	generarVector(a^.HI, v);
    	generarVector(a^.HD, v);
    end;
end;
procedure imprimirVectorDeListas(v:vector);
var i:rangoFab;
	begin
		for i:=2010 to dimF do begin
			if (v[i] <> nil) then
				writeln('Año de fabricación: ', i);
			while (v[i] <> nil) do begin
				writeln('Marca: ', v[i]^.dato.marca);
					writeln('Patente: ', v[i]^.dato.patente);
					writeln('Modelo: ', v[i]^.dato.modelo);
					writeln('-.-.-.-.-.-.-.-');
				v[i] :=v[i]^.sig;
			end;
        end;
end;

procedure buscarPatente(a: arbol);
	procedure buscarPat(a: arbol; pat: cadena5);
	begin
		if (a = nil) then
			writeln('La patente ', pat, ' no fue encontrada!')
			else
				if (pat = a^.dato.patente) then
					writeln('La patente ', pat, ' fue encontrada para el modelo: ', a^.dato.modelo)
				else
					if (pat < a^.dato.patente) then
						buscarPat(a^.HI, pat) 
					else
						buscarPat(a^.HD, pat); 
	end;
var
	pat: cadena5;
begin
	write('Ingrese la patente a buscar: ');
	readln(pat);
	buscarPat(a, pat);
end;

procedure buscarPatente2(a: arbol2);
	procedure buscarPat(a: arbol2; pat: cadena5);
	begin
	  if (a = nil) then
		writeln('La patente ', pat, ' no fue encontrada!')
	  else
	  begin
		while (a^.dato.listaAutos <> nil) and (pat <> a^.dato.listaAutos^.dato.patente) do begin  
		  a^.dato.listaAutos := a^.dato.listaAutos^.sig; //AVANZAR EN LA LISTA
		end;
			writeln('La patente ', pat, ' fue encontrada para el modelo: ', a^.dato.listaAutos^.dato.modelo);
			if (a^.dato.listaAutos = nil) then begin
				buscarPat(a^.HI, pat);
				buscarPat(a^.HD, pat);
		end;

	  end;
	end;
var
	pat: cadena5;
begin
	write('Ingrese la patente a buscar: ');
	readln(pat);
	buscarPat(a, pat);
end;
{---------Programa principal----------}
var
    a:arbol;
    a2:arbol2;
    v:vector;
begin
    generarArboles(a,a2);
    imprimirArboles(a,a2);
    calcularAutosXMarcaA(a);
    calcularAutosXMarcaA2(a2);
    generarVector(a,v);
    imprimirVectorDeListas(v);
    buscarPatente(a);
    buscarPatente2(a2);
end.
