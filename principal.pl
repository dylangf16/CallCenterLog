:-consult(bnf).
:-consult(se).

preguntar :- write('Que dispositivo necesita ayuda? (internet, monitor, mouse, computadora, impresora, call_center, audifonos, correo, word, excel)'), nl, read(Dispositivo), verificar_dispositivo(Dispositivo).
