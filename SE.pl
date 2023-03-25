preguntar :- write('Que dispositivo necesita ayuda? (internet o monitor)'), nl, read(Dispositivo), verificar_dispositivo(Dispositivo).

%Verificador de entrada para Internet
verificar_dispositivo(internet) :-
    write('El cable de alimentacion del router esta conectado a un enchufe o tomacorrientes?'), nl,
    read(Respuesta1),
    verificar1(Respuesta1).

%Verificador de entrada para Monitor
verificar_dispositivo(monitor) :-
    write('El monitor esta conectado a una computadora u otro dispositivo? (si o no)'), nl,
    read(Respuesta1),
    verificar_monitor1(Respuesta1).

verificar_dispositivo(mouse_cable):-
    write('Esta el cable conectado al puerto correcto en la computadora?'),
    read(Respuesta1),
    verificar_mouse_cable1(Respuesta1).

%CONOCIMIENTO ROUTER
% -----------------------------------------------------
verificar1(si) :- preguntar2.
verificar1(_) :- write('Conectar el cable de alimentacion a un tomacorrientes'), nl, preguntar_referencia.

preguntar2 :- write('El cable de alimentacion esta conectado al router?'), nl, read(Respuesta2), verificar2(Respuesta2).
verificar2(si) :- preguntar3.
verificar2(_) :- write('Conectar el cable de alimentacion al router'), nl, preguntar_referencia.

preguntar3 :- write('El router esta encendido?'), nl, read(Respuesta3), verificar3(Respuesta3).
verificar3(si) :- preguntar4.
verificar3(_) :- write('Encender el router'), nl, preguntar_referencia.

preguntar4:- write('El cable que provee el internet del proveedor esta conectado al router?'),nl,read(Respuesta4), verificar4(Respuesta4).
verificar4(si) :- preguntar5.
verificar4(_) :- write('Conecte el cable del proveedor en la entrada más alejada del router (está localizado en la parte trasera del router)'),nl, preguntar_referencia.

preguntar5 :- write('El cable que provee el internet al dispositivo esta conectado?'), nl, read(Respuesta5), verificar5(Respuesta5).
verificar5(si) :- write('Segun la informacion que nos has dado, el problema presente solamente lo puede solucionar el proveedor, lo mas recomendable seria llamarlos y comentarles que esta presentando problemas con su internet'), nl, write('O los componentes internos no estan funcionando como deben, y es necesario repararlos o comprar uno nuevo'), nl, preguntar_referencia.
verificar5(_) :- write('Conectar el dispositivo al router.'), nl, preguntar_referencia.

%CONOCIMIENTO MONITOR
% -----------------------------------------------------
verificar_monitor1(si) :- preguntar_monitor2.
verificar_monitor1(_) :- write('Conectar el monitor al dispositivo deseado.'), nl, preguntar_referencia.

preguntar_monitor2 :- write('El monitor esta conectado a un toma corrientes? (si o no)'), nl, read(Respuesta2), verificar_monitor2(Respuesta2).
verificar_monitor2(si) :- preguntar_monitor3.
verificar_monitor2(_) :- write('Conectar el monitor a un toma corrientes.'), nl, preguntar_referencia.

preguntar_monitor3 :- write('Hay encendida una led en la parte inferior derecha del monitor (generalmente de color blanco)? (si o no)'), nl, read(Respuesta3), verificar_monitor3(Respuesta3).
verificar_monitor3(si) :- preguntar_monitor4.
verificar_monitor3(_) :- write('Presionar el boton de encendido del monitor.'), nl, preguntar_referencia.

preguntar_monitor4:- write('El monitor esta seleccionado en el dispositivo deseado (la opcion de HDMI correcta)'), nl, read(Respuesta4), verificar_monitor4(Respuesta4).
verificar_monitor4(si) :- write('El problema que esta presentando ya es un problema de fabrica, y solamente se puede solucionar revisando los componentes y reparandolos'),nl,
    write('O consiguiendo un nuevo monitor').
verificar_monitor4(_):-write('Seleccionar en las opciones de "Input" el monitor'), nl,preguntar_referencia.


