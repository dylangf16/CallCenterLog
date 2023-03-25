% Define BNF grammar
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

% Problemas
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


% Define a predicate to split a string into words
split_string(String, Sep, Words) :-
    split_string(String, Sep, Sep, Words).

% Define the main predicate that splits a sentence into words and returns a list of words
sentence_to_lists(Sentence, Words) :-
    split_string(Sentence, " ", Words).

% Define the main predicate to analyze a sentence and extract the greeting, problem, and object
analyze_sentence(Sentence, Greeting, Problem, Object, Affirmation, Goodbye) :-
    split_string(Sentence, " ", Words),
    extract_greeting(Words, Greeting),
    extract_problem(Words, Problem),
    extract_object(Words, Object),
    extract_affirmation(Words, Affirmation),
    extract_goodbye(Words, Goodbye).

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

