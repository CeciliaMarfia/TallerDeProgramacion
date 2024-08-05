{El correo árgentino necesita procesarios envios entregados durante el mes de Agosto de 2023
De cada envio se conoce:
el código del cliente, dia, código postal y peso del paquete.
a) Implementar un módulo que lea envios, genere y retorne una estructuro adecuada para la busqueda por código postal, 
donde para cada codigo postal se almacenen juntos todos los envios códipo de cliente, día y peso del paquete)
La lectura finaliza con peso de paquete 0. Se sugiere utilizar el modulo leerEnvio ().
b) implementar un módulo que reciba la estructura generada en a y un código postal,y retorne todos los envios de
dicho código postal.
c) Realizar un modulo recursivo que reciba la estructura que retorna el inciso b) y retorne los dos códigos de cliente correspondientes al envío con mayor y menor peso. 
}

program parcialCorreo2023;
const
	fin = 0;
type
	sub_dia = 1..31;
	
	envio = record
		cliente:integer;
		codPostal:integer;
		dia:sub_dia;
		peso:real;
	end;
	
	infoEnvio = record
		cliente:integer;
		dia:sub_dia;
		peso:real;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato:infoEnvio;
		sig:lista;
	end;
	cpInfo = record
		codPostal:integer;
		l:lista;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		dato:cpInfo;
		HI:arbol;
		HD:arbol;
	end;
{----fin del type---}
procedure generarArbol(var a:arbol);
	procedure leerEnvio(var e:envio);
	begin
			e.peso:= random(2000)/ (random(10)+1);
			writeln('Peso: ',e.peso:4:2);
			if (e.peso <> fin) then begin
				e.cliente:= random(100)+1;
				writeln(' Cliente: ',e.cliente);
				e.codPostal:= random(7500)+1;
				writeln('CP:  ',e.codPostal);
				e.dia:= random(31)+1;
				writeln('Día: ',e.dia);
			end;
	end;

	procedure cargarRegistro(e:envio; var info:infoEnvio);
	begin
		info.cliente:=e.cliente;
		info.dia:=e.dia;
		info.peso:=e.peso;
	end;
	procedure agregarAlArbol(var a:arbol; e:envio; info:infoEnvio);
		procedure agregarAdelante(var l:lista;info:infoEnvio);
		var
			aux:lista;
		begin
			new(aux);
			aux^.dato:= info;
			aux^.sig:=l;
			l:=aux;
		end;
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.codPostal:= e.codPostal;
			a^.dato.l:=nil;
			agregarAdelante(a^.dato.l,info);
			a^.HI:=nil; 
			a^.HD:=nil; 
		end
		else
			if (e.codPostal = a^.dato.codPostal) then
				agregarAdelante(a^.dato.l, info)
		else
			if (e.codPostal < a^.dato.codPostal) then
				agregarAlArbol(a^.HI,e, info)
			else
				agregarAlArbol(a^.HD,e, info)
			
	end;
var
	e:envio; info:infoEnvio;
begin
	a:=nil;
	leerEnvio(e);
	while (e.peso <> fin)do begin
		cargarRegistro(e,info);
		agregarAlArbol(a,e,info);
		leerEnvio(e);
	end;
end;
		
procedure imprimirLista(l: lista);
begin
  while (l <> nil) do begin
    writeln('Cliente: ', l^.dato.cliente);
    writeln('Dia: ', l^.dato.dia);
    writeln('Peso: ', l^.dato.peso:4:2);
    l := l^.sig;
  end;
  writeln('--fin lista--');
end;
procedure imprimirA(a:arbol);
	procedure imprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			imprimirArbol(a^.HI);
			writeln('**CP:', a^.dato.codPostal);
			imprimirLista(a^.dato.l);
			writeln('---------------');
			imprimirArbol(a^.HD);
		end;
	end;
begin
	if(a = nil) then
		writeln('--arbol vacio--')
	else begin
		writeln('-------Arbol--------');
		imprimirArbol(a);
	end;
end;

procedure buscarCP(a:arbol; var l:lista);
	procedure buscarCodPostal(a:arbol;cp:integer;var l:lista);
	begin
		if (a<>nil) then
			if (a^.dato.codPostal = cp) then
						l:=a^.dato.l
			else
					if (a^.dato.codPostal  > cp) then
						buscarCodPostal(a^.HI, cp,l)
					else
						buscarCodPostal(a^.HD, cp,l)
	end;
var
	cp:integer;
begin
	l:=nil;
	writeln('ingrese el CP a buscar: ');
	readln(cp);
	if (a = nil) then
		writeln(' *ARBOL VACIO*')
	else begin
		buscarCodPostal(a, cp,l);
		imprimirLista(l);
	end;
end;

procedure maximoYMinimo(l:lista);
	procedure calcularMaxYMin(l:lista; var codMax,codMin:integer; var pesoMax,pesoMin:real);
	begin
		if(l <> nil) then begin
			if (l^.dato.peso > pesoMax ) then begin
			pesoMax := l^.dato.peso;
			codMax := l^.dato.cliente;
			end;
			if (l^.dato.peso < pesoMin ) then begin
			pesoMin := l^.dato.peso;
			codMin := l^.dato.cliente;
			end;
			calcularMaxYMin(l^.sig,codMax,codMin,pesoMax,pesoMin);
		end;
	end;
var
	codMax,codMin:integer;
	pesoMax,pesoMin:real;
begin
	pesoMax:= -1;
	pesoMin:=9999;
	if (l = nil) then
		writeln('Lista vacía')
	else begin
		calcularMaxYMin(l,codMax,codMin,pesoMax,pesoMin);
		writeln('Codigos de cliente correspondientes al envío con mayor peso: ', codMax, ' con un peso de ',pesoMax:4:2, ' kg. y menor peso: ', codMin, ' con un peso de ',pesoMin:4:2, ' kg.');
	end;
end;

{----programa principal---}
var
	a : arbol;
	l:lista;
begin
	randomize;
	generarArbol(a);
	imprimirA(a);
	buscarCP(a,l);
	maximoYMinimo(l);
end.
