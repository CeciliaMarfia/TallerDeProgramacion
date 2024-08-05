{5. Realizar el punto a) del ejercicio anterior, pero sabiendo que todos los reclamos de un mismo DNI se leen de forma consecutiva (no significa que vengan ordenados los DNI).}
const
	fin = -1;
type
	cadena20 = string[20];
	
    reclamo  = record
		codigo: integer;
		dni:integer;
		anio:integer;
		tipoReclamo:integer;
    end;
    
    infoReclamo = record
		codigo:integer;
		anio:integer;
		tipoReclamo:integer;
    end;
    
    lista = ^nodoLista;
    nodoLista = record
		dato:infoReclamo;
		sig:lista;
    end;
    
    infoDNI = record
		dni:integer;
		reclamo:lista;
		cantReclamos:integer;
    end;
       
	arbol = ^nodo;
	nodo = record
	    dato: infoDNI;
	    HI:arbol;
	    HD:arbol;
	end;
