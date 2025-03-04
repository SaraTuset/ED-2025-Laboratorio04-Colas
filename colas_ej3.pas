program colas_ej3;

uses
    sysutils,
    uColaInteger,
    uPilaInteger;

function bool_to_str(b: boolean): string;
begin
    if b then
        bool_to_str := 'bien.'
    else
        bool_to_str := 'mal.';
end;


{ 
    Ejercicio 3: Mostrar el contenido de una cola en orden inverso

    Desarrollar un subprograma que reciba una cola y muestre su contenido en orden inverso.

    Entradas: cola de enteros

    Salida: ninguna

    Condiciónes: 
        - La cola debe mantener su contenido y orden original
        - Complejidad de tiempo esperada: O(n)
        - Complejidad de espacio auxiliar esperada: 
            - O(1): ¡Increíble! No se necesita espacio adicional para resolver este problema.
            - O(n):  Muy bien, aunque se puede mejorar.
            - Superior a O(n): ¡Vaya! ¿No crees que se puede hacer mejor?

    Ejemplos: 
        - (cola: [1, 2, 3, 4, 5]) => 5 4 3 2 1
}
procedure mostrar_inverso_pila(c: tCola);
var
    p: tPilaEnteros;
    aux: tCola;
begin
    uColaInteger.copy(c, aux);
    uPilaInteger.initialize(p);   //Si la inicializo no va.
    while not uColaInteger.empty_queue(aux) do
    begin
      push(p, uColaInteger.first(aux));
      uColaInteger.dequeue(aux);
    end;

    Write('[');

    while not uPilaInteger.isEmpty(p) do
    begin
       Write(IntToStr(peek(p)));
       pop(p);
       if not uPilaInteger.isEmpty(p) then
           Write(', ');
    end;
    WriteLn(']');

end;



var
    c: tCola;


begin
    initialize_queue(c);

    enqueue(c, 1);
    enqueue(c, 2);
    enqueue(c, 3);
    enqueue(c, 4);
    enqueue(c, 5);

    WriteLn('Cola original:');
    WriteLn(uColaInteger.toString(c));

    WriteLn;
    WriteLn('Mostrar inverso con pila:');
    mostrar_inverso_pila(c);
    WriteLn;
    WriteLn('Cola original:');
    WriteLn(uColaInteger.toString(c));
    ReadLn;
end.
