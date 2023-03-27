:-consult(bnf).
:-consult(se).

% inicia el proceso de ayuda al usuario, inicialmente el usuario puede
% pedir causas, referencias, comunicar su problema o despedirse
% inmediatamente
inicio:- write('En que puedo ayudarle? (internet, monitor, mouse, computadora, impresora, audifonos, correo, word, excel, sistema)'), nl, read(Oracion), inicio(Oracion).
inicio(Oracion):-analyze_sentence(Oracion,_,_,Objeto,_,Causa,_,_),
    Causa\='', !, posibles_causas(Objeto), ayudar.
inicio(Oracion):-analyze_sentence(Oracion,_,_,_,_,_,Referencia,_),
    Referencia\='', !,
    verificar_referencia(Oracion), ayudar.
inicio(Oracion):-analyze_sentence(Oracion, _, Problem, Object, _, _, _, _),
    Problem\='',!, ayudar(Object).
inicio(Oracion):-analyze_sentence(Oracion, _, _, _, _, _, _, Despedida),
    Despedida\='',!,continuar_ayuda("nada").
inicio(Oracion) :-analyze_sentence(Oracion,Saludo,_,_,_,_,_,_),Saludo\='',!,write("Buenos d�as/tardes/noches!"),nl,ayudar.
inicio(_):-write('Lo siento, no entiendo el problema, puedes decirlo de otra forma?'), read(Respuesta), inicio(Respuesta).

% en caso de ocupar ayuda con un problema hace la verificacion de que
% dispositivo necesita ayuda, una vez que termina este recorrido
% pregunta si ocupa ayuda con algo mas
ayudar(Dispositivo):- verificar_dispositivo(Dispositivo),!, write("Algo mas en lo que pueda ayudarle?"), nl, read(Respuesta), continuar_ayuda(Respuesta).
ayudar:- write("Algo mas en lo que pueda ayudarle?"), nl, read(Respuesta), continuar_ayuda(Respuesta).

% en caso de querer mas ayuda vuelve a inicio dependiendo
% respectivamente de que pida el usuario, en caso de no afirmar,
% mencionar una causa problema o referencia se termina el programa
continuar_ayuda(Oracion):- analyze_sentence(Oracion, _, _, _, Affirmation, _, _, _), Affirmation \= '',!, inicio.
continuar_ayuda(Oracion):- analyze_sentence(Oracion, _, _, Problem, _, _, _, _), Problem \= '',!, inicio(Oracion).
continuar_ayuda(Oracion):- analyze_sentence(Oracion, _, _, _, _, Causa, _, _), Causa \= '',!, inicio(Oracion).
continuar_ayuda(Oracion):- analyze_sentence(Oracion, _, _, _, _, _, Referencia, _), Referencia \= '',!, inicio(Oracion).
continuar_ayuda(_):- write("Ha sido un gusto ayudarle").


