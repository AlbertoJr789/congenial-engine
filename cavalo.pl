criaTabuleiro(N,Tab) :- N > 0, criaTabuleiro(N,N,[],Tab).
criaTabuleiro(0,_,Acc,Tab) :- Tab = Acc, !.
criaTabuleiro(X,N,Acc,Tab) :- length(L,N), maplist(=(0),L), X1 is X - 1, criaTabuleiro(X1,N,[L|Acc],Tab).

imprimeTab(Tab) :-
   imprimeLinha(Tab).

imprimeLinha([]).
imprimeLinha([L|[]]) :-
   write(L).

imprimeLinha([L|R]) :-
   write(L),
   nl,
   imprimeLinha(R).

programaTeste :- criaTabuleiro(5,Tab),
            saltosCavalo(Tab,2,2).

programa :- write('Defina o tamanho do tabuleiro: '),
            read(N),
            criaTabuleiro(N,Tab), 
            write('Tabela criada: '),
            nl,
            imprimeTab(Tab),
            nl,
            write('Defina a linha inicial (começa em 0): '),
            read(Lin),
            write('Defina a coluna inicial (começa em 0): '),
            read(Col),
            nl,
            write('Saltando...'),
            saltosCavalo(Tab,Lin,Col).

movimento((-1,-2)).
movimento((1,-2)).
movimento((-2,-1)).
movimento((-2,1)).
movimento((-1,2)).
movimento((1,2)).
movimento((2,-1)).
movimento((2,1)).

saltosCavalo(Tab,Lin,Col) :- length(Tab,N),
                             atualiza((Lin,Col),1,Tab,NewTab),
                             Visitados = [(Lin,Col)],
                             prepararSalto(N,NewTab,Lin,Col,2,Visitados).

prepararSalto(N,Tab,Lin,Col,Saltos,Visitados) :- Saltos =:= N*N + 1,!,write('Resultado apos os saltos: '),nl,imprimeTab(Tab);
                                                 faz_o_L(N,Lin,Col,Tab,Saltos,NewTab,NewLin,NewCol,Visitados,NV),
                                                 NewSaltos is Saltos + 1,
                                                 prepararSalto(N,NewTab,NewLin,NewCol,NewSaltos,NV).
                                                 
faz_o_L(Tam,Lin,Col,Tab,Salto,NewTab,NewLin,NewCol,Visitados,NV) :- movimento((M5,M6)),
                                                   NewLin is Lin + M5, NewLin >= 0, NewLin < Tam,
                                                   NewCol is Col + M6, NewCol >= 0, NewCol < Tam,
                                                   \+ member((NewLin,NewCol),Visitados), 
                                                   preencheRastro((NewLin,NewCol),Tab,Salto,NewTab,Visitados,NV).

preencheRastro((M5,M6),Tab,S,NewTab,Visitados,VisitadosRastro) :-
                                                                 atualiza((M5,M6),S,Tab,NewTab),
                                                                 append(Visitados,[(M5,M6)],VisitadosRastro).
                                                                 
atualiza((Lin,Col),N,Tab,NovaTab) :-
                                   nth0(Lin,Tab,OldLin),
                                   atualizaCol(OldLin,Col,N,NewLin),
                                   atualizaLin(Tab,Lin,NewLin,NovaTab).
atualizaCol(Lin,Col,N,NewLin) :-
                              nth0(Col,Lin,_,R),
                              nth0(Col,NewLin,N,R).

atualizaLin(Tab,Lin,NewLin,NewTab) :-
                                    nth0(Lin,Tab,_,R),
                                    nth0(Lin,NewTab,NewLin,R).