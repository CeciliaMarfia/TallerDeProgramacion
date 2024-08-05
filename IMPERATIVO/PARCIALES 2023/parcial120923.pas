program pacientes;
const
	fin = 0;
	dimF=15;
type
	sub_mes=0..12;
	sub_diagnostico=1..dimF;
	
	atencion = record
		dni:integer;
		mes:sub_mes;
		diagnostico:sub_diagnostico
	end;
	
	infoAtencion = record
		dni:integer;
		totalAtenciones:integer;
	end;
	
	arbol= ^nodo;
	nodo = record
		dato:infoAtencion;
		HI:arbol;
		HD:arbol;
	end;
	
	vector = array [sub_diagnostico] of integer;
	{-- fin del type --}
	
procedure generarArbolYVec(var a:arbol;var v:vector);
	procedure leerAtencion(var a:atencion);
	begin
		a.mes:=random(13);
		writeln('Mes : ',a.mes);
		if(a.mes<> fin) then begin
			a.dni:=random(5)+1;
			writeln('DNI : ',a.dni);
			a.diagnostico:=random(15)+1;
			writeln('Diagnostico : ',a.diagnostico);
			writeln('..................');
		end;
	end;
	procedure inicializarVector(var v:vector);
	var
		i:sub_diagnostico;
	begin
		for i:=1 to dimF do
			v[i]:=0;
	end;
	procedure agregarAlArbol(var a:arbol;ate:atencion);
	begin
		if(a = nil) then begin
			new(a);
			a^.dato.dni:=ate.dni;
			a^.dato.totalAtenciones:=1; // por que 1 y no 0? porque ya tengo 1 atencion 
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
			if (ate.dni = a^.dato.dni ) then
				a^.dato.totalAtenciones:=a^.dato.totalAtenciones+1
				else
					if (ate.dni < a^.dato.dni ) then
						agregarAlArbol(a^.HI,ate)
					else
						agregarAlArbol(a^.HD,ate)
		
	end;
	
var
	ate:atencion;
begin
	a:=nil;
	leerAtencion(ate);
	inicializarVector(v);
	while(ate.mes<> fin) do begin
		v[ate.diagnostico]:=v[ate.diagnostico]+1;
		agregarAlArbol(a,ate);
		leerAtencion(ate);
	end;
end;	
procedure imprimirArbol(a:arbol);
	procedure imprimirA(a:arbol);
	begin
		if (a<>nil) then begin
		imprimirA(a^.HI);
		writeln('DNI : ',a^.dato.dni);
		writeln('Total de atenciones: ',a^.dato.totalAtenciones);
		writeln('-------------------');
		imprimirA(a^.HD);
		end;
	end;
begin
	if (a=nil) then
		writeln('ARBOL VACIO!')
	else
		imprimirA(a);
end;

procedure imprimirVector(v:vector);
var
	i:sub_diagnostico;
begin
	for i:=1 to dimF do begin
		writeln('Cod diagnostico : ',i);
		writeln('cantidad de atenciones: ',v[i]);
		writeln('. . . . . . . . . . . ');
	end;
end;
	

	procedure recorrerArbolEntreValores(a:arbol);
		procedure calcularMasAtenciones(a:arbol; inf,sup,valor:integer; var total:integer);
		begin
			if(a <> nil) then begin
				if (a^.dato.dni > inf) and (a^.dato.dni< sup) then begin
					if(a^.dato.totalAtenciones > valor) then
						total:=total+1;
						calcularMasAtenciones(a^.HD,inf,sup,valor,total);
						calcularMasAtenciones(a^.HI,inf,sup,valor,total);
				end
				else
					if (inf > a^.dato.dni ) then
						calcularMasAtenciones(a^.HD,inf,sup,valor,total)
					else if (sup < a^.dato.dni ) then
						calcularMasAtenciones(a^.HI,inf,sup,valor,total)
			end;
		end;
	var
		inf,sup, valor,total:integer;
	begin
		total:=0;
		write('Ingrese un num de DNI(limite inferior) : ');
		readln(inf);
		write('Ingrese un num de DNI(limite superior) : ');
		readln(sup);
		write('Ingrese un valor entero: ');
		readln(valor);
		if (a = nil ) then
			writeln('ARBOL VACIO!')
		else begin
			calcularMasAtenciones(a,inf,sup,valor,total);
			writeln(total, 'es la cantidad de pacientes con más de ',valor,' atenciones cuyo DNI está entre los valores ', inf, ' y ',sup);
		end;
	end;

	procedure recorridoDeVectorRecursivo(v:vector);
	procedure	recorrerVec(v:vector; i:integer;var  total:integer);
	begin
		if(i <= dimF) then begin
			if(v[i] = 0) then 
				total:=total+1;
			recorrerVec(v,i+1,total);
		end;
	end;
	var
		total:integer;
		i:integer;
	begin
		i:=1;
		total:=0;
		recorrerVec(v,i,total);
		writeln(total, 'es la cantidad de diagnosticos para los cuales la cantidad de atención fue cero.');
	end;
	{--programa principal --}
var
	a:arbol;
	v:vector;
begin
	generarArbolYVec(a,v);
	writeln('--------FIN DE LA CARGA-----------');
	imprimirVector(v);
	imprimirArbol(a);
	recorrerArbolEntreValores(a);
	recorridoDeVectorRecursivo(v);
end.
