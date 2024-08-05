program documentos;
const
	fin = 0;
	
type

	documento = record
		cod:integer;
		cantPag:integer;
		dia:integer;
		mes:integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: documento;
		HI:arbol;
		HD:arbol;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: documento;
		sig:lista;
	end;
{----fin del type----}
procedure cargarArbol(var a:arbol);
	procedure leerDocumento(var doc:documento);
	begin
		with doc do begin
			cod:=random(10);
			writeln('Codigo: ',cod);
			if( cod <> fin) then begin
				cantPag:=random(100);
				writeln('Cant. Pag.: ',cantPag);
				dia:=random(31)+1;
				writeln('Dia: ',dia);
				mes:=random(12)+1;
				writeln('Mes: ',mes);
				writeln(' .................... ');
			end;
		end;
	end;
	
	procedure insertarAlArbol(var a:arbol; doc:documento);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:=doc;
			a^.HI:= nil;
			a^.HD:=nil;
	end
	else
		if(doc.cod<= a^.dato.cod) then
			insertarAlArbol(a^.HI,doc)
		else	
			insertarAlArbol(a^.HD,doc)			
	end;
var
	doc:documento;
begin
	a:=nil;
	leerDocumento(doc);
	while (doc.cod <> fin) do begin
		insertarAlArbol(a,doc);
		leerDocumento(doc);
	end;
end;

procedure imprimirArbol(a:arbol);
	procedure imprimir(a:arbol);
	begin
		if (a <> nil) then begin
			imprimir(a^.HI);
			writeln('Codigo: ',a^.dato.cod);
			writeln('Cant. Pag.: ',a^.dato.cantPag);
			writeln('Dia: ',a^.dato.dia);
			writeln('Mes: ',a^.dato.mes);
			writeln(' ----------------');
			imprimir(a^.HD);
		end;
	end;
begin
	if (a = nil) then
		writeln(' --ARBOL VACIO--')
	else
		imprimir(a);
end;

procedure imprimirLista(l:lista);
begin
	if ( l = nil ) then
		writeln(' --LISTA VACIA--')
	else begin
		while (l <> nil) do begin
		writeln('Codigo: ',l^.dato.cod);
			writeln('Cant. Pag.: ',l^.dato.cantPag);
			writeln('Dia: ',l^.dato.dia);
			writeln('Mes: ',l^.dato.mes);
			writeln(' ----------------');
		l:= l ^.sig;
		end;
	end;
end;

procedure generarLista(a:arbol; var l:lista);
    
    procedure insertarAdelante (var l:lista; d:documento);
    var nue:lista;
    begin
        new(nue);
        nue^.dato:=d;
        nue^.sig:=l;
        l:=nue;
    end;
    
    procedure crearLista (a:arbol; ini,fin:integer;var l:lista);
    begin
        if (a <> nil) then begin
            if (a^.dato.cod > ini) and (a^.dato.cod < fin) then begin
                crearLista (a^.hi,ini,fin,l);
                insertarAdelante(l,a^.dato);
                crearLista (a^.hd,ini,fin,l);
            end
            else
            if (a^.dato.cod < ini) then 
                crearLista (a^.hd,ini,fin,l)
            else
            if (a^.dato.cod > fin) then 
                crearLista (a^.hi,ini,fin,l);
        end;
    end;
var
	valor1,valor2:integer;
begin
	l:=nil;
	writeln('Ingrese el valor 1:');
	readln(valor1);
	writeln('Ingrese el valor 2:');
	readln(valor2);
	if (a = nil) then
		writeln(' --ARBOL VACIO--')
	else begin
		crearLista(a, valor1,valor2, l);
		imprimirLista(l);
	end;
end;

procedure sumaTotal(l:lista);
	function calcularSuma(l:lista):integer;
	begin
		if (l = nil) then
			calcularSuma:=0
		else
			calcularSuma:= l^.dato.cantPag+ calcularSuma(l^.sig);
	end;
var
	total:integer;
begin
	total:=calcularSuma(l);
	writeln('El total de las páginas impresas es de: ', total);
end;
{----programa principal----}
var
	a:arbol;
	l:lista;
begin
	randomize;
	cargarArbol(a);
	writeln('** FIN DE LA CARGA**');
	imprimirArbol(a);
	generarLista(a,l);
	sumaTotal(l);
end.
