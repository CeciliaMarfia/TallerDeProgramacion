{Se lee información de las compras realizadas por los clientes a un supermercado en el año 2022. De cada compra se lee el código del cliente, número de mes y monto gastado.
La lectura finaliza cuando se lee el cliente con código 0.
a)Realizar un módulo que lea la información de las compras y retorne  una estructura de datos eficiente para la bíusqueda por código de cliente . Para cada cliente, esta estructura debe
acumular el monto total gastado para cada mes del año 2022. sE SUGIERE UTILIZAR EL MÓDULO LEERCOMPRA()
b) Realizar un módulo que reciba la estructura generada en a y un cliente, y retorne el mes con mayor gasto para dicho cliente.
c) Realizar un módulo que reciba la estructura generada en a y un número de mes, y retorne la cantidad de clientes que no gastaron nada en dicho mes.
NOTA: Implementar el programa principal que invoque a los incisos a,b, y c.
}
program parcial2023;
const
	fin = 0;
type
	sub_mes= 1..12;
	
	compra = record
		monto:real;
		cliente:integer;
		mes:sub_mes;
	end;
	
	vector = array [sub_mes] of real;
	
	cliente = record
		cod:integer;
		vec:vector;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: cliente;
		HI: arbol;
		HD: arbol;
	end;
	
	{----fin del type-------}
procedure generarArbol(var a:arbol);
	procedure inicializarVector(var v:vector);
	var 
		i:sub_mes; 
	begin
		for i:=1 to 12 do 
			v[i]:= 0;
	end;
	
		procedure leerCompra(var c:compra);
		begin
			c.cliente:= random(100);
			writeln('codigo: ',c.cliente); 
			if(c.cliente <> 0) then begin
				c.monto:= random(20000) / (random(10)+1);
				writeln('monto $: ',c.monto:5:1); 
				c.mes:= random(12)+1;
				writeln('mes: ',c.mes); 
			end;
		end;
		procedure agregarAlArbol(var a:arbol;  c:compra);
    begin
        if (a = nil) then begin
            new(a);
            inicializarVector(a^.dato.vec);
            a^.dato.cod:= c.cliente;
            a^.dato.vec[c.mes]:= a^.dato.vec[c.mes] + c.monto;
            a^.HI:= nil;
            a^.HD:= nil;
        end
        
        else
            if (c.cliente = a^.dato.cod) then
				a^.dato.vec[c.mes]:= a^.dato.vec[c.mes] + c.monto
            else if (c.cliente < a^.dato.cod) then
                agregarAlArbol(a^.HI, c)
            else
                agregarAlArbol(a^.HD, c);
    end;
	
var
	c:compra;
begin
	a:=nil;
	leerCompra(c);
	while(c.cliente <> fin) do begin
		agregarAlArbol(a,c);
		leerCompra(c);
	end;
end;
procedure imprimir(a:arbol);
procedure imprimirArbol(a:arbol);
var
	i:sub_mes;
begin
	if (a <> nil) then begin
			writeln('Código: ',a^.dato.cod);
			for i:=1 to 12 do begin
				writeln('mes : ',i);
				writeln('monto :$ ',a^.dato.vec[i]:5:2);
				writeln('--------------')
			end;
			writeln('************');
			imprimirArbol(a^.HI);
			imprimirArbol(a^.HD);
	end;
end;
begin
	if (a=nil) then
			writeln('--ÁRBOL VACÍO--')
	else
		imprimirArbol(a);
end;

procedure calcularMayorGasto(a:arbol);
	function mayorGasto(a:arbol; codigo:integer):integer;
		function buscarMax(vec:vector):integer;
		var
			i,mesMax:integer; max:real;
		begin
			max:=-1;
			for i:=1 to 12 do begin
				if(vec[i] > max) then begin
					max:=vec[i];
					mesMax:=i;
				end;
			buscarMax:=mesMax;
		end;
		end;
	begin
		if (a = nil) then
			mayorGasto:=-1
		else
			if (a^.dato.cod = codigo) then
				mayorGasto:=buscarMax(a^.dato.vec)
			else
				if (a^.dato.cod > codigo) then
					mayorGasto:=mayorGasto(a^.HI,codigo)
				else
					mayorGasto:=mayorGasto(a^.HD,codigo);	
	end;
var
	codigo,mes:integer;
begin
	write('ingrese un código de cliente para buscar:');
	readln(codigo);
	mes:=mayorGasto(a,codigo);
	if (mes <> -1) then
		writeln('El mes máximo para el código ', codigo, ' fue :',mes)
	else
		writeln('El código ', codigo, ' no fue encontrado ');
end;

procedure calcularClientesSinGasto(a:arbol);
	function calcularCant(a:arbol;mes:integer):integer;
	begin
		if (a = nil) then
			calcularCant:=0
		else
			if (a^.dato.vec[mes] = 0) then
				calcularCant:=calcularCant(a^.HI,mes) + calcularCant(a^.HD,mes) +1
			else
				calcularCant:=calcularCant(a^.HI,mes) + calcularCant(a^.HD,mes);
	end;

var
	mes,cantidad:integer;
begin
	write('ingrese un mes  para buscar:');
	readln(mes);
	cantidad:=calcularCant(a,mes);
	if (cantidad <> 0 ) then
		writeln('Cantidad de clientes sin gastos en el mes ', mes, ' fue :',cantidad)
	else
		writeln('El cliente en el mes ', mes, ' se deliro la plata ');
end;
{------programa principal------}
var
	a:arbol;
begin
	generararbol(a);
	imprimir(a);
	calcularMayorGasto(a);
	calcularClientesSinGasto(a);
end.
