{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022. De cada película se conoce: código de película,
código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. 
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, en una estructura de datos adecuada. 
La lectura finaliza cuando se lee el código de la película -1. 
b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría. 
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película con menor puntaje.
}
program ejercicio2P1;
const

	dimF = 8;
	fin =  -1;

type
	rangoGenero = 1..dimF;
	
	pelicula = record
		codPelicula:integer;
		codGenero: rangoGenero;
		puntajeProm:real;
	end;

 lista = ^nodo;  // ordenada por orden en que fueron leídas

    nodo = record          
    	dato: pelicula;
    	sig: lista;
    end;

    vectorDeListas = array [rangoGenero] of lista;  // ordenada por genero
    vectorMayorPuntaje = array [rangoGenero] of pelicula;

{-----------------------------Fin del type-----------------------------}
procedure cargarVectorDeLista(var l:lista; var vec: vectorDeListas);
	
	{---------------cargo la lista c agr. atras c punt al ult nodo de la lista----------------}
	procedure agregarAtras (var pri, ult: lista; peli: pelicula);
	var
		aux: lista; 
	begin
		writeln(peli.codPelicula);
		writeln(peli.codGenero);
		new(aux);
		aux^.dato := peli;
		aux^.sig := nil;
		if (pri = nil) then // si esta vacia
			pri := aux
		else // si no esta vacia
			ult^.sig := aux;
		ult := aux;
	end;
	{---------------leo la pelicula----------------}
	procedure leerPelicula (var peli: pelicula);
	begin
		with peli do begin
			codPelicula := random(15)-1;
			writeln('CODIGO DE PELICULA: ',codPelicula);
			if( codPelicula <> fin) then begin
				codGenero:=random(8)+1;
				writeln('CODIGO DE GENERO: ',codGenero);
				puntajeProm:= random(10)+1;
				writeln('PUNTAJE PROMEDIO: ',puntajeProm:2:2);
				writeln('------------------------ ');
			end;
		end;
	end;
	
	{----------- Inicializar vector de listas -----------}
	procedure inicializarVectorDeListas(var vec:vectorDeListas);
	var
		i:rangoGenero;
	begin
		for i:=1 to dimF do
			vec[i]:=nil;
	end;
var 
	ult:lista;
	peli:pelicula;
begin
	ult:=nil;
	inicializarVectorDeListas(vec);
	leerPelicula(peli);
	while(peli.codPelicula<> fin) do begin
		agregarAtras(vec[peli.codGenero],ult,peli);
		leerPelicula(peli);
	end;
	
end;


{----------- Cargar vector de mayor puntaje -----------}

procedure cargarVectorDeMayorPuntaje(vec: vectorDeListas; var vec2: vectorMayorPuntaje);
var
	i:rangoGenero;
	l:lista;
	max:real;
	maxCod: integer;
begin
	for i:=1 to dimF do begin//AYUDAAA
		max:=-1;
		l:= vec[i];
		while l <> nil do begin //recordar que CADA POSICION ES UNA LISTA, entonces es como si tuviera l<>nil
		  if (l^.dato.puntajeProm > max) then begin
			max:= l^.dato.puntajeProm; // Actualizar película con mayor puntaje
			maxCod:=l^.dato.codPelicula;
		  end;
		  l := l^.sig; //avanzo al siguiente
		end;
		vec2[i].puntajeProm:= max;
		vec2[i].codPelicula:= maxCod;
		vec2[i].codGenero:= i;
	end;
end;
{----------- imprimir vector de listas -----------}
procedure  imprimirVectorDeListas(vec:vectorDeListas);
	procedure imprimirListas(l:lista);
	begin
		while (l <> nil) do begin
			writeln('CODIGO DE GENERO: ',l^.dato.codGenero);
			writeln('CODIGO DE PELICULA: ',l^.dato.codPelicula);
			writeln('PUNTAJE PROMEDIO: ',l^.dato.puntajeProm:2:2);
			writeln('------------------------ ');
			l:= l^.sig;
		end;
	end;
