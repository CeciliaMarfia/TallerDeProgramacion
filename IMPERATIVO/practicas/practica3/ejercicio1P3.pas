{Escribir un programa que:
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que :
i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.
ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo
recursivo que retorne dicho socio.
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que
retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso
vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
xi. Informe los números de socio en orden creciente.
x. Informe los números de socio pares en orden decreciente.}
program ejercicioPractica;
const
	fin = 0;
type
	cadena10 = String[10];

	socio = record
	    nroSocio:integer;
	    nombre:cadena10;
	    edad:integer;
	end;

    arbol = ^nodoArbol;  /// ordenado por número de socio.
    
    nodoArbol = record
        dato: socio;
        HI: arbol;
        HD: arbol;
    end;

{---------------Fin del type----------------}
procedure cargarArbol(var a: arbol);
    procedure leerSocio (var soc: socio);
    begin
    	with soc do begin
    		nroSocio := random (5);
    		writeln('Nro de socio: ',nroSocio);
    		if( nroSocio <> fin) then begin
    			write('Nombre: ');
    			readln(nombre);
    			edad:= random (50)+10;
    			writeln('Edad: ',edad);
    		end;
    	end;
    end;

    procedure agregar(var a: arbol;soc:socio);
    begin
        if (a = nil) then begin //caso base, el arbol está vacío 
            new(a); // genero un nuevo nodoArbol
            a^.dato:= soc; // guardo el socio enelnuevo nodo
            a^.HI:= nil;  //pongo en nil los hijos del nodo 
            a^.HD:= nil;
        end
        else
        if (soc.nroSocio <= a^.dato.nroSocio) then //si el dato que ingresaes menor al apuntado por el nodo
            agregar(a^.HI, soc)
        else
            agregar(a^.HD, soc);
    end;

var
    soc:socio;
begin
    a:=nil;// inicializo el arbol
    leerSocio(soc);
    while(soc.nroSocio <> fin ) do begin
        agregar(a,soc);
        leerSocio(soc);
    end;
end;

procedure imprimirEnOrden(a:arbol);
begin
    if (a <> nil) then begin
        imprimirEnOrden(a^.HI);
        writeln('Nro de socio: ',a^.dato.nroSocio);
    	writeln('Nombre: ',a^.dato.nombre);
    	writeln('Edad: ',a^.dato.edad);
    	writeln('_____');
    	imprimirEnOrden(a^.HD);
    end;
end;
 function nroSocioMasGrande(a:arbol):integer;
 begin
	if (a = nil) then
		nroSocioMasGrande:=-1
	else
    if(a^.HD = nil) then
        nroSocioMasGrande:= a^.dato.edad
    else
		nroSocioMasGrande:= nroSocioMasGrande(a^.HD );
 end;
 
procedure socioConNroMasChico(a: arbol);
	function nroSocioMinimo (a:arbol): arbol; 
    begin
      if (a = nil) then //si el arbol está vacío
        nroSocioMinimo:= nil
      else 
        if (a^.HI = nil) then  //busco por la izquierda hasta llegar a un hijo izquierdo en nil
            nroSocioMinimo:= a //guardo el nodo que almacena el minimo
      else nroSocioMinimo:= nroSocioMinimo (a^.HI); //sigo buscando
    end;
 
    procedure imprimirNodo(a:arbol);
    begin
        if(a = nil) then
    	    writeln('--árbol vacío')
    	else begin
            writeln('Nro de socio: ',a^.dato.nroSocio);
        	writeln('Nombre: ',a^.dato.nombre);
        	writeln('Edad: ',a^.dato.edad);
        	writeln('_____');
        end;
    end;
var 
	minSocio: arbol;
begin
	writeln ('----- Informar Datos Socio Numero Mas Chico -----');
	minSocio:= nroSocioMinimo(a);
	imprimirNodo(minSocio);
end;
 
 procedure socioMayorEdad(a:arbol);
	   procedure actualizarMaximo(var maxValor,maxElem : integer; nuevoValor, nuevoElem : integer);
	begin
	  if (nuevoValor >= maxValor) then
	  begin
		maxValor := nuevoValor;
		maxElem := nuevoElem;
	  end;
	end;
	procedure NumeroMasEdad (a: arbol; var maxEdad: integer; var maxNumSocio: integer);
	begin
	   if (a <> nil) then  begin //si el arbol no está vacío
		  actualizarMaximo(maxEdad,maxNumSocio,a^.dato.edad,a^.dato.nroSocio); //actualizo el máximo
		  numeroMasEdad(a^.hi, maxEdad,maxNumSocio); //recorro por el hijo izquiero y voy actyualizando
		  numeroMasEdad(a^.hd, maxEdad,maxNumSocio); //recorro por el hijo derecho y voy actualizando
	   end; 
	end;
