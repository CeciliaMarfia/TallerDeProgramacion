{Una casa de comidas para llevar necesita el procesamiento de los pedidos de combos realizados por los clientes durante agosto de 2022. 
*De cada pedido se conoce el número del cliente, día, cantidad de combos y monto pagado.
a) Implementar un módulo que lea pedidos, genere y retorne una estructura adecuada para la búsqueda por número de cliente, 
*donde para cada número de cliente se almacenen juntos todos sus pedidos (dia, cantidad de combos y monto) que realizó. La lectura finaliza con cliente 0. Se sugiere utlizar el módulo leerRegistro ().
b) Implementar un módulo que reciba la estructura generada en a) y un número de cliente, y retorne todos los pedidos que realizó dicho cliente.
c) Realice un módulo recursivo que reciba la información retornada en el inciso b) y retorne el monto
por el cliente.}
program parcial2022;
const
	fin = 0;
type
	rangoDias = 1..31;
	
	registro = record
		numCliente: integer;
		dia: rangoDias;
		cantCombos: integer;
		monto: real;
		end;
		
	infoRegistro = record
		dia: rangoDias;
		cantCombos: integer;
		monto: real;
	end;
	
	lista = ^nodoLista;
		nodoLista = record
			dato: infoRegistro;
			sig:lista;
		end;
	
	cliente = record
		numCliente: integer;
		l:lista;
	end;
	
		
	arbol = ^nodoArbol;
	nodoArbol = record
		dato:cliente;
		HI:arbol;
		HD:arbol;
	end;
	
	// fin del type
	procedure generarArbol(var a :arbol);
		procedure leerRegistro (var r: registro);
		// Para agilizar la carga, a todos los campos dei registo se asignan valores al azar
		begin
			r.numCliente:= Random(76);
			writeln('Num Cliente: ',r.numCliente);
			if (r.numCliente <> 0)then begin
				r.dia:= Random(32);
				writeln('Dia: ',r.dia);
				r.monto:= 100.50 * Random(3000);
				writeln('Monto : $ ',r.monto:4:2);
				r.cantCombos:= 1 + Random(20);
				writeln(' Cant combos:: ',r.cantCombos);
			end;
		end;
			procedure cargarRegistro(r:registro; var info:infoRegistro);
			begin
				info.dia:=r.dia;
				info.cantCombos:=r.cantCombos;
				info.monto:=r.monto;
			end;
			procedure agregarAlArbol(var a:arbol; r:registro; info:infoRegistro);
				procedure agregarAdelante(var l:lista; info:infoRegistro);
				var
					aux:lista;
				begin
					new(aux);
					aux^.dato:=info;
					aux^.sig:=l;
					l:=aux;
				end;
				
			begin
				if(a = nil) then begin
					new(a);
					a^.dato.numCliente:= r.numCliente;
					a^.dato.l:=nil;
					agregarAdelante(a^.dato.l,info);
					a^.HI:=nil;
					a^.HD:=nil;
				end
				else
					if(r.numCliente = a^.dato.numCliente) then
						agregarAdelante(a^.dato.l,info)
					else
						if(r.numCliente < a^.dato.numCliente) then
							agregarAlArbol(a^.HI,r,info)
					else
							agregarAlArbol(a^.HD,r,info);
			end;
			
var
	r:registro;
	info:infoRegistro;
begin 
	a:=nil;
	leerRegistro(r);
	while (r.numCliente <> fin ) do begin
		cargarRegistro(r,info);
		agregarAlArbol(a,r,info);
		leerRegistro(r);
	end;
end;

	procedure imprimirLista(l:lista);
	begin
		while(l<> nil) do begin
		writeln('*Dia: ', l^.dato.dia);
		writeln('Cantidad: ', l^.dato.cantCombos);
		 writeln('Monto: ', l^.dato.monto:4:2);
			l:= l^.sig;
		end;
	end;
procedure imprimirArbol(a:arbol);
	procedure imprimirA(a:arbol);
	begin
		if (a<> nil) then begin
			imprimirA(a^.HI);
			writeln('*Nro de Cliente: ', a^.dato.numCliente);
			imprimirLista(a^.dato.l);
			writeln('------------------');
			imprimirA(a^.HD);	
		end;
	end;

begin
	if (a = nil) then
		writeln('ARBOL VACIO')
	else
		imprimirA(a);
end;

procedure buscarCliente(a:arbol; var l:lista);

	procedure juntarPedidos(a:arbol; codCli:integer; var l:lista);
		begin
			if(a <> nil) then
				if (codCli = a^.dato.numCliente) then 
					l:=  a^.dato.l
				else
					if (codCli < a^.dato.numCliente) then 
						juntarPedidos(a^.HI,codCli,l)
					else
						juntarPedidos(a^.HD,codCli,l);
		end;
var
	codCli:integer;
begin
	l:=nil;
	writeln('Ingrese el codigo de cliente a buscar:');
	readln(codCli);
	if (a = nil) then
		writeln('ARBOL VACIO')
	else begin
		juntarPedidos(a,codCli,l);
		imprimirLista(l);
	end;
end;

procedure montoPorCliente(l:lista);
	function calcularMonto(l:lista):real;
	begin
		if (l = nil) then
			calcularMonto:=0
		else
			calcularMonto := l^.dato.monto + calcularMonto(l^.sig)
	end;

var
	total:real;
begin
	total:= calcularMonto(l);
	writeln('Monto total acumulado: ',total:4:2);
end;
 // ---------PROGRAMA PRINCIPAL ----------
var
	a:arbol;
	l:lista;
begin
	generarArbol(a);
	imprimirArbol(a);
	buscarCliente(a,l);
	montoPorCliente(l);
end.
