preguntar :- write('�Qu� dispositivo necesita ayuda? (internet o monitor)'), nl, read(Dispositivo), verificar_dispositivo(Dispositivo).

%Verificador de entrada para Internet
verificar_dispositivo(internet) :-
    write('El router est� conectado al cable de internet (el puerto m�s alejado del resto)? (si o no)'), nl,
    read(Respuesta1),
    verificar1(Respuesta1).

%Verificador de entrada para Monitor
verificar_dispositivo(monitor) :-
    write('El monitor est� conectado a una computadora u otro dispositivo? (si o no)'), nl,
    read(Respuesta1),
    verificar_monitor1(Respuesta1).

%CONOCIMIENTO ROUTER
% -----------------------------------------------------
verificar1(si) :- preguntar2.
verificar1(no) :- write('Conectar el cable de internet al puerto m�s alejado del resto.'), nl, preguntar_referencia.

preguntar2 :- write('Hay electricidad en la instalaci�n? (si o no)'), nl, read(Respuesta2), verificar2(Respuesta2).
verificar2(si) :- preguntar3.
verificar2(no) :- write('Arreglar instalaci�n el�ctrica.'), nl, preguntar_referencia.

preguntar3 :- write('El router tiene energ�a? (si o no)'), nl, read(Respuesta3), verificar3(Respuesta3).
verificar3(si) :- preguntar4.
verificar3(no) :- write('Conectar el cable de alimentaci�n al router y a un enchufe.'), nl, preguntar_referencia.

preguntar4 :- write('El dispositivo est� conectado al router? (si o no)'), nl, read(Respuesta4), verificar4(Respuesta4).
verificar4(si) :- write('El dispositivo est� conectado al router.'), nl.
verificar4(no) :- write('Conectar el dispositivo al router.'), nl, preguntar_referencia.

%CONOCIMIENTO MONITOR
% -----------------------------------------------------
verificar_monitor1(si) :- preguntar_monitor2.
verificar_monitor1(no) :- write('Conectar el monitor al dispositivo deseado.'), nl, preguntar_referencia.

preguntar_monitor2 :- write('El monitor est� conectado a un toma corrientes? (si o no)'), nl, read(Respuesta2), verificar_monitor2(Respuesta2).
verificar_monitor2(si) :- preguntar_monitor3.
verificar_monitor2(no) :- write('Conectar el monitor a un toma corrientes.'), nl, preguntar_referencia.

preguntar_monitor3 :- write('Hay encendida una led en la parte inferior derecha del monitor (generalmente de color blanco)? (si o no)'), nl, read(Respuesta3), verificar_monitor3(Respuesta3).
verificar_monitor3(si) :- write('El monitor est� encendido.'), nl.
verificar_monitor3(no) :- write('Presionar el bot�n de encendido del monitor.'), nl, preguntar_referencia.

preguntar_referencia :- write('�Desea referencias? (si o no)'), nl, read(Respuesta), verificar_referencia(Respuesta).
verificar_referencia(si) :- write('�Cu�l es su proveedor de router o monitor?'), nl, read(Proveedor), proporcionar_referencia(Proveedor).
verificar_referencia(no) :- write('Gracias por usar nuestro programa. Hasta luego!'), nl.

% REFERENCIAS GENERALES DE TODO
% -----------------------------------------------------
proporcionar_referencia('Tp-link') :- write('Aqu� est� el enlace a la p�gina de soporte de Tp-link: https://www.tp-link.com/support/'), nl.
proporcionar_referencia('Linksys') :- write('Aqu� est� el enlace a la p�gina de soporte de Linksys: https://www.linksys.com/us/support/'), nl.
proporcionar_referencia('Nexxt') :- write('Aqu� est� el enlace a la p�gina de soporte de Nexxt: https://nexxtsolutions.com/support/'), nl.
proporcionar_referencia('Asus') :- write('Aqu� est� el enlace a la p�gina de soporte de Asus: https://www.asus.com/support/'), nl.
proporcionar_referencia('LG') :- write('Aqu� est� el enlace a la p�gina de soporte de LG: https://www.lg.com/cac/soporte'),nl.
proporcionar_referencia('Acer') :- write('Aqu� est� el enlace a la p�gina de soporte de Acer: https://www.acer.com/ar-es/support'),nl.
proporcionar_referencia('Samsung') :- write('Aqu� est� el enlace a la p�gina de soporte de Samsung: https://www.samsung.com/latin/support/'),nl.
proporcionar_referencia('Lenovo') :- write('Aqu� est� el enlace a la p�gina de soporte de Lenovo: https://support.lenovo.com/cr/es'),nl.
proporcionar_referencia('Dell') :- write('Aqu� est� el enlace a la p�gina de soporte de Dell: https://www.dell.com/es-pr/dt/services/support-services/index.htm?gclid=Cj0KCQjw8e-gBhD0ARIsAJiDsaXt2F4xOiA5xO-CcpPrulP8M1nR5_cvZiVwD9Gy0OsQHnxJaB789rMaAsayEALw_wcB&gclsrc=aw.ds'),nl.
proporcionar_referencia('LG') :- write('Aqu� est� el enlace a la p�gina de soporte de LG: https://www.lg.com/cac/soporte'),nl.
proporcionar_referencia('ViewSonic') :- write('Aqu� est� el enlace a la p�gina de soporte de ViewSonic: https://www.viewsonic.com/es/support/'),nl.
proporcionar_referencia('no') :- write('hasta la pr�xima!'), !.



proporcionar_referencia(_) :- write('Proveedor de router o monitor no reconocido. Por favor, int�ntalo de nuevo.'), nl, preguntar_referencia.
