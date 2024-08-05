program examenFM;
const
	fin = 0;
type
	dias = 0..31;
	meses=1..12;

	
	registro = record
		nroEmpleado:integer;
		dia:dias;
		mes:meses;
		horas:integer;
	end;
	
	arbol = ^nodo;
	nodo =  record
		dato:registro;
		HI:arbol;
		HD:arbol;
		end;
		
		lista = ^nodoLista;
		nodoLista = record
			dato:registro;
			sig: lista;
		end;
		
{--fin del type}
procedure generarArbol(var a:arbol);
	procedure leerRegistro(var r:registro);
	begin
		r.dia:=random(31);
		writeln('DIA: ',r.dia);
		if(r.dia <> fin) then begin
		r.mes:=random(12)+1;
		writeln('MES : ',r.mes);
		r.nroEmpleado:=random(500)+1;
		writeln('NRO EMPLEADO: ',r.nroEmpleado);
		r.horas:=random(31)+1;
		writeln('CANT HORAS: ',r.horas);
		writeln(' ------------');
		end;
	end;
	procedure insertarAlArbol(var a:arbol; reg:registro);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato:=reg;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
			if(reg.nroEmpleado <= 	a^.dato.nroEmpleado) then
				insertarAlArbol(a^.HI,reg)
			else
				insertarAlArbol(a^.HD,reg)
	end;
var
	reg:registro;
begin
	a:=nil;
	leerRegistro(reg);
	while(reg.dia <> fin) do begin
		insertarAlArbol(a,reg);
		leerRegistro(reg);
	end;
end;


procedure imprimirArbol(a:arbol);
	
	procedure imprimirA(a:arbol);
	begin
		if (a <> nil) then begin
				 imprimirA(a^.HI);
				 writeln('NRO EMPLEADO: ',a^.dato.nroEmpleado);
				 writeln('DIA: ',a^.dato.dia);
				 writeln('MES : ',a^.dato.mes);
				writeln('CANT HORAS: ',a^.dato.horas);
				writeln(' ------------');
				imprimirA(a^.HD);
		end;
	end;
	
begin
	IF(a = nil) then 
		writeln('ARBOL VACIO NEGRI')
	else
			 imprimirA(a);
end;

procedure entreRango(a:arbol; var l:lista);
	procedure imprimirLista(l:lista);
	begin
		while (l <> nil) do begin
				 writeln('NRO EMPLEADO: ',l^.dato.nroEmpleado);
				 writeln('DIA: ',l^.dato.dia);
				 writeln('MES : ',l^.dato.mes);
				writeln('CANT HORAS: ',l^.dato.horas);
				writeln(' ------------');
				l:=l^.sig;
		end;
	end;

	procedure agregarAdelante(var l:lista; reg:registro);
	var
		aux:lista;
	begin
		new(aux);
		aux^.dato:=reg;
		aux^.sig:= l;
		l:=aux;
	end;
	
	procedure generarLista(a:arbol; var l:lista; inf,sup:integer);
	begin
		if (a <> nil) then begin
			if(a^.dato.nroEmpleado >= inf) and (a^.dato.nroEmpleado <= sup) then begin
				generarLista(a^.HI,l,inf,sup);
				agregarAdelante(l,a^.dato);
				generarLista(a^.HD,l,inf,sup);
			end
			else
			if (a^.dato.nroEmpleado < inf) then
				generarLista(a^.HD,l,inf,sup)
			else
				if(a^.dato.nroEmpleado > sup)then
					generarLista(a^.HI,l,inf,sup);
		end;
	end;
var
	inf,sup:integer;
begin
	l:=nil;
	write('Ingrese el límite inferior: ');
	readln(inf);
	write('Ingrese el límite superior: ');
	readln(sup);
	if (a = nil) then
		writeln('ARBOL VACIO NEGRI')
	else begin
		generarLista(a,l,inf,sup);
		imprimirLista(l);
	end;
end;

procedure totalDeHoras (l:lista);
	function totalHoras(l:lista):integer;
	begin
		if(l = nil) then
			totalHoras:=0
		else
				totalHoras:= l^.dato.horas + totalHoras(l^.sig);
	end;
var
	total:integer;
begin
	if (l = nil) then
		writeln('Lista vacía')
	else begin
		total:= totalHoras(l);
		writeln('TOTAL DE HORAS: ',total);
	end;
end;
{--programa principal--}
var
	a:arbol; l:lista;
begin
	randomize;
	generarArbol(a);
	imprimirArbol(a);
	entreRango(a, l);
	totalDeHoras(l);
end.
