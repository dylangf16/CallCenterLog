%Define BNF grammar
% Saludos
saludo("hola").
saludo("buenas").
saludo("buenos").
saludo("dias").
saludo("tardes").
saludo("noches").

%Despedidas
despedida("adios").
despedida("gracias").

%Problemas
problema("no").
problema("imagen").
problema("conexion").
problema("sonido").
problema("audio").
problema("suena").
problema("escribe").
problema("enciende").
problema("caido").
problema("funciona").
problema("problema").
problema("problemas").
problema("sirve").

%Objetos
objeto("monitor").
objeto("computadora").
objeto("internet").
objeto("router").
objeto("mouse").
objeto("inhalambrico").
objeto("cable").
objeto("teclado").
objeto("vpn").
objeto("impresora").
objeto("audifonos").
objeto("outlook").
objeto("correo").
objeto("facturas").
objeto("sistema").
objeto("tp-link").
objeto("linksys").
objeto("nexxt").
objeto("asus").
objeto("lg").
objeto("acer").
objeto("samsung").
objeto("lenovo").
objeto("dell").
objeto("viewsonic").
objeto("logitech").
objeto("razer").
objeto("corsair").
objeto("newskill").
objeto("nordvpn").
objeto("surfshark").
objeto("expressvpn").
objeto("brother").
objeto("canpn").
objeto("epson").
objeto("hp").
objeto("outlook").
objeto("word").
objeto("excel").
objeto("gmail").
objeto("uno").
objeto("particular").
objeto("todos").

%Afirmaciones
afirmacion("si").
afirmacion("correcto").
afirmacion("afirmativo").
afirmacion("claro").
afirmacion("efectivamente").

%Extras
causa("porque").
causa("porque?").
causa("causa").
causa("razon").
referencia("referencia").
referencia("referencias").

%------------------------------------------------------
%APARTADO POSIBLES CAUSAS
%-----------------------------------------------------
posibles_causas(''):-
    write("Con que dispositivo desea saber las causas de su problema?"),
    read(Respuesta),
    analyze_sentence(Respuesta, _, _, Object, _, _, _, _),
    posibles_causas(Object).

posibles_causas("internet"):-
    write('Existen varias causas por las cuales el router no funcione'), nl,
    write('1. El router no esta conectado a un enchufe o tomacorrientes'), nl,
    write('2. El router no tiene conectado el cable de alimentacion'), nl,
    write('3. El router no est� encendido'),nl,
    write('4. El cable que provee el internet al router no esta conectado'), nl,
    write('5. El cable que provee el internet al dispositivo no esta conectado (o no tiene tarjeta wifi)'),nl.

posibles_causas("monitor"):-
    write('Existen varias causas por las cuales el monitor no funcione'), nl,
    write('1. El monitor no esta conectado a algun dispositovo'), nl,
    write('2. El monitor no esta conectado al tomacorrientes'),nl,
    write('3. El monitor no esta encendido'), nl,
    write('4. EL monitor no esta seleccionado en el apartado de "Input" del dispositivo'),nl.

posibles_causas("mouse"):-
    write('Los problemas presentes en un mouse, depende si esta conectado por cable o por Bluetooth u otro medio inalambrico'),nl,
    write('En el caso donde el mouse es alambrico, se presentan las siguientes causas:'),nl,
    write('1. El cable del mouse esta da�ado internamente'),nl,
    write('2. El cable del mouse no esta conectado al dispositivo'),nl,
    write('3. El cable del mouse no esta conectado al mismo mouse (caso especial de pocos mouse, especialmente mouse hechos para videojuegos)'),
    write('-----------------------------'),
    write('En el caso donde el mouse es inalambrico, se presentan las siguientes causas:'),nl,
    write('1. El mouse esta apagado'),nl,
    write('2. El mouse esta sin bateria'),nl,
    write('3. El mouse no esta conectado al dispositivo'),nl.