var
	i:rangoGenero;
begin
	for i:= 1 to dimF do begin
		if vec[i]=nil then
			writeln('--No hay Peliculas en esta categoria--')
		else
			imprimirListas(vec[i]);
	end;
end;

{--------------------------------Ordenar por Inserción----------------------------------------}
{procedure ordenarSeleccion (var v: vectorMayorPuntaje);
var}
 //   i, j, min: integer; {uso min en lugar de "p" xq es mas explicativo}
  {  item: pelicula;
begin
    for i := 1 to dimF-1 do begin
        min := i;} { necesito guardar la pos minima actual porque es el inicio }
       // for j := i+1 to dimL do{para buscar el elemento mínimo en cada pasada}
            //if (v[j].puntajeProm < v[min].puntajeProm) then {verifico si hay actualizar el min}
                //  min := j;
        { intercambia v[i] con v[min], incluso si no es necesario }
      //  item := v[min];{guardo el elemento mínimo en una variable auxiliar}
        //v[min] := v[i];{en la posición actual guardo el mínimo}
        //v[i] := item;
    {end;
end;}


{--------------------------------Ordenar por Inserción----------------------------------------}
procedure ordenInsercion(var v: vectorMayorPuntaje);
var 
	i, j: integer;
	actual:pelicula;
begin

	for i:= 2 to dimF do begin
   		actual:=v[i];
   		j:= i-1;
   		while (j > 0) and (v[j].puntajeProm > actual.puntajeProm) do begin
     			v[j+1]:=v[j];
     			j := j-1;
     		end;
		v[j+1] := actual;
	end;
end;

{----------- imprimir vector con mayor puntaje x genero -----------}
procedure  imprimirVectorDePuntajes(vec2: vectorMayorPuntaje);
var
	i:rangoGenero;
begin
	for i:=1 to dimF do begin
		if vec2[i].puntajeProm= -1 then
			writeln('--No hay Peliculas en esta categoria--')
		else begin
			writeln('------------------------ ');
			writeln('CODIGO DE GENERO: ',vec2[i].codGenero);
			writeln('CODIGO DE PELICULA: ',vec2[i].codPelicula);
			writeln('PUNTAJE PROMEDIO: ',vec2[i].puntajeProm:2:2);
		end;
		
	end;
end;
{----------- calcular mayor y menor puntaje -----------}
procedure calcularpuntajesMaxyMin(vec2:vectorMayorPuntaje);
	procedure informarMaxYMin(codMax,codMin:integer);
	begin
		writeln('*********************************************************');
		writeln('El código de la película con mayor puntaje fue ',codMax);
		writeln('El código de la película con menor puntaje fue ',codMin);
	end;
	
var
  i: rangoGenero;
  maxPuntaje,minPuntaje:real;
  codMax,codMin:integer;
  
begin
  maxPuntaje := -1;
  minPuntaje := 999;
  for i := 1 to dimF do begin
	if vec2[i].puntajeProm > maxPuntaje then begin
		maxPuntaje := vec2[i].puntajeProm;
        codMax := vec2[i].codPelicula;
    end;
    if vec2[i].puntajeProm < minPuntaje then begin
		minPuntaje := vec2[i].puntajeProm;
        codMin := vec2[i].codPelicula;
	end;
  end;
	informarMaxYMin(codMax,codMin);
	
end;
{---------------Programa Principal----------------}
var
	l:lista;
	vec:vectorDeListas;
	vec2:VectorMayorPuntaje;
begin
	randomize;
	cargarVectorDeLista(l, vec);
	imprimirVectorDeListas(vec);
	cargarVectorDeMayorPuntaje(vec,vec2);
	calcularpuntajesMaxyMin(vec2);
	writeln('.........................');
	//ordenarSeleccion(vec2); 
	ordenInsercion(vec2);
	writeln('.:::::::::::AHORA ORDENADO!!!:::::::::::::::.');
	imprimirVectorDePuntajes(vec2);
	
end.
