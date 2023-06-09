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

verificar_dispositivo(computadora) :-
    write('La computadora esta conectada a un tomacorrientes o fuente de energia?'), nl,
    read(Respuesta1),
    verificar_compu1(Respuesta1).

verificar_dispositivo(impresora) :-
write('La impresora esta conectada a la computadora?'), nl,
read(Respuesta1),
verificar_impresora1(Respuesta1).

% Verificar si el problema es con el sistema de llamadas
verificar_dispositivo(call_center) :-
    write('¿El sistema de llamadas se ha caído? (si o no)'), nl,
    read(Respuesta1),
    verificar_llamada1(Respuesta1).

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

verificar_dispositivo(word) :-
    write('¿Tiene su computadora suficiente espacio de almacenamiento libre?'), nl,
    read(Respuesta1),
    verificar_word1(Respuesta1).

verificar_dispositivo(excel) :-
    write('¿Está Excel instalado en su computadora?'), nl,
    read(Respuesta1),
    verificar1_excel(Respuesta1).

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


% CONOCIMIENTO DE LA COMPUTADORA
% -----------------------------------------------------
verificar_compu1(si) :- preguntar_compu2.
verificar_compu1(_) :- write('Conectar la computadora a un tomacorrientes o fuente de energia'), nl, preguntar_referencia.

preguntar_compu2 :- write('Hay algun indicio de vida en la computadora? Se enciende algun LED o escucha algun sonido?'), nl, read(Respuesta2), verificar_compu2(Respuesta2).
verificar_compu2(si) :- preguntar_compu3.
verificar_compu2(_) :- write('Verificar si el cable de poder de la fuente de poder de la computadora esta conectado correctamente'), nl, preguntar_referencia.

preguntar_compu3 :- write('Hay algun problema con el monitor?'), nl, read(Respuesta3), verificar_compu3(Respuesta3).
verificar_compu3(si) :- preguntar_compu4.
verificar_compu3(_) :- write('Verificar si el monitor esta conectado correctamente a la computadora y si esta encendido'), nl, preguntar_referencia.

preguntar_compu4 :- write('Hay algun dispositivo USB conectado a la computadora?'), nl, read(Respuesta4), verificar_compu4(Respuesta4).
verificar_compu4(si) :- preguntar_compu5.
verificar_compu4(_) :- write('Desconectar cualquier dispositivo USB conectado y verificar si la computadora enciende'), nl, preguntar_referencia.

preguntar_compu5 :- write('Verificar si los ventiladores de la computadora estan girando o no'), nl, read(Respuesta5), verificar_compu5(Respuesta5).
verificar_compu5(si) :- preguntar_compu6.
verificar_compu5(_) :- write('Verificar si los ventiladores estan obstruidos o sucios y limpiarlos si es necesario'), nl, preguntar_referencia.

preguntar_compu6 :- write('Hay algun componente dentro de la computadora que este suelto o mal conectado?'), nl, read(Respuesta6), verificar_compu6(Respuesta6).
verificar_compu6(si) :- preguntar_compu7.
verificar_compu6(_) :- write('Verificar si todos los componentes estan bien conectados y asegurados en sus puertos correspondientes'), nl, preguntar_referencia.

preguntar_compu7 :- write('Hay algun componente dentro de la computadora que este dañado?'), nl, read(Respuesta7), verificar_compu7(Respuesta7).
verificar_compu7(si) :- write('Segun la informacion que nos has dado, el problema presente solamente lo puede solucionar un tecnico especializado, lo mas recomendable seria llevar la computadora a un servicio tecnico y comentarles que esta presentando problemas para que le puedan diagnosticar y solucionar el problema'), nl, preguntar_referencia.
verificar_compu7(_) :- write('Segun la informacion que nos has dado, es posible que el problema sea causado por un problema con la fuente de poder, la memoria RAM o el procesador. Seria recomendable llevar la computadora a un servicio tecnico para diagnosticar y solucionar el problema'), nl, preguntar_referencia.

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

% CONOCIMIENTO AUDIFONOS
% -----------------------------------------------------
verificar1_audifonos(si) :- preguntar2_audifonos.
verificar1_audifonos(_) :- write('Conectar los audífonos a un dispositivo'), nl, preguntar_referencia.

