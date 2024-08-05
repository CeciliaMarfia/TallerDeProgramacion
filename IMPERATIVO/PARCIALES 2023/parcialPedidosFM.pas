program parcialPedidosFM;
const
	fin = 0;
type
    cadena30 = string[30];
    cadena10 = string[10];
    
	pedido = record
		dni:integer;
		nombre:cadena30;
		fecha:cadena10;
        monto:real;
	end;
	
	xfecha = record
	    fecha:cadena10;
	    monto:real;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
	    dato:xfecha;
	    sig:lista;
	end;
	
	infoPedido = record
	    dni:integer;
	    nombre:cadena30;
	    l:lista;
	end;
	
	arbol = ^nodo;
	nodo = record
	    dato:infoPedido;
	    HI:arbol;
	    HD:arbol;
	end;
	
	{--fin del type--}
procedure generarArbol(var a:arbol);
	procedure leerPedido(var pe:pedido);
	begin
	    with pe do begin
    	    monto:=random(5);
    	    writeln('Monto $',monto:4:2);
    	    if(monto <> fin) then begin
    	        dni:=random(10);
    	        writeln('DNI: ',dni);
        	    write('Nombre:');
        	    readln(nombre);
        	    write('Fecha: ');
        	    readln(fecha);
        	    writeln('.-.-.-.-.-.-.');
    	    end;
	    end;
	end;
	procedure cargarRegistro(pe:pedido; var xf:xfecha);
	begin
	    xf.fecha:=pe.fecha;
	    xf.monto:=pe.monto;
	end;
	
	procedure agregarAdelante(var l:lista; xf:xfecha);
	var
	    nue:lista;
	begin
	    new(nue);
	    nue^.dato:=xf;
	    nue^.sig:=l;
	    l:=nue;
	end;
	
	procedure insertarAlArbol(var a:arbol; pe:pedido;xf:xfecha);
	begin
	    if(a = nil) then begin
	        new(a);
	        a^.dato.dni:=pe.dni;
	        a^.dato.nombre:=pe.nombre;
	        a^.dato.l:=nil;
	        agregarAdelante(a^.dato.l,xf);
	        a^.HI:=nil;
	        a^.HD:=nil;
	    end
	    else
	        if(pe.dni = a^.dato.dni) then
	            agregarAdelante(a^.dato.l,xf)
	        else
	            if(pe.dni< a^.dato.dni) then
	                insertarAlArbol(a^.HI,pe,xf)
	            else
	                insertarAlArbol(a^.HD,pe,xf);
	end;
var
	pe:pedido;
	xf:xfecha;
begin
	a:=nil;
	leerPedido(pe);
	while (pe.monto <> fin ) do begin
	    cargarRegistro(pe,xf);
		insertarAlArbol(a,pe,xf);
		leerPedido(pe);
	end;
end;	
procedure imprimirArbol(a:arbol);
    procedure imprimirA(a:Arbol);
        procedure imprimirLista(l:lista);
        begin
            if (l = nil) then
                writeln('LISTA VACIA!')
            else
            while (l <> nil) do begin
                writeln('fecha: ',l^.dato.fecha);
                writeln('monto: $ ',l^.dato.monto:4:2);
                writeln('...........');
            l:=l^.sig;
            end;
        end;
    begin
        if (a <> nil) then begin
            imprimirA(a^.HI);
            writeln('DNI: ',a^.dato.dni);
            writeln('Nombre: ',a^.dato.nombre);
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

procedure cantidadClientes(a:arbol);
	procedure totalXFecha(a:arbol; fec:cadena10; var cantCli:integer);
	begin
	    if (a<>nil) then begin // no termine de recorrer el arbol
				while (a^.dato.l <> nil) and (a^.dato.l^.dato.fecha <> fec) do begin // mientras no termine de recorrer la lista y la fecha no coincida
						a^.dato.l := a^.dato.l^.sig; //avanzo
				end;
				if (a^.dato.l <> nil) then //si no llegué al final de la lista
						cantCli:=cantCli+1;//sumo 1 al cliente
				totalXFecha(a^.HI, fec, cantCli);
				totalXFecha(a^.HD, fec, cantCli);
		end;
	end;
var
	cantCli:integer;
	fec:cadena30;
begin
	 write('Ingrese la fecha a buscar: ');
	 readln(fec);
	 cantCli:=0;
	if (a = nil) then
		writeln('ARBOL VACIO!')
    else begin
		totalXFecha(a, fec,cantCli);
		writeln('Total de clientes en la fecha: ',fec, ' fue de: ',cantCli);
	end;
end;
procedure totales(a:arbol);
	procedure calcularTotal(a:arbol; dni:integer;var totalAbonado:real; var totalPedidos:integer);
	begin
		 if (a<>nil) then begin 
			if(a^.dato.dni = dni) then begin
				while (a^.dato.l <> nil) do begin
					totalPedidos:=totalPedidos+1;
					totalAbonado:=totalAbonado + a^.dato.l^.dato.monto;
					a^.dato.l := a^.dato.l^.sig; 
					end;
			end
			else
			if(a^.dato.dni < dni) then
				calcularTotal(a^.HD, dni,totalAbonado,totalPedidos)
			else
				if(a^.dato.dni > dni) then
					calcularTotal(a^.HI, dni,totalAbonado,totalPedidos)
		end;
	end;
var
	totalAbonado:real;
	dni,totalPedidos:integer;
begin
	 write('Ingrese el DNI a buscar: ');
	 readln(dni);
	if (a = nil) then
		writeln('ARBOL VACIO!')
    else begin
		totalAbonado:=0;
		totalPedidos:=0;
		calcularTotal(a, dni,totalAbonado,totalPedidos);
		writeln('Total de abonado por el cliente con DNI: ',dni, ' fue de: ',totalAbonado:4:2,'  y  el total de pedidos para dicho DNI fue de: ',totalPedidos);
	end;
	
end;
	{--programa principal--}
var
	a:arbol;
begin
	generarArbol(a);
	writeln('** fin de la carga**'); 
	imprimirArbol(a);
	cantidadClientes(a);
	totales(a);
end.
