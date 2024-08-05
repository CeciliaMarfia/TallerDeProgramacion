{3. Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:

a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. La lectura finaliza con el código de producto igual a -1.
b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.
c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.}
program ejercicio3P5;
const
    fin = -1;
type
    rangoRubro = 1..10;
    producto = record
        codigo:integer;
        rubro:rangoRubro;
        stock:integer;
        precioUnitario:real;
    end;
    
    arbol = ^nodo;
    nodo = record
        dato:producto;
        HI:arbol;
        HD:arbol;
    end;
    vectorRubros = array [rangoRubro] of arbol;
  {-----programa principal-----}
  procedure generarVector(var v:vectorRubros);
	procedure leerProducto(var prod:producto);
	begin
		with(prod) do begin
			codigo:= random(5)-1;
			writeln(' Codigo: ', codigo);
			if(codigo <> fin) then begin
				rubro:= random(5)+1;
				writeln(' Rubro: ', rubro);
				stock:= random(50);
				writeln(' Stock: ', stock);
				precioUnitario:= random(10);
				writeln(' Precio unitario: ', precioUnitario:4:2);
				writeln('.............');
			end;
		end;
	end;
  procedure inicializarVector(var v:vectorRubros);
  var
	i:rangoRubro;
  begin 
	for i:=1 to 10 do
		v[i]:= nil;
  end;
  
  procedure agregarAlArbol(var a:arbol; prod:producto);
  begin
		if(a = nil) then begin
			new(a);
			a^.dato:=prod;
			a^.HI:= nil;
			a^.HD:=nil;
		end
		else
			if (prod.rubro <= a^.dato.rubro) then
				agregarAlArbol(a^.HI, prod)
			else
				agregarAlArbol(a^.HD,prod);
  end;

  var
	prod:producto;
  begin
	inicializarVector(v);
	leerProducto(prod);
	while (prod.codigo <> fin) do begin
		agregarAlArbol(v[prod.rubro] ,prod);
		leerProducto(prod);
	end;
  end;
  
  procedure imprimirVector(v:vectorRubros);
	procedure imprimirArbol(a:arbol);
	begin
		if (a <> nil) then begin
			imprimirArbol(a^.HI);
			writeln('Código ',a^.dato.codigo);
			writeln('Rubro ',a^.dato.rubro);
			writeln('Stock ',a^.dato.stock);
			writeln('Precio Unitario ',a^.dato.precioUnitario:4:2);
			writeln(' ------------------');
			imprimirArbol(a^.HD);
		end;
	end;
  var
	i:rangoRubro;
  begin
	for i:=1 to 10 do 
		if (v[i] = nil) then
			writeln('ARBOL VACIO')
		else
			imprimirArbol(v[i]);
  end;
  
  procedure buscarCodigo(v:vectorRubros);
	function encontrar(a:arbol; cod:integer):boolean;
	begin
		if(a = nil) then
			encontrar:=false
		else
			if (cod = a^.dato.codigo) then
				encontrar:=true
			else 
				if(cod < a^.dato.codigo) then
					encontrar(a^.HI,cod)
				else
					encontrar(a^.HD,cod)
	end;
	
  var
	rubroABuscar,
	cod:integer;
  begin
		writeln('Rubro a Buscar');
		readln(rubroABuscar);
		writeln('Codigo a buscar');
		readln(cod);
		if(encontrar(v[rubroABuscar], cod)) then
			writeln('Se encontro')
		else
			writeln('No se encontro');
		
  end;
  
  procedure codigosMaximos(v:vectorRubros);
	procedure maximos(a:arbol; var codMax, stockMax:integer);
	begin
		if(a^.HD = nil) then begin
			codMax:=a^.dato.codigo;
			stockMax:=a^.dato.stock;
		end
		else
			maximos(a^.HD, codMax, stockMax);
	end;
  var
	i:rangoRubro;
	codMax, stockMax:integer;
  begin
	codMax:=-1;
	stockMax:=-1;
	for i:=1 to 10 do begin
		if (v[i] = nil) then
			writeln('Arbol vacio ')
		else begin
			maximos(v[i], codMax, stockMax);
			writeln('Stock Máximo ',stockMax, 'Codigo Máximo ',codMax);
		end;
	end;
  end;
  
  procedure entreDos(v:vectorRubros);
	procedure cantProductos(a:arbol;num1, num2:integer; var total:integer);
	begin
		if(a<>nil)then begin
			if(a^.dato.codigo > num1) and (a^.dato.codigo < num2)then begin
				total:= total+1;
				cantProductos(a^.HI,num1, num2,total);
				cantProductos(a^.HD,num1, num2,total);
			end
			else
				if(a^.dato.codigo < num1)then
						cantProductos(a^.HD,num1, num2,total)
				else
					if(a^.dato.codigo > num2) then
						cantProductos(a^.HI,num1, num2,total)
		end;
	end;
	
   var
	i:rangoRubro;
	num1, num2,total:integer;
  begin
	writeln('Numero 1:');
		readln(num1);
		writeln('Número 2:');
		readln(num2);
	for i:=1 to 10 do begin
		total:=0;
		if (v[i] = nil) then begin
			writeln('Arbol vacio ');
		end
		else begin
			cantProductos(v[i],num1,num2,total);
			writeln('Cantidad de productos entre los números ', num1, ' y ', num2,' es : ',total);

		end;
	end;
  end;
    {-----programa principal-----}
var
    v:vectorRubros;
   
begin
	randomize;
	generarVector(v);
	writeln('FIN DE LA CARGA');
	imprimirVector(v);
	buscarCodigo(v);
	codigosMaximos(v);
	entreDos(v);
end.