preguntar2_audifonos :- write('Los audífonos están encendidos?'), nl, read(Respuesta2), verificar2_audifonos(Respuesta2).
verificar2_audifonos(si) :- preguntar3_audifonos.
verificar2_audifonos(_) :- write('Encender los audífonos'), nl, preguntar_referencia.

preguntar3_audifonos :- write('El volumen de los audífonos está adecuado?'), nl, read(Respuesta3), verificar3_audifonos(Respuesta3).
verificar3_audifonos(si) :- write('Los audífonos están funcionando correctamente'), nl, preguntar_referencia.
verificar3_audifonos(_) :- write('Ajustar el volumen de los audífonos'), nl, preguntar_referencia.


% CONOCIMIENTO CORREO ELECTRONICO
% -----------------------------------------------------
verificar1_correo(si) :- preguntar2_correo.
verificar1_correo(_) :- write('Verificar la conexión a internet y las credenciales de acceso a la cuenta de correo electrónico'), nl, preguntar_referencia.

preguntar2_correo :- write('¿Puede enviar correos electrónicos?'), nl, read(Respuesta2), verificar2_correo(Respuesta2).
verificar2_correo(si) :- preguntar3_correo.
verificar2_correo(_) :- write('Verificar la configuración de correo electrónico y las credenciales de acceso a la cuenta'), nl, preguntar_referencia.

preguntar3_correo :- write('¿Puede recibir correos electrónicos?'), nl, read(Respuesta3), verificar3_correo(Respuesta3).
verificar3_correo(si) :- write('La cuenta de correo electrónico está funcionando correctamente'), nl, preguntar_referencia.
verificar3_correo(_) :- write('Verificar la configuración de correo electrónico y las credenciales de acceso a la cuenta'), nl, preguntar_referencia.

% CONOCIMIENTO SIS. LLAMADAS
% -----------------------------------------------------
verificar_llamada1(si) :- preguntar_llamada2.
verificar_llamada1(_) :- write('El problema no es con el sistema de llamadas'), nl, preguntar_referencia.

preguntar_llamada2 :- write('¿El servidor está caído? (si o no)'), nl, read(Respuesta2), verificar_llamada2(Respuesta2).
verificar_llamada2(si) :- preguntar_referencia, nl.
verificar_llamada2(_) :- preguntar_llamada3.

preguntar_llamada3 :- write('¿El router está conectado y encendido? (si o no)'), nl, read(Respuesta3), verificar_llamada3(Respuesta3).
verificar_llamada3(si) :- preguntar_llamada4.
verificar_llamada3(_) :- write('Conectar y encender el router'), nl, preguntar_referencia.

preguntar_llamada4 :- write('¿El servidor está configurado correctamente? (si o no)'), nl, read(Respuesta4), verificar_llamada4(Respuesta4).
verificar_llamada4(si) :- preguntar_llamada5.
verificar_llamada4(_) :- write('Configurar correctamente el servidor'), nl, preguntar_referencia.

preguntar_llamada5 :- write('¿Los clientes están conectados a la red? (si o no)'), nl, read(Respuesta5), verificar_llamada5(Respuesta5).
verificar_llamada5(si) :- preguntar_referencia, nl.
verificar_llamada5(_) :- write('Conectar los clientes a la red'), nl, preguntar_referencia.

% CONOCIMIENTO DE WORD
% -----------------------------------------------------
verificar_word1(si) :- preguntar_word2.
verificar_word1(_) :- write('Liberar espacio de almacenamiento'), nl, preguntar_referencia.

preguntar_word2 :- write('¿Ha intentado reiniciar su computadora?'), nl, read(Respuesta2), verificar_word2(Respuesta2).
verificar_word2(si) :- preguntar_word3.
verificar_word2(_) :- write('Reinicie su computadora e intente abrir Word nuevamente'), nl, preguntar_referencia.

preguntar_word3 :- write('¿Ha intentado reparar la instalación de Office?'), nl, read(Respuesta3), verificar_word3(Respuesta3).
verificar_word3(si) :- preguntar_word4.
verificar_word3(_) :- write('Reparar la instalación de Office'), nl, preguntar_referencia.

