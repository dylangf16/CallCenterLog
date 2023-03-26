:-consult(bnf).
:-consult(se).

inicio:- write('En que puedo ayudarle? (internet, monitor, mouse, computadora, impresora, call_center, audifonos, correo, word, excel)'), nl, read(Oracion), inicio(Oracion).
inicio(Oracion):-analyze_sentence(Oracion,_,_,Objeto,_,Causa,_,_),
    Causa\='', !, posibles_causas(Objeto).
inicio(Oracion):-analyze_sentence(Oracion,_,_,Objeto,_,_,Referencia,_),
    Referencia\='', !, verificar_referencia(Objeto).
inicio(Oracion):-analyze_sentence(Oracion, _, Problem, Object, _, _, _, _),
    Problem\='',!, ayudar(Object).
inicio(_):-write('Lo siento, no entiendo el problema, puedes decirlo de otra forma?'), read(Respuesta), inicio(Respuesta).

ayudar(Dispositivo):- verificar_dispositivo(Dispositivo),!, write("Algo mas en lo que pueda ayudarle?"), nl, read(Respuesta), continuar_ayuda(Respuesta).

continuar_ayuda(Oracion):- analyze_sentence(Oracion, _, _, _, Affirmation, _, _, _), Affirmation \= '',!, inicio.
continuar_ayuda(Oracion):- analyze_sentence(Oracion, _, _, Problem, _, _, _, _), Problem \= '',!, inicio(Oracion).
continuar_ayuda(_):- write("Ha sido un gusto ayudarle").

