% Base de datos
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

%Objetos
objeto("monitor").
objeto("internet").
objeto("router").
objeto("mouse").
objeto("teclado").
objeto("vpn").
objeto("impresora").
objeto("audifonos").
objeto("outlook").
objeto("correo").
objeto("facturas").
objeto("sistema").

%Afirmaciones
afirmacion("si").
afirmacion("correcto").
afirmacion("afirmativo").
afirmacion("efectivamente").


% Divide una oracion de manera que da una lista donde cada elemento es
% una palabra
split_string(String, Sep, Words) :-
    split_string(String, Sep, Sep, Words).

% Convierte una lista con palabras nuevamente en un string donde cada
% palabra esta separa por espacio
list_to_string([], '').
list_to_string([Word], Word).
list_to_string([Word|Tail], String) :-
    list_to_string(Tail, Rest),
    string_concat(Word, ' ', WordWithSpace),
    string_concat(WordWithSpace, Rest, String).


% analiza una oracion para encontrar el saludo, problema, objeto,
% afirmacion y despedida
analyze_sentence(Sentence, Greeting, Problem, Object, Affirmation, Goodbye) :-
    split_string(Sentence, " ", Words),
    extract_greeting(Words, GreetingList),
    extract_problem(Words, ProblemList),
    extract_object(Words, ObjectList),
    extract_affirmation(Words, AffirmationList),
    extract_goodbye(Words, GoodbyeList),
    list_to_string(GreetingList, Greeting),
    list_to_string(ProblemList, Problem),
    list_to_string(ObjectList, Object),
    list_to_string(AffirmationList, Affirmation),
    list_to_string(GoodbyeList, Goodbye).

% Extrae las palabras que son saludos de una lista de palabras, recorre
extract_greeting([], []).
extract_greeting([Word|Words], [Word|Greeting]) :-
    saludo(Word),!,
    extract_greeting(Words, Greeting).
extract_greeting([_|Words], Greeting) :-
    extract_greeting(Words, Greeting).

%Extrae las palabras que son despedidas de una lista de palabras
extract_goodbye([], []).
extract_goodbye([Word|Words], [Word|Goodbye]) :-
    despedida(Word),!,
    extract_goodbye(Words, Goodbye).
extract_goodbye([_|Words], Goodbye) :-
    extract_goodbye(Words, Goodbye).

% Extrae las palabras que son problemas de una lista de palabras
extract_problem([], []).
extract_problem([Word|Words], [Word|Problem]) :-
    problema(Word),!,
    extract_problem(Words, Problem).
extract_problem([_|Words], Problem) :-
    extract_problem(Words, Problem).

%Extrae las palabras que son objetos de una lista de palabras
extract_object([], []).
extract_object([Word|Words], [Word|Object]) :-
    objeto(Word),!,
    extract_object(Words, Object).
extract_object([_|Words], Object) :-
    extract_object(Words, Object).

%Extrae las palabras que son afirmaciones de una lista de palabras
extract_affirmation([],[]).
extract_affirmation([Word|Words], [Word|Affirmation]) :-
    afirmacion(Word),!,
    extract_affirmation(Words, Affirmation).
extract_affirmation([_|Words], Affirmation) :-
    extract_affirmation(Words, Affirmation).