preguntar_word4 :- write('¿Ha intentado reinstalar Office?'), nl, read(Respuesta4), verificar_word4(Respuesta4).
verificar_word4(si) :- preguntar_word5.
verificar_word4(_) :- write('Reinstalar Office'), nl, preguntar_referencia.

preguntar_word5 :- write('¿Ha comprobado que su versión de Office sea compatible con su sistema operativo?'), nl, read(Respuesta5), verificar_word5(Respuesta5).
verificar_word5(si) :- preguntar_word6.
verificar_word5(_) :- write('Verificar compatibilidad de su versión de Office con su sistema operativo'), nl, preguntar_referencia.

preguntar_word6 :- write('¿Ha intentado desinstalar otras aplicaciones que pudieran estar interfiriendo con el funcionamiento de Word?'), nl, read(Respuesta6), verificar_word6(Respuesta6).
verificar_word6(si) :- preguntar_word7.
verificar_word6(_) :- write('Desinstalar aplicaciones que pudieran estar interfiriendo con Word'), nl, preguntar_referencia.

preguntar_word7 :- write('¿Ha intentado restaurar su sistema a un punto de restauración anterior?'), nl, read(Respuesta7), verificar_word7(Respuesta7).
verificar_word7(si) :- write('Contactar al soporte de Office o buscar en la comunidad de usuarios de Office'), nl, preguntar_referencia.
verificar_word7(_) :- write('Restaurar su sistema a un punto de restauración anterior'), nl, preguntar_referencia.

% CONOCIMIENTO DE EXCEL
% -----------------------------------------------------
verificar1_excel(si) :- preguntar2_excel.
verificar1_excel(_) :- write('Instalar Excel en su computadora'), nl, preguntar_referencia.

preguntar2_excel :- write('¿El archivo que intenta abrir se encuentra en una ubicación accesible?'), nl, read(Respuesta2), verificar2_excel(Respuesta2).
verificar2_excel(si) :- preguntar3_excel.
verificar2_excel(_) :- write('Mover el archivo a una ubicación accesible'), nl, preguntar_referencia.

preguntar3_excel :- write('¿El archivo está dañado o corrupto?'), nl, read(Respuesta3), verificar3_excel(Respuesta3).
verificar3_excel(si) :- write('Intentar reparar el archivo o utilizar una copia de seguridad'), nl, preguntar_referencia.
verificar3_excel(_) :- preguntar4_excel.

preguntar4_excel :- write('¿Hay suficiente memoria disponible en la computadora?'), nl, read(Respuesta4), verificar4_excel(Respuesta4).
verificar4_excel(si) :- preguntar5_excel.
verificar4_excel(_) :- write('Liberar memoria en la computadora o agregar más memoria'), nl, preguntar_referencia.

preguntar5_excel :- write('¿Hay una versión más reciente de Excel disponible?'), nl, read(Respuesta5), verificar5_excel(Respuesta5).
verificar5_excel(si) :- preguntar6_excel.
verificar5_excel(_) :- write('Actualizar a la versión más reciente de Excel'), nl, preguntar_referencia.

preguntar6_excel :- write('¿El problema persiste con todos los archivos de Excel o solo con uno en particular?'), nl, read(Respuesta6), verificar6_excel(Respuesta6).
verificar6_excel(si) :- write('El problema puede ser debido a una configuración de Excel o a un problema con la instalación de Excel en su computadora. Intentar reparar o reinstalar Excel'), nl, preguntar_referencia.
verificar6_excel(_) :- write('El problema puede estar relacionado con el archivo en particular. Intentar crear un nuevo archivo o utilizar una copia de seguridad'), nl, preguntar_referencia.

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
proporcionar_referencia(outlook) :- write('Aqui esta el enlace a la pagina de soporte de Outlook: https://support.microsoft.com/es-es/microsoft-365'), nl.
proporcionar_referencia(gmail):- write('Aqui esta el enlace a la pagina de soporte de Gmail: https://support.google.com/mail/'), nl.

proporcionar_referencia(no) :- write('hasta la proxima!'), !.

proporcionar_referencia(_) :- write('Proveedor de router o monitor no reconocido. Por favor, intentalo de nuevo.'), nl, preguntar_referencia.


