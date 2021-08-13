% Aquí va el código.
jornada(dodain,Dia,9,15):-
    member(Dia,[lunes,miercoles,viernes]).
jornada(lucas,martes,10,20).
jornada(juanC,Dia,18,22):-
    member(Dia,[sabado,domingo]).
jornada(juanFdS,jueves,10,20).
jornada(juanFdS,viernes,12,20).
jornada(leoC,Dia,14,18):-
    member(Dia,[lunes,miercoles]).
jornada(martu,miercoles,23,24).
jornada(vale,Dia,HI,HF):-
    member(Persona,[dodain,juanC]),
    jornada(Persona,Dia,HI,HF).

responsable(Persona,Dia,Hora):-
    jornada(Persona,Dia,HI,HF),
    HI=<Hora,
    HF>=Hora.

foreverAlone(Persona,Dia,Hora):-
    responsable(Persona,Dia,Hora),
    not((responsable(Persona2,Dia,Hora),Persona \= Persona2)).

puedeEstar(Dia,Lista):-
    horasPosible(Hora),
    findall(Persona,responsable(Persona,Dia,Hora),Lista).


horasPosible(Horas):-
    member(Horas,[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]).

vendio(dodain,10,agosto,[golosinas(1200),cigarrillos([jockey]),golosinas(50)]).
vendio(dodain,12,agosto,[bebidas(si,8),bebidas(no,1),golosinas(10)]).
vendio(martu,12,agosto,[golosinas(1000),cigarrillos([chesterfield,colorado,parisiennes])]).
vendio(lucas,11,agosto,[golosinas(600)]).
vendio(lucas,18,agosto,[bebidas(no,2),cigarrillos([derby])]).

suertuda(Persona):-
    vendio(Persona,_,_,_),
    forall(primeraVenta(Persona,Venta),importante(Venta)).

primeraVenta(Persona,Venta):-
    vendio(Persona,_,_,[Venta|_]).

importante(golosinas(N)):-
    N>100.

importante(bebidas(si,_)).

importante(bebidas(_,N)):-
    N>5.

importante(cigarrillos(Lista)):-
    length(Lista, Numero),
    Numero>2.


    
    