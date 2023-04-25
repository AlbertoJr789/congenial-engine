criaTabuleiro(N,Tab) :- N > 0, criaTabuleiro(N,N,Acc,Tab).
criaTabuleiro(0,_,Acc,Tab) :- Tab = Acc.
criaTabuleiro(X,N,Acc,Tab) :- length(L,N), maplist(=(0),L), X1 is X - 1, criaTabuleiro(X1,N,[L|Acc],Tab).

imprimeTab(Tab) :-
   imprimeLinha(Tab).

imprimeLinha([L|[]]) :-
   write(L).
imprimeLinha([L|R]) :-
   write(L),
   nl,
   imprimeLinha(R).

programa :- write('Defina o tamanho do tabuleiro: '),
            read(N),
            criaTabuleiro(N,Tab),
            write('Tabela criada: '),
            nl,
            imprimeTab(Tab),
            nl,
            write('Defina a linha inicial: '),
            read(Lin),
            write('Defina a coluna inicial: '),
            read(Col),
            saltosCavalo(Tab,Lin,Col),
            write('Resultado apos os saltos: '),
            nl,
            imprimeTab(Tab).

saltosCavalo(Tab,Lin,Col) :- Saltos is 0,
                             repeat,
                             faz_o_L(Lin,Col,Tab,Saltos), 
                             Saltos is Lin * Lin, ! ; fail.
                        

faz_o_L(Lin,Col,Tab,Salto) :- LinAux is Lin - 2, 
                              ColAux is Col - 1, 
                              ProxSalto is Salto + 1,
                              atualiza((LinAux,ColAux),ProxSalto,Tab,NovaTab), !,
                              Tab = NovaTab,
                              Salto is ProxSalto.

faz_o_L(Lin,Col,Tab,Salto) :- LinAux is Lin - 2, 
                              ColAux is Col + 1,
                              ProxSalto is Salto + 1,
                              atualiza((LinAux,ColAux),ProxSalto,Tab,NovaTab), !,
                              Tab = NovaTab,
                              Salto is ProxSalto.

faz_o_L(Lin,Col,Tab,Salto) :- LinAux is Lin - 1, 
                              ColAux is Col - 2, 
                              ProxSalto is Salto + 1,
                              atualiza((LinAux,ColAux),ProxSalto,Tab,NovaTab), !, 
                              Tab = NovaTab,
                              Salto is ProxSalto.

faz_o_L(Lin,Col,Tab,Salto) :- LinAux is Lin - 1, 
                              ColAux is Col + 2,
                              ProxSalto is Salto + 1, 
                              atualiza((LinAux,ColAux),ProxSalto,Tab,NovaTab), !,
                              Tab = NovaTab,
                              Salto is ProxSalto.

faz_o_L(Lin,Col,Tab,Salto) :- LinAux is Lin + 1, 
                              ColAux is Col - 2, 
                              ProxSalto is Salto + 1,
                              atualiza((LinAux,ColAux),ProxSalto,Tab,NovaTab), !, 
                              Tab = NovaTab,
                              Salto is ProxSalto.

faz_o_L(Lin,Col,Tab,Salto) :- LinAux is Lin + 1, 
                              ColAux is Col + 2,
                              ProxSalto is Salto + 1, 
                              atualiza((LinAux,ColAux),ProxSalto,Tab,NovaTab), !, 
                              Tab = NovaTab,
                              Salto is ProxSalto.

faz_o_L(Lin,Col,Tab,Salto) :- LinAux is Lin + 2, 
                              ColAux is Col - 1,
                              ProxSalto is Salto + 1, 
                              atualiza((LinAux,ColAux),ProxSalto,Tab,NovaTab), !, 
                              Tab = NovaTab,
                              Salto is ProxSalto.

faz_o_L(Lin,Col,Tab,Salto) :- LinAux is Lin + 2, 
                              ColAux is Col + 1,
                              ProxSalto is Salto + 1, 
                              atualiza((LinAux,ColAux),ProxSalto,Tab,NovaTab), !,
                              Tab = NovaTab,
                              Salto is ProxSalto.

atualiza((Lin,Col), N, [L|R], TabAtual) :-
   Lin =:= 0,
   atualizaCol(L,Col,N,NovaLin),
   TabAtual = [NovaLin|R].

atualiza((Lin,Col), N, [L|R], TabAtual) :-
   LinAux is Lin-1,
   atualiza((LinAux,Col), N, R, TabResto),
   TabAtual = [L|TabResto].

atualizaCol([X|R],Col,N,NovaLin):-
   Col =:= 0,
   X =:= 0,
   NovaLin = [N|R].

atualizaCol([X|R],Col,N,NovaLin):-
   ColAux is Col-1,
   atualizaCol(R,ColAux,N,Nova),
   NovaLin = [X|Nova].