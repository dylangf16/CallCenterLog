:- consult(bnf).

% Notas: el input dada por el usuario solamente puede ser escrita en
% minusculas y con " "

%Verificador de entrada para Internet
verificar_dispositivo('') :-
    write('Con que dispositivo ocupa ayuda?'), nl,
    read(Respuesta1),
    analyze_sentence(Respuesta1, _, _, Object, _, _, _, _),
    verificar_dispositivo(Object).

verificar_dispositivo("internet") :-
    write('El cable de alimentacion del router esta conectado a un enchufe o tomacorrientes?'), nl,
    read(Respuesta1),
    verificar1(Respuesta1).

%Verificador de entrada para Monitor
verificar_dispositivo("monitor") :-
    write('El monitor esta conectado a una computadora u otro dispositivo?'), nl,
    read(Respuesta1),
    verificar_monitor1(Respuesta1).

verificar_dispositivo("mouse_cable"):-
    write('Esta el cable conectado al puerto correcto en la computadora?'),
    read(Respuesta1),
    verificar_mouse_cable1(Respuesta1).

verificar_dispositivo("mouse"):-
    write('Esta mouse encendido?'),
    read(Respuesta1),
    verificar_mouse1(Respuesta1).

verificar_dispositivo("computadora") :-
    write('La computadora esta conectada a un tomacorrientes o fuente de energia?'), nl,
    read(Respuesta1),
    verificar_compu1(Respuesta1).

verificar_dispositivo("impresora") :-
write('La impresora esta conectada a la computadora?'), nl,
read(Respuesta1),
verificar_impresora1(Respuesta1).

% Verificar si el problema es con el sistema de llamadas
verificar_dispositivo("call_center") :-
    write('¿El sistema de llamadas se ha caído? (si o no)'), nl,
    read(Respuesta1),
    verificar_llamada1(Respuesta1).

% Verificación de dispositivo: audífonos
verificar_dispositivo("audifonos") :-
write('Los audífonos están conectados a un dispositivo (como una computadora o celular)?'), nl,
read(Respuesta1),
verificar1_audifonos(Respuesta1).

% Verificación de dispositivo: correo electrónico
verificar_dispositivo("correo") :-
write('¿Puede acceder a su cuenta de correo electrónico?'), nl,
read(Respuesta1),
verificar1_correo(Respuesta1).

verificar_dispositivo("word") :-
    write('¿Tiene su computadora suficiente espacio de almacenamiento libre?'), nl,
    read(Respuesta1),
    verificar_word1(Respuesta1).

verificar_dispositivo("excel") :-
    write('¿Está Excel instalado en su computadora?'), nl,
    read(Respuesta1),
    verificar1_excel(Respuesta1).

