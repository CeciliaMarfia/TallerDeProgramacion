{1. El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
de las expensas de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se debe leer, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación -1.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.

}
program ejercicio1p5;
const
	dimF = 15; //300; uso 10 para probar
	fin =  -1;
type
	rango = 1..dimF;
	oficina = record
		codIdentificacion:integer;
		DNI:integer;
		valorExpensa:real;
	end;

    vector = array [rango] of oficina;  // sin orden
    {-------fin del type-----------}
procedure crearVector(var v:vector; var dimL:integer);
    procedure leerOfi (var ofi:oficina);
    begin
        with ofi do begin
            codIdentificacion := random(15)-1;//random (301)-1;
    			writeln('CODIGO DE IDENTIFICACION: ',codIdentificacion);
    			if( codIdentificacion <> fin) then begin
    				DNI:= random (500)+1;
    				writeln('DNI DEL PROPIETARIO: ',DNI);
    				valorExpensa:= random (900)+10000;
    				writeln('VALOR DE LA EXPENSA: $',valorExpensa:4:2);
    				writeln('------------');
    			end;
        end;
    end;
var
    ofi:oficina;
begin
    dimL:=0;
    leerOfi(ofi);
    while (ofi.codIdentificacion <> fin) and (dimL < dimF) do begin
        dimL:=dimL+1;
        v[dimL]:= ofi;
        leerOfi(ofi);
    end;
end;

procedure imprimirVector (v:vector; dimL:integer);
var i:integer;
begin
    for i:=1 to dimL do begin
        writeln('** Posición: ',i);
        writeln('CODIGO DE IDENTIFICACION: ',v[i].codIdentificacion);
        writeln('DNI DEL PROPIETARIO: ',v[i].DNI);
		writeln('VALOR DE LA EXPENSA: $',v[i].valorExpensa:4:2);
		writeln('..............');
    end;
end;
{--------------------------------Ordenar por Seleccion----------------------------------------}
{procedure ordenarSeleccion (var v: vector; dimL: integer);
var}
 //   i, j, min: integer; {uso min en lugar de "p" xq es mas explicativo}
  {  item: oficina;
begin
    for i := 1 to dimL-1 do begin
        min := i;} { necesito guardar la pos minima actual porque es el inicio }
       // for j := i+1 to dimL do{para buscar el elemento mínimo en cada pasada}
            //if (v[j].codIdentificacion < v[min].codIdentificacion) then {verifico si hay actualizar el min}
                //  min := j;
        { intercambia v[i] con v[min], incluso si no es necesario }
      //  item := v[min];{guardo el elemento mínimo en una variable auxiliar}
        //v[min] := v[i];{en la posición actual guardo el mínimo}
        //v[i] := item;
    {end;
end;}


{--------------------------------Ordenar por Inserción----------------------------------------}
procedure ordenInsercion(var v: vector; dimL: integer);
var 
	i, j: integer;
	actual:oficina;
begin

	for i:= 2 to dimL do begin
   		actual:=v[i];
   		j:= i-1;
   		while (j > 0) and (v[j].codIdentificacion > actual.codIdentificacion) do begin
     			v[j+1]:=v[j];
     			j := j-1;
     		end;
		v[j+1] := actual;
	end;
end;

procedure busqueda(v:vector; dimL:integer);
Procedure busquedaDicotomica(var v: Vector; var pos: Integer; dimL: Integer; numABuscar: Integer; var DNI:integer);
Var
  pri, ult, medio: Integer;
Begin
  pos := 0;
  pri := 1;
  ult := dimL;
  medio := (pri + ult) div 2;
  
  While (pri <= ult) and (numABuscar <> v[medio].codIdentificacion) do begin
    If (numABuscar < v[medio].codIdentificacion) then
      ult := medio - 1
    else
      pri := medio + 1;
      
    medio := (pri + ult) div 2;
  end;
  
  If (pri <= ult) then begin
    pos := medio;
    DNI:=v[medio].DNI;
  end
  else
    pos := 0;
End;

var
    DNI,pos,num:integer;
begin
    write('Ingrese el número de oficina a buscar:');
    readln(num);
    busquedaDicotomica(v,pos,dimL, num,DNI);
    if (pos = 0) then
        write('La oficina ', num, ' no fue encontrada!')
    else
        write('La oficina ', num, ' fue encontrada! para el propietario con DNI: ',DNI);
    writeln();
end;
procedure calcularMontoTotalExpensas(v:vector;dimL:integer);
    function totalExpensas(v:vector;dimL:integer): real;
    var
        i:integer;
    begin
        i:=dimL;
        if (dimL = 0) then
            totalExpensas:=0
        else
            totalExpensas:=totalExpensas(v,dimL-1)+v[dimL].valorExpensa;
    end;
var 
    total:real;
begin
    total:=totalExpensas(v,dimL);
    if(total = 0) then
        writeln('Monto total: $', total:2:2)
    else
        writeln('Monto total: $', total:4:2);
end;
    {-------programa principal-----------}
var
    v:vector;
    dimL:integer;
begin
    randomize;
    crearVector(v,dimL);
    imprimirVector(v,dimL);
    //ordenarSeleccion(v,dimL);
    ordenInsercion(v,dimL);
    writeln('-----AHORA ORDENADO:');
    imprimirVector(v,dimL);
    busqueda(v,dimL);
    calcularMontoTotalExpensas(v,dimL);
end.