var
	maxEdad, maxNumSocio:integer;
 begin
	maxEdad:=-1;
	NumeroMasEdad (a, maxEdad, maxNumSocio);
	if (maxEdad = -1) then
		writeln('-- El árbol está vacío --')
	else
		writeln ('Numero de socio con mas edad: ', maxNumSocio);
 end;
 procedure aumentarEdad(var a:arbol);
 begin
	if (a <>nil) then begin
		aumentarEdad(a^.HI);
		a^.dato.edad:=a^.dato.edad+1;  
		aumentarEdad(a^.HD);
	end;
 end;
 procedure buscarNroSocio(a:arbol);
	function encontroElnumero (a:arbol; x:integer): boolean; 
    begin
      if (a = nil) then
        encontroElnumero:= false
      else 
        if (a^.dato.nroSocio = x) then 
        encontroElnumero:= true
    
      else 
        if (x > a^.dato.nroSocio) then 
            encontroElnumero:= encontroElnumero(a^.HD, x)
        else encontroElnumero:= encontroElnumero(a^.HI, x)
    
    end;

 var
	num:integer;
 begin
		write(' Ingrese el Nro. de socio a buscar:');
		readln(num);
		if(encontroElnumero(a,num)) then
			writeln(num,' fue encontrado!!')
		else
			writeln(num,' no fue encontrado!!')
end;

 procedure buscarNombreDeSocio(a:arbol);
 
    Function encontroElNombre (a:arbol; x:cadena10): boolean; 
    begin
      if (a = nil) then 
        encontroElNombre:= false
      else 
        if (a^.dato.nombre = x) then 
            encontroElNombre:= true
    
      else
		encontroElNombre:= encontroElNombre(a^.HD, x) or encontroElNombre(a^.HI, x); //ahi se chequean ambas
    end;

 var
	nom:cadena10;
 begin
		write(' Ingrese el nombre. del socio a buscar (por favor en mayúsculas):');
		readln(nom);
		if(encontroElNombre(a,nom)) then
			writeln(nom,' fue encontrado!!')
		else
			writeln(nom,' no fue encontrado!!')
end;
procedure cantidadDeSocios(a:arbol; var cant:integer);
begin
	if (a <> nil) then begin
		cantidadDeSocios(a^.HI,cant);
		cantidadDeSocios(a^.HD,cant);
		cant:=cant+1;
	end;
end;

procedure calcularPromedio(a:arbol; var prom:integer);
	procedure sumarEdades(a:arbol; var total:integer); //ver
	begin
		if (a <> nil) then begin
			total:=total+a^.dato.edad;
			sumarEdades(a^.HI,total);
			sumarEdades(a^.HD,total);
		end;
	end;
var
	total, cant: integer;
begin
	total:= 0;
	cant:=0;
	cantidadDeSocios(a,cant);
	sumarEdades(a,total);
	prom:= total div cant;
end;

// imprime los elementos de un arbol devolviendo primero los hijos y después el padre.
procedure sociosOrdenCreciente (a: arbol);
begin
    if (a <> nil) then begin
        sociosOrdenCreciente (a^.HI);
        write (a^.dato.nroSocio, ' - ');
        sociosOrdenCreciente (a^.HD);
    end;
end;

procedure sociosParesDecreciente(a: arbol);
begin
    if (a <> nil) then begin
        sociosParesDecreciente(a^.HD);
        // Verificar si el número es par antes de imprimirlo
        if (a^.dato.nroSocio mod 2 = 0) then
            write(a^.dato.nroSocio, ' - ');
        sociosParesDecreciente(a^.HI);
    end;
end;


{---------------Programa Principal----------------}
var
    a:arbol;
    cant, prom:integer;
begin
	randomize;
	cant:=0;
	cargarArbol(a);
	writeln(' == FIN DE CARGA ==');
	if(a = nil) then
	    writeln('--árbol vacío')
	else
        imprimirEnOrden(a);
	writeln('Número de socio más grande:',nroSocioMasGrande(a));
	socioConNroMasChico(a);
	socioMayorEdad(a);
	aumentarEdad(a);
	writeln(' == con edad incrementada ==');
	if(a = nil) then
	    writeln('--árbol vacío')
	else
        imprimirEnOrden(a);
     buscarNroSocio(a);
     buscarNombreDeSocio(a);
	 cantidadDeSocios(a,cant);
	 writeln('Cantidad de socios: ',cant);
	 calcularPromedio(a,prom);
	  writeln('Promedio de edad de socios: ',prom);
	  writeln(' == Nro de socios en orden creciente ==');
	 sociosOrdenCreciente(a);
	 writeln();
	 writeln(' == Nro de socios pares en orden decreciente ==');
	 sociosParesDecreciente(a);
end.