posibles_causas("computadora"):-
    write('Existen varias razones por las que una computadora no funcione'),nl,
    write('1. La computadora no esta conectada al tomacorrientes'),nl,
    write('2. Algun componente esta conectado erroneamente o esta da�ado(en estos casos la computadora ni va a encender)'), nl,
    write('3. Si la computadora enciende, el monitor esta conectado en el puerto erroneo o esta da�ado'), nl,
    write('4. Hay algun cable que esta conectado erroneamente, generalmente el cable conectado al boton de encendido o algun cable SATA (los cables de las memorias externas)'),nl.

posibles_causas("impresora"):-
    write('Existen varias razones por las que una impresora no funcione'),nl,
    write('1. La impresora no esta conectada a la computadora o dispositivo deseado'),nl,
    write('2. La impresora no esta encendida'),nl,
    write('3. La impresora no tiene suficiente tinta o papel'),nl,
    write('4. La impresora no esta conectada a un tomacorrientes'),nl.

posibles_causas("llamadas"):-
    write('Existen varias razones por las que el sistema de llamadas no funcione'),nl,
    write('1. El sistema esta caido'),nl,
    write('2. El servidor esta caido (muy relacionado con el punto anterior)'),nl,
    write('3. El router no esta encendido o conectado a la computadora o dispositivo deseado'),nl,
    write('4. Hay algun error en la configuracion del servidor o sistema'),nl.

posibles_causas("audifonos"):-
    write('Existen varias razones por las que los audifonos para el sistema de call center no funcionen'),nl,
    write('1. Los audifonos no estan conectados a la computadora o dispositivo deseado'),nl,
    write('2. Los audifonos no estan encendidos o su microfono esta apagado'),nl,
    write('3. Los niveles de volumen de los audifonos es muy bajo, por ende no se escucha nada'),nl.


posibles_causas("correo"):-
    write('Existen varias razones por las que no sirva el correo electronico'),nl,
    write('1. Las credenciales fueron cambiadas sin notificar al encargado de ese correo (preocupante! posible caso de ataque cibernetico)'),nl,
    write('2. La configuracion del correo no es la adecuada, y filtra los correos recibidos o no deja enviar correos en casos espec�ficos'),nl.

posibles_causas("word"):-
    write('Existen varias razones por las que la aplicacion de Word de Office no funcione'),nl,
    write('1. No hay suficiente espacio en la computadora para un nuevo archivo'),nl,
    write('2. Hay un error presente al abrir la aplicacion, y solo reiniciando la computadora se soluciona'),nl,
    write('3. Hay un archivo corrupto en los archivos que usa la aplicacion para funcionar'),
    write('4. La version utilizada del programa es la erronea o esta desactualizada, por ende no tiene los arreglos de bugs mas recientes'),nl,
    write('5. Existen aplicaciones de terceros similares a word o piratas del mismo, que generan incompatibilidades, por ende, generando errores no esperados en la ejecucion del mismo'),nl.

posibles_causas("excel"):-
    write('Existen varias razones por las que la aplicacion de Excel de Office no funcione'),nl,
    write('1. No hay suficiente espacio en la computadora para un nuevo archivo'),nl,
    write('2. Hay un error presente al abrir la aplicacion, y solo reiniciando la computadora se soluciona'),nl,
    write('3. Hay un archivo corrupto en los archivos que usa la aplicacion para funcionar'),
    write('4. La version utilizada del programa es la erronea o esta desactualizada, por ende no tiene los arreglos de bugs mas recientes'),nl,
    write('5. Existen aplicaciones de terceros similares a excel o piratas del mismo, que generan incompatibilidades, por ende, generando errores no esperados en la ejecucion del mismo'),nl.