%CONOCIMIENTO ROUTER
% -----------------------------------------------------
verificar1(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !, preguntar2.
verificar1(_):- write('Conecte el router al tomacorrientes mas cercano, es preferible que el cable no quede tenso'), nl,
    write('Esto soluciona su problema?'),nl, read(Respuesta), verificar10(Respuesta).
verificar10(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar2.
verificar10(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar2 :- write('El cable de alimentacion esta conectado al router?'), nl, read(Respuesta2), verificar2(Respuesta2).
verificar2(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar3.
verificar2(_) :- write('Conecte al router el cable de alimentacion, esto generalmente se conecta en un puerto circular en la parte trasera del router'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar20(Respuesta).
verificar20(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar3.
verificar20(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar3 :- write('El router esta encendido?'), nl, read(Respuesta3), verificar3(Respuesta3).
verificar3(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar4.
verificar3(_) :- write('Encienda el router, esto generalmente se hace presionando un boton en la parte trasera del router que dice "on/off"'), nl,  write('Esto soluciona su problema?'),nl, read(Respuesta), verificar30(Respuesta).
verificar30(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar4.
verificar30(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar4:- write('El cable que provee el internet del proveedor esta conectado al router?'),nl,read(Respuesta4), verificar4(Respuesta4).
verificar4(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar5.
verificar4(_) :- write('Conecte el cable del proveedor en la entrada más alejada del router (está localizado en la parte trasera del router)'),nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar40(Respuesta).
verificar40(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar5.
verificar40(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar5 :- write('El cable que provee el internet al dispositivo esta conectado?'), nl, read(Respuesta5), verificar5(Respuesta5).
verificar5(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !, write('Segun la informacion que nos has dado, el problema presente solamente lo puede solucionar el proveedor, lo mas recomendable seria llamarlos y comentarles que esta presentando problemas con su internet'), nl, write('O los componentes internos no estan funcionando como deben, y es necesario repararlos o comprar uno nuevo'), nl, preguntar_referencia.
verificar5(_) :- write('Conecte el dispositivo al router, si es en una computadora, es preferiblemente hacerlo por cable conectandolo a un puerto en la parte trasera de la computadora, sino es mejor conectarlo de forma inalambrica, entrando al apartado de "Wifi" en las configuraciones del dispositivo'), nl, preguntar_referencia.

%CONOCIMIENTO MONITOR
% -----------------------------------------------------
verificar_monitor1(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_monitor2.
verificar_monitor1(_) :- write('Conectar el monitor al dispositivo deseado, esto se hace utilizando un cable HDMI o Display Port, conectandolo a los puertos que se encuentran en la parte trasera de ambos dispositivos)'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_monitor10(Respuesta).
verificar_monitor10(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar_monitor2.
verificar_monitor10(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar_monitor2 :- write('El monitor esta conectado a un toma corrientes?'), nl, read(Respuesta2), verificar_monitor2(Respuesta2).
verificar_monitor2(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_monitor3.
verificar_monitor2(_) :- write('Conectar el monitor a un toma corrientes.'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_monitor20(Respuesta).
verificar_monitor20(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar_monitor3.
verificar_monitor20(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar_monitor3 :- write('Hay encendida una led en la parte inferior derecha del monitor (generalmente de color blanco)?'), nl, read(Respuesta3), verificar_monitor3(Respuesta3).
verificar_monitor3(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_monitor4.
verificar_monitor3(_) :- write('Presionar el boton de encendido del monitor. Generalmente el botón está al frente, en la esquina inferior derecha, en pocos casos el botón se encuentra en la misma esquina, pero en la parte trasera del monitor.'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_monitor30(Respuesta).
verificar_monitor30(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar_monitor4.
verificar_monitor30(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar_monitor4:- write('El monitor esta seleccionado en el dispositivo deseado?(el puerto HDMI correcto)'), nl, read(Respuesta4), verificar_monitor4(Respuesta4).
verificar_monitor4(Respuesta):-analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,write('El problema que esta presentando ya es un problema de fabrica, y solamente se puede solucionar revisando los componentes y reparandolos'),nl, write('O consiguiendo un nuevo monitor'),nl, preguntar_referencia.
verificar_monitor4(_):-write('Seleccionar el puerto HDMI correcto en las opciones de "Input" del dispositivo'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_monitor40(Respuesta).
verificar_monitor40(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, verificar_monitor4('si').
verificar_monitor40(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.


%CONOCIMIENTO MOUSE
%-----------------------------------------------------
verificar_mouse_cable1(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_mouse_cable2.
verificar_mouse_cable1(_):-write('Conecte el cable al puerto necesario (generalmente es el puerto USB)'),nl,  write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_mouse_cable10(Respuesta).
verificar_mouse_cable10(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar_mouse_cable2.
verificar_mouse_cable10(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar_mouse_cable2:-write('Esta el cable conectado al mouse?'),read(Respuesta2), verificar_mouse_cable2(Respuesta2).
verificar_mouse_cable2(Respuesta):-analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !, write('Segun la información dada, el mouse esta presentando problemas internos que se solucionan, arreglando el mismo, o consiguiendo uno nuevo'),nl,preguntar_referencia.
verificar_mouse_cable2(_):-write('Conecte el cable al mouse (generalmente es la parte frontal del mouse hay un puerto)'),nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_mouse_cable20(Respuesta).
verificar_mouse_cable20(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, verificar_mouse_cable2('si').
verificar_mouse_cable20(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

%--------------

verificar_mouse1(Respuesta):-  analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_mouse2.
verificar_mouse1(_):-write('Encienda el mouse, generalmente el switch se encuentra en la parte inferior del mouse'),nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_mouse10(Respuesta).
verificar_mouse10(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar_mouse2.
verificar_mouse10(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar_mouse2:-write('El mouse tiene bateria? O su bateria esta cergada?'), read(Respuesta2), verificar_mouse2(Respuesta2).
verificar_mouse2(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_mouse3.
verificar_mouse2(_):-write('Cambie la beteria del mouse, generalmente esta se encuentra en un compartimiento que se puede acceder desde la parte inferior del mouse'),nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_mouse20(Respuesta).
verificar_mouse20(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar_mouse3.
verificar_mouse20(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar_mouse3:-write('El mouse se encuentra conectado al dispositivo? (generalmente aparece en el apartado de bluetooth del dispositivo)'),read(Respuesta3),verificar_mouse3(Respuesta3).
verificar_mouse3(Respuesta):-analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='',!,write('El mouse probablemente tiene errores en sus componentes internos, la mejor opcion es llevarlo a que lo revisen en un experto, o cambiarlo por otro'), preguntar_referencia.
verificar_mouse3(_):-write('Conecte o empareje el mouse, activando el modo bluetooth del mouse, y "buscando" la opcion en el dispositivo'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_mouse30(Respuesta).
verificar_mouse30(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, verificar_mouse3('si').
verificar_mouse30(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

% CONOCIMIENTO DE LA COMPUTADORA
% -----------------------------------------------------
verificar_compu1(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_compu2.
verificar_compu1(_) :- write('Conecta la computadora a un tomacorrientes o fuente de energia'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_compu10(Respuesta).
verificar_compu10(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar_compu2.
verificar_compu10(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar_compu2 :- write('Hay algun indicio de vida en la computadora? Se enciende algun LED o escucha algun sonido?'), nl, read(Respuesta2), verificar_compu2(Respuesta2).
verificar_compu2(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_compu3.
verificar_compu2(_) :- write('Verificar si el cable de poder de la fuente de poder de la computadora esta conectado correctamente'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_compu20(Respuesta).
verificar_compu20(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar_compu3.
verificar_compu20(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.


preguntar_compu3 :- write('Hay algun problema con el monitor?'), nl, read(Respuesta3), verificar_compu3(Respuesta3).
verificar_compu3(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_compu4.
verificar_compu3(_) :- write('Verificar si el monitor esta conectado correctamente a la computadora y si esta encendido'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_compu30(Respuesta).
verificar_compu30(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar_compu2.
verificar_compu30(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar_compu4 :- write('Hay algun dispositivo USB conectado a la computadora?'), nl, read(Respuesta4), verificar_compu4(Respuesta4).
verificar_compu4(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_compu5.
verificar_compu4(_) :- write('Desconectar cualquier dispositivo USB conectado y verificar si la computadora enciende'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_compu40(Respuesta).
verificar_compu40(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar_compu2.
verificar_compu40(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar_compu5 :- write('Verificar si los ventiladores de la computadora estan girando o no'), nl, read(Respuesta5), verificar_compu5(Respuesta5).
verificar_compu5(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_compu6.
verificar_compu5(_) :- write('Verificar si los ventiladores estan obstruidos o sucios y limpiarlos si es necesario'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_compu50(Respuesta).
verificar_compu50(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar_compu2.
verificar_compu50(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar_compu6 :- write('Hay algun componente dentro de la computadora que este suelto o mal conectado?'), nl, read(Respuesta6), verificar_compu6(Respuesta6).
verificar_compu6(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_compu7.
verificar_compu6(_) :- write('Verificar si todos los componentes estan bien conectados y asegurados en sus puertos correspondientes'), nl,write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_compu60(Respuesta).
verificar_compu60(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar_compu2.
verificar_compu60(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar_compu7 :- write('Hay algun componente dentro de la computadora que este dañado?'), nl, read(Respuesta7), verificar_compu7(Respuesta7).
verificar_compu7(Respuesta):-analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !, write('Segun la informacion que nos has dado, el problema presente solamente lo puede solucionar un tecnico especializado, lo mas recomendable seria llevar la computadora a un servicio tecnico y comentarles que esta presentando problemas para que le puedan diagnosticar y solucionar el problema'), nl, preguntar_referencia.
verificar_compu7(_) :- write('Segun la informacion que nos has dado, es posible que el problema sea causado por un problema con la fuente de poder, la memoria RAM o el procesador. Seria recomendable llevar la computadora a un servicio tecnico para diagnosticar y solucionar el problema'), nl, preguntar_referencia.

%CONOCIMIENTO IMPRESORA
% -----------------------------------------------------
verificar_impresora1(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_impresora2.
verificar_impresora1(_) :- write('Conectar la impresora a la computadora'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_impresora10(Respuesta).
verificar_impresora10(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar_impresora2.
verificar_impresora10(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar_impresora2 :- write('La impresora esta encendida?'), nl, read(Respuesta2), verificar_impresora2(Respuesta2).
verificar_impresora2(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_impresora3.
verificar_impresora2(_) :- write('Encender la impresora'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta),verificar_impresora20(Respuesta).
verificar_impresora20(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar_impresora3.
verificar_impresora20(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.

preguntar_impresora3 :- write('La impresora tiene suficiente papel y tinta?'), nl, read(Respuesta3), verificar_impresora3(Respuesta3).
verificar_impresora3(Respuesta):-analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !, write('La impresora esta lista para imprimir'), nl, preguntar_referencia.
verificar_impresora3(_) :- write('Asegurarse de tener suficiente papel y tinta en la impresora'), nl,  write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_impresora30(Respuesta).
verificar_impresora30(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, verificar_impresora3('si').
verificar_impresora30(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.


% CONOCIMIENTO AUDIFONOS
% -----------------------------------------------------
verificar1_audifonos(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar2_audifonos.
verificar1_audifonos(_) :- write('Conecta los audífonos a un dispositivo'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_audifonos10(Respuesta).
verificar_audifonos10(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar2_audifonos.
verificar_audifonos10(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.


preguntar2_audifonos :- write('Los audífonos están encendidos?'), nl, read(Respuesta2), verificar2_audifonos(Respuesta2).
verificar2_audifonos(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar3_audifonos.
verificar2_audifonos(_) :- write('Encender los audífonos'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_audifonos20(Respuesta).
verificar_audifonos20(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar3_audifonos.
verificar_audifonos20(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.


preguntar3_audifonos :- write('El volumen de los audífonos está adecuado?'), nl, read(Respuesta3), verificar3_audifonos(Respuesta3).
verificar3_audifonos(Respuesta) :-analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !, write('Los audífonos están funcionando correctamente'), nl, preguntar_referencia.
verificar3_audifonos(_) :- write('Ajustar el volumen de los audífonos'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_audifonos30(Respuesta).
verificar_audifonos30(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, verificar3_audifonos('si').
verificar_audifonos30(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.



% CONOCIMIENTO CORREO ELECTRONICO
% -----------------------------------------------------
verificar1_correo(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar2_correo.
verificar1_correo(_) :- write('Verificar la conexión a internet y las credenciales de acceso a la cuenta de correo electrónico'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_correo10(Respuesta).
verificar_correo10(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar2_correo.
verificar_correo10(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.


preguntar2_correo :- write('¿Puede enviar correos electrónicos?'), nl, read(Respuesta2), verificar2_correo(Respuesta2).
verificar2_correo(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar3_correo.
verificar2_correo(_) :- write('Verificar la configuración de correo electrónico y las credenciales de acceso a la cuenta'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_correo20(Respuesta).
verificar_correo20(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, preguntar3_correo.
verificar_correo20(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.


preguntar3_correo :- write('¿Puede recibir correos electrónicos?'), nl, read(Respuesta3), verificar3_correo(Respuesta3).
verificar3_correo(Respuesta):-analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,write('La cuenta de correo electrónico está funcionando correctamente'), nl, preguntar_referencia.
verificar3_correo(_) :- write('Verificar la configuración de correo electrónico y las credenciales de acceso a la cuenta'), nl, write('Esto soluciona su problema?'),nl, read(Respuesta), verificar_correo30(Respuesta).
verificar_correo30(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !, verificar3_correo('si').
verificar_correo30(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\=''.


% CONOCIMIENTO SIS. LLAMADAS
% -----------------------------------------------------
verificar_llamada1(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_llamada2.
verificar_llamada1(_) :- write('El problema no es con el sistema de llamadas'), nl, preguntar_referencia.

preguntar_llamada2 :- write('¿El servidor está caído? (si o no)'), nl, read(Respuesta2), verificar_llamada2(Respuesta2).
verificar_llamada2(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion='', !,preguntar_llamada3.
verificar_llamada2(_) :- preguntar_llamada3.

preguntar_llamada3 :- write('¿El router está conectado y encendido? (si o no)'), nl, read(Respuesta3), verificar_llamada3(Respuesta3).
verificar_llamada3(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_llamada4.
verificar_llamada3(_) :- write('Conectar y encender el router'), nl, preguntar_referencia.

preguntar_llamada4 :- write('¿El servidor está configurado correctamente? (si o no)'), nl, read(Respuesta4), verificar_llamada4(Respuesta4).
verificar_llamada4(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_llamada5.
verificar_llamada4(_) :- write('Configurar correctamente el servidor'), nl, preguntar_referencia.

preguntar_llamada5 :- write('¿Los clientes están conectados a la red? (si o no)'), nl, read(Respuesta5), verificar_llamada5(Respuesta5).
verificar_llamada5('si'):- write('Si aun esta presente el error, esto significa que el problema reside a un nivel inferior que no puede ser solucionado facilmente'), nl.
verificar_llamada5(_) :- write('Conectar los clientes a la red'), nl, preguntar_referencia.

% CONOCIMIENTO DE WORD
% -----------------------------------------------------
verificar_word1(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_word2.
verificar_word1(_) :- write('Liberar espacio de almacenamiento'), nl, preguntar_referencia.

preguntar_word2 :- write('¿Ha intentado reiniciar su computadora?'), nl, read(Respuesta2), verificar_word2(Respuesta2).
verificar_word2(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_word3.
verificar_word2(_) :- write('Reinicie su computadora e intente abrir Word nuevamente'), nl, preguntar_referencia.

preguntar_word3 :- write('¿Ha intentado reparar la instalación de Office?'), nl, read(Respuesta3), verificar_word3(Respuesta3).
verificar_word3(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_word4.
verificar_word3(_) :- write('Reparar la instalación de Office'), nl, preguntar_referencia.

preguntar_word4 :- write('¿Ha intentado reinstalar Office?'), nl, read(Respuesta4), verificar_word4(Respuesta4).
verificar_word4(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_word5.
verificar_word4(_) :- write('Reinstalar Office'), nl, preguntar_referencia.

preguntar_word5 :- write('¿Ha comprobado que su versión de Office sea compatible con su sistema operativo?'), nl, read(Respuesta5), verificar_word5(Respuesta5).
verificar_word5(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_word6.
verificar_word5(_) :- write('Verificar compatibilidad de su versión de Office con su sistema operativo'), nl, preguntar_referencia.

preguntar_word6 :- write('¿Ha intentado desinstalar otras aplicaciones que pudieran estar interfiriendo con el funcionamiento de Word?'), nl, read(Respuesta6), verificar_word6(Respuesta6).
verificar_word6(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar_word7.
verificar_word6(_) :- write('Desinstalar aplicaciones que pudieran estar interfiriendo con Word'), nl, preguntar_referencia.

preguntar_word7 :- write('¿Ha intentado restaurar su sistema a un punto de restauración anterior?'), nl, read(Respuesta7), verificar_word7(Respuesta7).
verificar_word7('si') :- write('Contactar al soporte de Office o buscar en la comunidad de usuarios de Office'), nl, preguntar_referencia.
verificar_word7(_) :- write('Restaurar su sistema a un punto de restauración anterior'), nl, preguntar_referencia.

% CONOCIMIENTO DE EXCEL
% -----------------------------------------------------
verificar1_excel(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar2_excel.
verificar1_excel(_) :- write('Instalar Excel en su computadora'), nl, preguntar_referencia.

preguntar2_excel :- write('¿El archivo que intenta abrir se encuentra en una ubicación accesible?'), nl, read(Respuesta2), verificar2_excel(Respuesta2).
verificar2_excel(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar3_excel.
verificar2_excel(_) :- write('Mover el archivo a una ubicación accesible'), nl, preguntar_referencia.

preguntar3_excel :- write('¿El archivo está dañado o corrupto?'), nl, read(Respuesta3), verificar3_excel(Respuesta3).
verificar3_excel(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar4_excel.
verificar3_excel(_) :- write('Intentar reparar el archivo o utilizar una copia de seguridad'), nl, preguntar_referencia.


preguntar4_excel :- write('¿Hay suficiente memoria disponible en la computadora?'), nl, read(Respuesta4), verificar4_excel(Respuesta4).
verificar4_excel(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar5_excel.
verificar4_excel(_) :- write('Liberar memoria en la computadora o agregar más memoria'), nl, preguntar_referencia.

preguntar5_excel :- write('¿Hay una versión más reciente de Excel disponible?'), nl, read(Respuesta5), verificar5_excel(Respuesta5).
verificar5_excel(Respuesta) :- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,preguntar6_excel.
verificar5_excel(_) :- write('Actualizar a la versión más reciente de Excel'), nl, preguntar_referencia.

preguntar6_excel :- write('¿El problema persiste con todos los archivos de Excel o solo con uno en particular?'), nl, read(Respuesta6), verificar6_excel(Respuesta6).
verificar6_excel('si') :- write('El problema puede ser debido a una configuración de Excel o a un problema con la instalación de Excel en su computadora. Intentar reparar o reinstalar Excel'), nl, preguntar_referencia.
verificar6_excel(_) :- write('El problema puede estar relacionado con el archivo en particular. Intentar crear un nuevo archivo o utilizar una copia de seguridad'), nl, preguntar_referencia.

%APARTADO POSIBLES CAUSAS
%-----------------------------------------------------
posibles_causas(''):-
    write("Con que dispositivo desea saber las causas de su problema?"),
    readln(Respuesta),
    analyze_sentence(Respuesta, _, _, Object, _, _, _, _),
    posibles_causas(Object).

posibles_causas(internet):-
    write('Existen varias causas por las cuales el router no funcione'), nl,
    write('1. El router no esta conectado a un enchufe o tomacorrientes'), nl,
    write('2. El router no tiene conectado el cable de alimentacion'), nl,
    write('3. El router no está encendido'),nl,
    write('4. El cable que provee el internet al router no esta conectado'), nl,
    write('5. El cable que provee el internet al dispositivo no esta conectado (o no tiene tarjeta wifi)'),nl.

posibles_causas(monitor):-
    write('Existen varias causas por las cuales el monitor no funcione'), nl,
    write('1. El monitor no esta conectado a algun dispositovo'), nl,
    write('2. El monitor no esta conectado al tomacorrientes'),nl,
    write('3. El monitor no esta encendido'), nl,
    write('4. EL monitor no esta seleccionado en el apartado de "Input" del dispositivo').

posibles_causas(mouse):-
    write('Los problemas presentes en un mouse, depende si esta conectado por cable o por Bluetooth u otro medio inalambrico'),nl,
    write('En el caso donde el mouse es alambrico, se presentan las siguientes causas:'),nl,
    write('1. El cable del mouse esta dañado internamente'),nl,
    write('2. El cable del mouse no esta conectado al dispositivo'),nl,
    write('3. El cable del mouse no esta conectado al mismo mouse (caso especial de pocos mouse, especialmente mouse hechos para videojuegos)'),
    write('-----------------------------'),
    write('En el caso donde el mouse es inalambrico, se presentan las siguientes causas:'),nl,
    write('1. El mouse esta apagado'),nl,
    write('2. El mouse esta sin bateria'),nl,
    write('3. El mouse no esta conectado al dispositivo').

% REFERENCIAS GENERALES DE TODO
% -----------------------------------------------------
preguntar_referencia:- write('Desea referencias?'), nl, read(Respuesta), verificar_referencia(Respuesta).
verificar_referencia(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,write('Cual es el modelo del dispositivo?'), nl, read(Respuesta),analyze_sentence(Respuesta, _, _, Proveedor, _, _, _, _), proporcionar_referencia(Proveedor).

proporcionar_referencia("tp-link") :- write('Aqui esta el enlace a la pagina de soporte de Tp-link: https://www.tp-link.com/support/'), nl.
proporcionar_referencia("linksys") :- write('Aqui esta el enlace a la pagina de soporte de Linksys: https://www.linksys.com/us/support/'), nl.
proporcionar_referencia("nexxt") :- write('Aqui esta el enlace a la pagina de soporte de Nexxt: https://nexxtsolutions.com/support/'), nl.
proporcionar_referencia("asus") :- write('Aqui esta el enlace a la pagina de soporte de Asus: https://www.asus.com/support/'), nl.
proporcionar_referencia("lg") :- write('Aqui esta el enlace a la pagina de soporte de LG: https://www.lg.com/cac/soporte'),nl.
proporcionar_referencia("acer") :- write('Aqui esta el enlace a la pagina de soporte de Acer: https://www.acer.com/ar-es/support'),nl.
proporcionar_referencia("samsung") :- write('Aqui esta el enlace a la pagina de soporte de Samsung: https://www.samsung.com/latin/support/'),nl.
proporcionar_referencia("lenovo") :- write('Aqui esta el enlace a la pagina de soporte de Lenovo: https://support.lenovo.com/cr/es'),nl.
proporcionar_referencia("dell") :- write('Aqui esta el enlace a la pagina de soporte de Dell: https://www.dell.com/support/home/'), nl.
proporcionar_referencia("viewsonic") :- write('Aqui esta el enlace a la pagina de soporte de ViewSonic: https://www.viewsonic.com/es/support/'),nl.
proporcionar_referencia("logitech") :- write('Aqui esta el enlace a la pagina de soporte de Logitech: https://support.logi.com/hc/en-us'), nl.
proporcionar_referencia("razer") :- write('Aqui esta el enlace a la pagina de soporte de Razer: https://support.razer.com/gaming-mice-and-mats/'), nl.
proporcionar_referencia("corsair") :- write('Aqui esta el enlace a la pagina de soporte de Corsair: https://www.corsair.com/us/en/support'), nl.
proporcionar_referencia("newskill") :- write('Aqui esta el enlace a la pagina de soporte de Newskill: https://newskillgaming.com/soporte/'), nl.
proporcionar_referencia("nordvpn") :- write('Aqui esta el enlace a la pagina de soporte de NordVPN: https://support.nordvpn.com/'), nl.
proporcionar_referencia("surfshark") :- write('Aqui esta el enlace a la pagina de soporte de Surfshark: https://support.surfshark.com/hc/en-us'), nl.
proporcionar_referencia("expressvpn") :- write('Aqui esta el enlace a la pagina de soporte de ExpressVPN: https://www.expressvpn.com/support/'), nl.
proporcionar_referencia("brother") :- write('Aqui esta el enlace a la pagina de soporte de Brother: https://www.brother-usa.com/support'), nl.
proporcionar_referencia("canpn") :- write('Aqui esta el enlace a la pagina de soporte de Canon: https://www.usa.canon.com/internet/portal/us/home/support'), nl.
proporcionar_referencia("epson") :- write('Aqui esta el enlace a la pagina de soporte de Epson: https://epson.com/Support/Printers/sh/s1'), nl.
proporcionar_referencia("hp") :- write('Aqui esta el enlace a la pagina de soporte de HP: https://support.hp.com/us-en/'), nl.
proporcionar_referencia("outlook") :- write('Aqui esta el enlace a la pagina de soporte de Outlook: https://support.microsoft.com/es-es/microsoft-365'), nl.
proporcionar_referencia("gmail"):- write('Aqui esta el enlace a la pagina de soporte de Gmail: https://support.google.com/mail/'), nl.
proporcionar_referencia(_) :- write('Proveedor de router o monitor no reconocido. Por favor, intentalo de nuevo.'), nl, verificar_referencia('si').


