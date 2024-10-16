
%1.Hechos,  Deifimos las relaciones familiares

padre(juan, ana).
padre(juan, pedro).
madre(maria, ana).
madre(maria, pedro).
hermano(ana, pedro).
abuelo(carlos, ana).
abuelo(carlos, pedro).
tio(jose, ana).
tio(jose, pedro).
primo(mario, ana).
primo(mario, pedro).

%2.definimos los nivel de consanguinidad
nivel_consanguinidad(X, Y, 1) :- padre(X, Y).
nivel_consanguinidad(X, Y, 1) :- madre(X, Y).
nivel_consanguinidad(X, Y, 2) :- hermano(X, Y).
nivel_consanguinidad(X, Y, 2) :- abuelo(X, Y).
nivel_consanguinidad(X, Y, 3) :- tio(X, Y).
nivel_consanguinidad(X, Y, 3) :- primo(X, Y).


%3. se definen las herencias para los familiares
distribuir_herencia(Total, Nivel1, Nivel2, Nivel3, Num1, Num2, Num3) :-
    % se calculan las proporciones ajustadas para cada nivel

    Porcentaje1 is 0.30 / Num1,  % se divide el 30% entre los herederos del nivel 1
    Porcentaje2 is 0.20 / Num2,  % se divide el 20% entre los herederos del nivel 2
    Porcentaje3 is 0.10 / Num3,  % se divide el 10% entre los herederos del nivel 3

    %    herencia proporcional a cada nivel
    Nivel1 is Total * Porcentaje1,
    Nivel2 is Total * Porcentaje2,
    Nivel3 is Total * Porcentaje3.


%pruebas
%distribuir_herencia(100000, Nivel1, Nivel2, Nivel3, 2, 1, 1).
%distribuir_herencia(250000, Nivel1, Nivel2, Nivel3, 1, 2, 3).
%distribuir_herencia(150000, Nivel1, Nivel2, Nivel3, 1, 2, 2).
