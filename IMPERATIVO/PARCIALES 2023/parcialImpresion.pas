program parcial2022;
const
	fin = 0;
	dimF = 20;
type
	cadena30 = string[30];
	impresion = record	
		nombreDoc:cadena30;
		pags:integer;
		tamanio:integer;
		nomUsuario:cadena30;
	end;
	
	infoUsuario = record
			nomUsuario:cadena30;
			cantDocu:integer;
			totalPag:integer;
			nombreDoc:cadena30;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		dato:infoUsuario;
		HI: arbol;
		HD:arbol;
	end;
	
	documento = record
		nombreDoc:cadena30;
		nomUsuario:cadena30;
	end;
	vector = array[1..dimF] of documento;
	
{----fin del type------}
procedure 	generarArbol(var a:arbol);
	procedure leerImpresion(var impr:impresion);
	begin
		with impr do begin
			tamanio :=random(3);
			writeln('Tamaño: ',tamanio);
			if (tamanio <> fin) then begin
				pags :=random(100);
				writeln('Pags: ',pags);
				writeln('Nombre: ');
				readln(nombreDoc);
				writeln('Nombre de usuario: ');
				readln(nomUsuario);
				writeln('..................');
			end;
		end;
	end;
	
	procedure insertarAlArbol(var a:arbol; impr:impresion ;info:infoUsuario);
	begin
		if( a = nil) then begin
			new(a);
			a^.dato.nomUsuario:= impr.nomUsuario;
			a^.dato.cantDocu:=1;
			a^.dato.totalPag:= impr.pags;
			a^.dato.nombreDoc:= impr.nombreDoc;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
			if (impr.nomUsuario =  a^.dato.nomUsuario) then begin
				a^.dato.cantDocu:=a^.dato.cantDocu+1;
				a^.dato.totalPag:= a^.dato.totalPag+impr.pags;
				a^.dato.nombreDoc:= impr.nombreDoc; //para guardarme el último y pisarlo;
			end
			else
			if (impr. nomUsuario < a^.dato.nomUsuario) then
				insertarAlArbol(a^.HI,impr, info)
			else
					insertarAlArbol(a^.HD,impr, info)
	end;
	
var
	impr:impresion; info:infoUsuario;
begin
	a:=nil;
	leerImpresion(impr);
	while(	impr.tamanio <> fin ) do begin
			insertarAlArbol(a, impr, info);
			leerImpresion(impr);
	end;
end;

procedure imprimirArbol(a:arbol);
	procedure imprimir(a:arbol);
	begin
		if (a<> nil) then begin
			imprimir(a^.HI);
			writeln('Usuario: ', a^.dato.nomUsuario);
			writeln('Nombre Doc: ', a^.dato.nombreDoc);
			writeln('Cant. Docs.: ', a^.dato.cantDocu);
			writeln('Cant Paginas: ', a^.dato.totalPag);
			writeln('---------------');
			imprimir(a^.HD);
		end;
	end;
begin
	if (a = nil) then
		writeln('ARBOL VACÍO')
	else
		imprimir(a);
end;

procedure masDocs(a:arbol);
	procedure imprimirMaximo(usu:infoUsuario);
		begin
			writeln('Registro Max: ');
			writeln('Usuario: ', usu.nomUsuario);
			writeln('Nombre Doc: ', usu.nombreDoc);
			writeln('Cant. Docs.: ', usu.cantDocu);
			writeln('Cant Paginas: ', usu.totalPag);
		end;
	procedure buscarMax(a:arbol; var usuMax:infoUsuario; var maxDoc:integer);
		procedure actualizarMaximo(info:infoUsuario; var usuMax:infoUsuario; var  maxDoc:integer);
		begin
			if(info.cantDocu > maxDoc) then begin
				maxDoc:=info.cantDocu;
				usuMax:=info;
			end;
		end;
	begin
		if(a <> nil) then begin
			actualizarMaximo(a^.dato, usuMax, maxDoc);
			buscarMax(a^.HI,usuMax, maxDoc);
			buscarMax(a^.HD,usuMax, maxDoc);
		end
	end;
var
	usuMax:infoUsuario;
	maxDoc:integer;
begin
	maxDoc:=-1;
	if(a = nil) then
		writeln('ARBOL VACÍO')
	else begin
		buscarMax(a, usuMax, maxDoc);
		imprimirMaximo(usuMax);
	end;
	
end;

procedure recorridoAcotado(a:arbol; var v:vector; var dimL:integer);
	procedure buscar(a:arbol; inf,sup:cadena30; var doc:documento; var v:vector; var dimL:integer);
	begin
		if (a <> nil) then begin
			if(a^.dato.nomUsuario>inf) and (a^.dato.nomUsuario<sup) then begin
				buscar(a^.HI,inf,sup,doc,v,dimL);	
				dimL:=dimL+1;
				doc. nomUsuario:= a^.dato.nomUsuario;
				doc. nombreDoc:= a^.dato.nombreDoc;
				v[dimL]:= doc;
				buscar(a^.HD,inf,sup,doc,v,dimL);	
		end//si no estoy en rango sigo buscando
		else
			begin
				buscar(a^.HI,inf,sup,doc,v,dimL);	
				buscar(a^.HD,inf,sup,doc,v,dimL);	
			end;
		end;
	end;
var
	inf,sup:cadena30;
	doc:documento;
begin
	dimL:=0;
	writeln('Ingrese el valor 1:');
	readln(inf);
	writeln('Ingrese el valor 2:');
	readln(sup);
	if (a = nil) then
		writeln('Arbol vacío')
	else
		buscar(a,inf,sup,doc,v,dimL);		
end;

procedure imprimirVector(v:vector; dimL:integer);
var
	i:integer;
begin
	for i:=1 to dimL do begin
		writeln('Usuario: ', v[i].nomUsuario);
		writeln('Nombre Doc: ', v[i].nombreDoc);
		writeln('---------------');
	end;
end;
{----programa principal------}
var
	a:arbol;
	v:vector;
	dimL:integer;
begin
	generarArbol(a);
	imprimirArbol(a);
	masDocs(a);
	recorridoAcotado(a,v, dimL);
	imprimirVector(v,dimL);
end.
