program colas_ej4;

uses uColaInteger, math;

function bool_to_str(b: boolean): string;
begin
    if b then
        bool_to_str := 'bien.'
    else
        bool_to_str := 'mal.';
end;



{ 
    Ejercicio 4: Sumar colas

    Desarrollar un subprograma que reciba dos colas de enteros y devuelva una nueva cola
    con la suma de los elementos de las colas originales.

    Entradas: dos colas de enteros
    Salida: una cola de enteros con la suma de los elementos de las colas originales

    Ejemplos: 
        - (cola1: [1, 2, 3], cola2: [4, 5, 6]) => [5, 7, 9]
        - (cola1: [1, 2, 3], cola2: [4, 5]) => [5, 7, 3]
        - (cola1: [1, 2], cola2: [4, 5, 6]) => [5, 7, 6]

}
procedure sumar_colas(c1, c2: tCola; var c3: tCola);
begin
    initialize_queue(c3);
    while not (empty_queue(c1) and empty_queue(c2)) do
    begin
      if empty_queue(c1) then
          enqueue(c3, first(c2))
      else if empty_queue(c2) then
          enqueue(c3, first(c1))
      else
          enqueue(c3, first(c1) + first(c2));
      dequeue(c1);
      dequeue(c2);

    end;
end;


procedure crear_cola_1(var c: tCola);
begin
    initialize_queue(c);
    enqueue(c, 1);
    enqueue(c, 2);
    enqueue(c, 3);
end;

procedure crear_cola_2(var c: tCola);
begin
    initialize_queue(c);
    enqueue(c, 4);
    enqueue(c, 5);
    enqueue(c, 6);
end;

procedure crear_cola_3(var c: tCola);
begin
    initialize_queue(c);
    enqueue(c, 1);
    enqueue(c, 2);
end;

procedure crear_cola_4(var c: tCola);
begin
    initialize_queue(c);
    enqueue(c, 4);
    enqueue(c, 5);
    enqueue(c, 6);
end;

procedure crear_cola_suma_1(var c: tCola);
begin
    initialize_queue(c);
    enqueue(c, 5);
    enqueue(c, 7);
    enqueue(c, 9);
end;

procedure crear_cola_suma_2(var c: tCola);
begin
    initialize_queue(c);
    enqueue(c, 5);
    enqueue(c, 7);
    enqueue(c, 9);
end;

procedure crear_cola_suma_3(var c: tCola);
begin
    initialize_queue(c);
    enqueue(c, 5);
    enqueue(c, 7);
    enqueue(c, 6);
end;

procedure test_sumar_colas();
var
    c1, c2, c3, cCorrecta: tCola;
    resultado: string;
begin
    WriteLn('Ejercicio 4: Sumar colas');
    crear_cola_1(c1);
    crear_cola_2(c2);
    crear_cola_suma_1(cCorrecta);
    sumar_colas(c1, c2, c3);
    resultado := toString(c3);
    WriteLn('Test 1: ', resultado, ' = ', toString(cCorrecta) , ' El ejercicio funciona ', bool_to_str(resultado = toString(cCorrecta)));

    crear_cola_3(c1);
    crear_cola_4(c2);
    crear_cola_suma_3(cCorrecta);
    sumar_colas(c1, c2, c3);
    resultado := toString(c3);
    WriteLn('Test 2: ', resultado, ' = ', toString(cCorrecta) , ' El ejercicio funciona ', bool_to_str(resultado = toString(cCorrecta)));

    crear_cola_1(c1);
    crear_cola_4(c2);
    crear_cola_suma_2(cCorrecta);
    sumar_colas(c1, c2, c3);
    resultado := toString(c3);
    WriteLn('Test 3: ', resultado, ' = ', toString(cCorrecta) , ' El ejercicio funciona ', bool_to_str(resultado = toString(cCorrecta)));
end;


begin
    test_sumar_colas();
    readln;
end.
    
