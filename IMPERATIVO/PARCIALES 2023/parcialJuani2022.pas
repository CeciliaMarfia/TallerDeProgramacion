{Un comercio necesita el procesamiento de las compras realizadas por sus clientes durante el mes de julio de 2022. 
De cada compra se conoce código del cliente, día, cantidad de productos y monto pagado.
a) Implementar un módulo que lea compras, genere y retorne una estructura adecuada para la búsqueda por código del cliente, 
donde para cada código de cliente se almacenan juntas todas sus compras (día, cantidad de productos y monto) que realizó. La lectura finaliza con cantidad de productos 0.
 Se sugiere utilizar el módulo leerRegistro ().
b) Implementar un módulo que reciba la estructura generada en a) y un código de cliente y retorne todas las compras de dicho cliente.
c) Realizar un módulo recursivo que reciba la estructura que retorna el inciso b) y retorne el monto de la compra con mayor cantidad de productos. 

NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.}
program parcialComercio;
const 
	fin =0;
type
	rangoDia = 1..31;
	
	compra = record
		codCli:integer;
		dia:rangoDia;
		cantProd:integer;
		monto:real;
	end;
	
	infoCompra = record
		dia:rangoDia;
		cantProd:integer;
		monto:real;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato:infoCompra;
		sig:lista;
	end;
	
	
	infoCliente = record
		codCli:integer;
		l:lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato:infoCliente;
		HI:arbol;
		HD:arbol;
	end;
	
{----fin del type---}

	
procedure generarArbol(var a:arbol);
	procedure leerCompra (var compr:compra);
	begin
		with compr do begin
				cantProd:=random(10);
				writeln('Cantidad de producto: ',cantProd);
			if (cantProd <> fin) then begin
				codCli:=random(5);
				writeln('Codigo de cliente: ',codCli);
				dia:=random(31)+1;
				writeln('Dia: ',dia);
				monto:=random(500);
				writeln('Monto: $ ',monto:4:2);
				writeln('........................... ');
			end;
		end;
	end;
	
	procedure cargarRegistro(compr:compra; var info:infoCompra);
	begin
		info.dia:=compr.dia;
		info.cantProd:=compr.cantProd;
		info.monto:=compr.monto;
	end;
	
	procedure agregarAdelante(var l:lista; info:infoCompra);
	var
		aux:lista;
	begin
		new(aux);
		aux^.dato:=info;
		aux^.sig:=l;
		l:=aux;
	end;
	
	procedure agregarAlArbol(var a:Arbol;compr:compra; info:infoCompra);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.codCli:=compr.codCli;
			a^.dato.l:=nil;
			agregarAdelante(a^.dato.l,info);
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
			if (compr.codCli = a^.dato.codCli) then
				agregarAdelante(a^.dato.l,info)
			else
				if(compr.codCli < a^.dato.codCli)then
					agregarAlArbol(a^.HI,compr,info)
				else
					agregarAlArbol(a^.HD,compr,info)
	end;
	
	
var
	compr:compra;
	info:infoCompra;
begin
	a:=nil;
	leerCompra(compr);
	while (compr.cantProd <> fin) do begin
		cargarRegistro(compr,info);
		agregarAlArbol(a,compr,info);
		leerCompra(compr);
	end;
end;
procedure imprimirLista(l:lista);
		begin
			if (l = nil) then
				writeln('LISTA VACÍA!')
			else
				while (l <> nil) do begin
					writeln('Dia: ',l^.dato.dia);
					writeln('Cantidad de producto: ',l^.dato.cantProd);
					writeln('Monto: ',l^.dato.monto:4:2);
					writeln('------------- ');
					l:=l^.sig;
				end;
		end;
procedure imprimirArbol(a:arbol);
	procedure imprimirA(a:arbol);
	begin
		if (a <>nil) then begin
			imprimirA(a^.HI);
			writeln('Codigo de cliente: ',a^.dato.codCli);
			imprimirLista(a^.dato.l);
			imprimirA(a^.HD);
		end;
	end;
begin
	if (a = nil) then
		writeln('ARBOL VACIO!')
	else
		imprimirA(a);
end;

procedure generarListaDeCompras (a:arbol; var l:lista);
	procedure generarLista(a:arbol;cod:integer ;var l:lista);
	begin
		if (a<> nil) then begin
			if (a^.dato.codCli = cod) then
				l:=a^.dato.l
			else
				if ( cod < a^.dato.codCli ) then
						generarLista(a^.HI,cod,l)
				else
					if ( cod > a^.dato.codCli ) then
						generarLista(a^.HD,cod,l)
		end;
	end;
var
	cod:integer;
begin
	write('Ingrese el código de cliente para buscar:');
	readln(cod);
	l:=nil;
	if (a = nil) then
		writeln('ARBOL VACIO!')
	else begin
		generarLista(a,cod,l);
		writeln('--Compras para el cliente comn código: ',cod);
		imprimirLista(l);
	end;
end;

procedure mayorProducto(l:lista);
	procedure recorrerLista(l:lista; var montoMax:real;  var cantMax:integer);
		procedure actualizarMaximo(info:infoCompra;var montoMax:real; var cantMax:integer);
		begin
			if(info.cantProd > cantMax ) then begin
				cantMax:=info.cantProd;
				montoMax:=info.monto;
			end;
		end;
	begin
		if(l <> nil) then begin
				actualizarMaximo(l^.dato,montoMax,cantMax);
				recorrerLista(l^.sig,montoMax,cantMax);
			end;
	end;
var
	montoMax:real;
	cantMax:integer;
begin
	montoMax:=-1;
			cantMax:=-1;
	if (l= nil) then
		writeln('LISTA VACIA!')
	else begin
		recorrerLista(l,montoMax,cantMax);
		writeln('**Monto de la compra con mayor cantidad de productos: $',montoMax:4:2);
	end;
end;
{----programa principal---}
var
	a:arbol;
	l:lista;
begin
	randomize;
	generarArbol(a);
	imprimirArbol(a);
	generarListaDeCompras(a,l);
	mayorProducto(l);
end.