%CONOCIMIENTO MOUSE
%-----------------------------------------------------
verificar_mouse_cable1(si):-preguntar_mouse_cable2.
verificar_mouse_cable1(_):-write('Conecte el cable al puerto necesario (generalmente es el puerto USB)'), preguntar_referencia.

preguntar_mouse_cable2:-write('Esta el cable conectado al mouse?'),
    read(Respuesta2),
    verificar_mouse_cable2(Respuesta2).
verificar_mouse_cable2(si):- write('Segun la información dada, el mouse esta presentando problemas internos que se solucionan, arreglando el mismo, o consiguiendo uno nuevo'),nl,preguntar_referencia.
verificar_mouse_cable2(_):-write('Conecte el cable al mouse (generalmente es la parte frontal del mouse hay un puerto)'),nl, preguntar_referencia.


%APARTADO POSIBLES CAUSAS
%-----------------------------------------------------
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
    write('El cable del mouse esta dañado internamente'),nl,
    write('El cable del mouse no esta conectado al dispositivo'),nl,
    write('El cable del mouse no esta conectado al mismo mouse (caso especial de pocos mouse, especialmente mouse hechos para videojuegos)'),
    write('-----------------------------'),
    write('En el caso donde el mouse es inalambrico, se presentan las siguientes causas:'),nl,
    write('El mouse esta apagado'),nl,
    write('El mouse esta sin bateria'),nl,
    write('El mouse no esta conectado al dispositivo').

% REFERENCIAS GENERALES DE TODO
% -----------------------------------------------------
preguntar_referencia :- write('Desea referencias? (si o no)'), nl, read(Respuesta), verificar_referencia(Respuesta).
verificar_referencia(si) :- write('Cual es el modelo del dispositivo?'), nl, read(Proveedor), proporcionar_referencia(Proveedor).
verificar_referencia(_) :- write('Gracias por usar nuestro programa. Hasta luego!'), nl.

proporcionar_referencia(tp-link) :- write('Aqui esta el enlace a la pagina de soporte de Tp-link: https://www.tp-link.com/support/'), nl.
proporcionar_referencia(linksys) :- write('Aqui esta el enlace a la pagina de soporte de Linksys: https://www.linksys.com/us/support/'), nl.
proporcionar_referencia(nexxt) :- write('Aqui esta el enlace a la pagina de soporte de Nexxt: https://nexxtsolutions.com/support/'), nl.
proporcionar_referencia(asus) :- write('Aqui esta el enlace a la pagina de soporte de Asus: https://www.asus.com/support/'), nl.
proporcionar_referencia(lg) :- write('Aqui esta el enlace a la pagina de soporte de LG: https://www.lg.com/cac/soporte'),nl.
proporcionar_referencia(acer) :- write('Aqui esta el enlace a la pagina de soporte de Acer: https://www.acer.com/ar-es/support'),nl.
proporcionar_referencia(samsung) :- write('Aqui esta el enlace a la pagina de soporte de Samsung: https://www.samsung.com/latin/support/'),nl.
proporcionar_referencia(lenovo) :- write('Aqui esta el enlace a la pagina de soporte de Lenovo: https://support.lenovo.com/cr/es'),nl.
proporcionar_referencia(dell) :- write('Aqui esta el enlace a la pagina de soporte de Dell: https://www.dell.com/es-pr/dt/services/support-services/index.htm?gclid=Cj0KCQjw8e-gBhD0ARIsAJiDsaXt2F4xOiA5xO-CcpPrulP8M1nR5_cvZiVwD9Gy0OsQHnxJaB789rMaAsayEALw_wcB&gclsrc=aw.ds'),nl.
proporcionar_referencia(viewsonic) :- write('Aqui esta el enlace a la pagina de soporte de ViewSonic: https://www.viewsonic.com/es/support/'),nl.
proporcionar_referencia(no) :- write('hasta la proxima!'), !.

proporcionar_referencia(_) :- write('Proveedor de router o monitor no reconocido. Por favor, intentalo de nuevo.'), nl, preguntar_referencia.