%------------------------------------------------------
% REFERENCIAS GENERALES DE TODO
% -----------------------------------------------------
preguntar_referencia:- write('Desea referencias?'), nl, read(Respuesta), verificar_referencia(Respuesta).
verificar_referencia(Respuesta):-analyze_sentence(Respuesta,_,_,Proveedor,_,_,_,_), Proveedor\='',!,proporcionar_referencia(Proveedor).
verificar_referencia(Respuesta):- analyze_sentence(Respuesta,_,_,Proveedor,_,_,_,_), Proveedor='', !,write('Cual es el modelo el proveedor?'), nl, read(Respuesta1),analyze_sentence(Respuesta1,_,_,Proveedor1,_,_,_,_), proporcionar_referencia(Proveedor1).
verificar_referencia(Respuesta):- analyze_sentence(Respuesta,_,_,_,Afirmacion,_,_,_), Afirmacion\='', !,write('Cual es el modelo el proveedor?'), nl, read(Respuesta1),analyze_sentence(Respuesta1,_, _,Proveedor,_,_,_,_), proporcionar_referencia(Proveedor).

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

% Define a predicate to split a string into words
split_string(String, Sep, Words) :-
    split_string(String, Sep, Sep, Words).

list_to_string([], '').
list_to_string([Word], Word).
list_to_string([Word|Tail], String) :-
    list_to_string(Tail, Rest),
    string_concat(Word, ' ', WordWithSpace),
    string_concat(WordWithSpace, Rest, String).


% Define the main predicate to analyze a sentence and extract the greeting, problem, and object
analyze_sentence(Sentence, Greeting, Problem, Object, Affirmation, Cause, Reference, Goodbye) :-
    split_string(Sentence, " ", Words),
    extract_greeting(Words, GreetingList),
    extract_problem(Words, ProblemList),
    extract_object(Words, ObjectList),
    extract_affirmation(Words, AffirmationList),
    extract_goodbye(Words, GoodbyeList),
    extract_cause(Words, CauseList),
    extract_reference(Words, ReferenceList),
    list_to_string(GreetingList, Greeting),
    list_to_string(ProblemList, Problem),
    list_to_string(ObjectList, Object),
    list_to_string(AffirmationList, Affirmation),
    list_to_string(GoodbyeList, Goodbye),
    list_to_string(CauseList, Cause),
    list_to_string(ReferenceList, Reference).

% Define a helper predicate to extract the greeting from the list of words
extract_greeting([], []).
extract_greeting([Word|Words], [Word|Greeting]) :-
    saludo(Word),!,
    extract_greeting(Words, Greeting).
extract_greeting([_|Words], Greeting) :-
    extract_greeting(Words, Greeting).

extract_goodbye([], []).
extract_goodbye([Word|Words], [Word|Goodbye]) :-
    despedida(Word),!,
    extract_goodbye(Words, Goodbye).
extract_goodbye([_|Words], Goodbye) :-
    extract_goodbye(Words, Goodbye).

% Define a helper predicate to extract the problem from the list of words
extract_problem([], []).
extract_problem([Word|Words], [Word|Problem]) :-
    problema(Word),!,
    extract_problem(Words, Problem).
extract_problem([_|Words], Problem) :-
    extract_problem(Words, Problem).

% Define a helper predicate to extract the object from the list of words
extract_object([], []).
extract_object([Word|Words], [Word|Object]) :-
    objeto(Word),!,
    extract_object(Words, Object).
extract_object([_|Words], Object) :-
    extract_object(Words, Object).

extract_affirmation([],[]).
extract_affirmation([Word|Words], [Word|Affirmation]) :-
    afirmacion(Word),!,
    extract_affirmation(Words, Affirmation).
extract_affirmation([_|Words], Affirmation) :-
    extract_affirmation(Words, Affirmation).

extract_cause([],[]).
extract_cause([Word|Words], [Word|Cause]) :-
    causa(Word),!,
    extract_cause(Words, Cause).
extract_cause([_|Words], Cause) :-
    extract_cause(Words, Cause).

extract_reference([],[]).
extract_reference([Word|Words], [Word|Reference]) :-
    referencia(Word),!,
    extract_reference(Words, Reference).
extract_reference([_|Words], Reference) :-
    extract_reference(Words, Reference).



