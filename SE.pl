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

verificar_dispositivo(mouse):-
    write('Esta mouse encendido?'),
    read(Respuesta1),
    verificar_mouse1(Respuesta1).

verificar_dispositivo(vpn) :-
write('La aplicacion de VPN esta instalada en su dispositivo?'), nl,
read(Respuesta1),
verificar_vpn1(Respuesta1).

verificar_dispositivo(impresora) :-
write('La impresora esta conectada a la computadora?'), nl,
read(Respuesta1),
verificar_impresora1(Respuesta1).

% Verificación de dispositivo: audífonos
verificar_dispositivo(audifonos) :-
write('Los audífonos están conectados a un dispositivo (como una computadora o celular)?'), nl,
read(Respuesta1),
verificar1_audifonos(Respuesta1).

% Verificación de dispositivo: correo electrónico
verificar_dispositivo(correo) :-
write('¿Puede acceder a su cuenta de correo electrónico?'), nl,
read(Respuesta1),
verificar1_correo(Respuesta1).

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

%--------------

verificar_mouse1(si):-preguntar_mouse2.
verificar_mouse1(_):-write('Encienda el mouse, generalmente el switch se encuentra en la parte inferior del mouse'),nl,preguntar_referencia.

preguntar_mouse2:-write('El mouse tiene bateria? O su bateria esta cergada?'), read(Respuesta2), verificar_mouse2(Respuesta2).
verificar_mouse2(si):-preguntar_mouse3.
verificar_mouse2(_):-write('Cambie la beteria del mouse, generalmente esta se encuentra en un compartimiento que se puede acceder desde la parte inferior del mouse'),nl,preguntar_referencia.

preguntar_mouse3:-write('El mouse se encuentra conectado al dispositivo (generalmente aparece en el apartado de bluetooth del dispositivo)'),read(Respuesta3),verificar_mouse3(Respuesta3).
verificar_mouse3(si):-write('El mouse probablemente tiene errores en sus componentes internos, la mejor opcion es llevarlo a que lo revisen en un experto, o cambiarlo por otro').
verificar_mouse3(_):-write('Conecte o empareje el mouse, activando el modo bluetooth del mouse, y "buscando" la opcion en el dispositivo'), nl, preguntar_referencia.

%CONOCIMIENTO VPN
% -----------------------------------------------------
verificar_vpn1(si) :- preguntar_vpn2.
verificar_vpn1(_) :- write('Instalar la aplicacion de VPN en su dispositivo'), nl, preguntar_referencia.

preguntar_vpn2 :- write('Esta conectado a una red de internet?'), nl, read(Respuesta2), verificar_vpn2(Respuesta2).
verificar_vpn2(si) :- preguntar_vpn3.
verificar_vpn2(_) :- write('Conectese a una red de internet'), nl, preguntar_referencia.

preguntar_vpn3 :- write('La aplicacion de VPN esta encendida?'), nl, read(Respuesta3), verificar_vpn3(Respuesta3).
verificar_vpn3(si) :- write('No hay problemas con la conexion VPN'), nl, preguntar_referencia.
verificar_vpn3(_) :- write('Encienda la aplicacion de VPN'), nl, preguntar_referencia.

%CONOCIMIENTO IMPRESORA
% -----------------------------------------------------
verificar_impresora1(si) :- preguntar_impresora2.
verificar_impresora1(_) :- write('Conectar la impresora a la computadora'), nl, preguntar_referencia.

preguntar_impresora2 :- write('La impresora esta encendida?'), nl, read(Respuesta2), verificar_impresora2(Respuesta2).
verificar_impresora2(si) :- preguntar_impresora3.
verificar_impresora2(_) :- write('Encender la impresora'), nl, preguntar_referencia.

preguntar_impresora3 :- write('La impresora tiene suficiente papel y tinta?'), nl, read(Respuesta3), verificar_impresora3(Respuesta3).
verificar_impresora3(si) :- write('La impresora esta lista para imprimir'), nl, preguntar_referencia.
verificar_impresora3(_) :- write('Asegurarse de tener suficiente papel y tinta en la impresora'), nl, preguntar_referencia.

% Conocimiento de audífonos
% -----------------------------------------------------
verificar1_audifonos(si) :- preguntar2_audifonos.
verificar1_audifonos(_) :- write('Conectar los audífonos a un dispositivo'), nl, preguntar_referencia.

preguntar2_audifonos :- write('Los audífonos están encendidos?'), nl, read(Respuesta2), verificar2_audifonos(Respuesta2).
verificar2_audifonos(si) :- preguntar3_audifonos.
verificar2_audifonos(_) :- write('Encender los audífonos'), nl, preguntar_referencia.

preguntar3_audifonos :- write('El volumen de los audífonos está adecuado?'), nl, read(Respuesta3), verificar3_audifonos(Respuesta3).
verificar3_audifonos(si) :- write('Los audífonos están funcionando correctamente'), nl, preguntar_referencia.
verificar3_audifonos(_) :- write('Ajustar el volumen de los audífonos'), nl, preguntar_referencia.


% Conocimiento de correo electrónico
% -----------------------------------------------------
verificar1_correo(si) :- preguntar2_correo.
verificar1_correo(_) :- write('Verificar la conexión a internet y las credenciales de acceso a la cuenta de correo electrónico'), nl, preguntar_referencia.

preguntar2_correo :- write('¿Puede enviar correos electrónicos?'), nl, read(Respuesta2), verificar2_correo(Respuesta2).
verificar2_correo(si) :- preguntar3_correo.
verificar2_correo(_) :- write('Verificar la configuración de correo electrónico y las credenciales de acceso a la cuenta'), nl, preguntar_referencia.

preguntar3_correo :- write('¿Puede recibir correos electrónicos?'), nl, read(Respuesta3), verificar3_correo(Respuesta3).
verificar3_correo(si) :- write('La cuenta de correo electrónico está funcionando correctamente'), nl, preguntar_referencia.
verificar3_correo(_) :- write('Verificar la configuración de correo electrónico y las credenciales de acceso a la cuenta'), nl, preguntar_referencia.


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
proporcionar_referencia(dell) :- write('Aqui esta el enlace a la pagina de soporte de Dell: https://www.dell.com/support/home/'), nl.
proporcionar_referencia(viewsonic) :- write('Aqui esta el enlace a la pagina de soporte de ViewSonic: https://www.viewsonic.com/es/support/'),nl.
proporcionar_referencia(logitech) :- write('Aqui esta el enlace a la pagina de soporte de Logitech: https://support.logi.com/hc/en-us'), nl.
proporcionar_referencia(razer) :- write('Aqui esta el enlace a la pagina de soporte de Razer: https://support.razer.com/gaming-mice-and-mats/'), nl.
proporcionar_referencia(corsair) :- write('Aqui esta el enlace a la pagina de soporte de Corsair: https://www.corsair.com/us/en/support'), nl.
proporcionar_referencia(newskill) :- write('Aqui esta el enlace a la pagina de soporte de Newskill: https://newskillgaming.com/soporte/'), nl.
proporcionar_referencia(nordvpn) :- write('Aqui esta el enlace a la pagina de soporte de NordVPN: https://support.nordvpn.com/'), nl.
proporcionar_referencia(surfshark) :- write('Aqui esta el enlace a la pagina de soporte de Surfshark: https://support.surfshark.com/hc/en-us'), nl.
proporcionar_referencia(expressvpn) :- write('Aqui esta el enlace a la pagina de soporte de ExpressVPN: https://www.expressvpn.com/support/'), nl.
proporcionar_referencia(brother) :- write('Aqui esta el enlace a la pagina de soporte de Brother: https://www.brother-usa.com/support'), nl.
proporcionar_referencia(canpn) :- write('Aqui esta el enlace a la pagina de soporte de Canon: https://www.usa.canon.com/internet/portal/us/home/support'), nl.
proporcionar_referencia(epson) :- write('Aqui esta el enlace a la pagina de soporte de Epson: https://epson.com/Support/Printers/sh/s1'), nl.
proporcionar_referencia(hp) :- write('Aqui esta el enlace a la pagina de soporte de HP: https://support.hp.com/us-en/'), nl.

proporcionar_referencia(no) :- write('hasta la proxima!'), !.

proporcionar_referencia(_) :- write('Proveedor de router o monitor no reconocido. Por favor, intentalo de nuevo.'), nl, preguntar_referencia.


