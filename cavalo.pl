                 criaTabuleiro(N,Tab) :- N > 0, criaTabuleiro(N,N,[],Tab).
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
            nl,
            write('Saltando...'),
            saltosCavalo(Tab,Lin,Col).

movimento((-2,-1)).
movimento((-2,+1)).
movimento((-1,-2)).
movimento((-1,+2)).
movimento((+1,-2)).
movimento((+1,+2)).
movimento((+2,-1)).
movimento((+2,+1)).

saltosCavalo(Tab,Lin,Col) :- length(Tab,N),
                             atualiza((Lin,Col),1,Tab,NewTab,0),
                             prepararSalto(N,NewTab,Lin,Col,4).

prepararSalto(N,Tab,Lin,Col,Saltos) :- faz_o_L(N,Lin,Col,Tab,Saltos,NewTab,NewLin,NewCol),
                                       NewSaltos is Saltos + 3,
                                       prepararSalto(N,NewTab,NewLin,NewCol,NewSaltos);
                                       write('Resultado apos os saltos: '),nl,imprimeTab(Tab).

faz_o_L(Tam,Lin,Col,Tab,Salto,NewTab,NewLin,NewCol) :- movimento((X,Y)),
                                                   NewLin is Lin + X,
                                                   NewLin >= 0, NewLin < Tam,
                                                   NewCol is Col + Y,
                                                   NewCol >= 0, NewCol < Tam,
                                                   atualiza((NewLin,NewCol),Salto,Tab,NovaTab,0),
                                                   SaltoRastro is Salto - 2,
                                                   preencheRastro((Lin,Col),(NewLin,NewCol),NovaTab,SaltoRastro,NovaTabRastro),
                                                   NewTab = NovaTabRastro.

preencheRastro((LinO,ColO),(Lin,Col),Tab,Salto,NovaTab) :- (LinO > Lin, NewLinO is LinO - 1; LinO < Lin, NewLinO is LinO + 1),
                                                           atualiza((NewLinO,ColO),Salto,Tab,TabAtt,1), !,
                                                           NewSalto is Salto + 1,
                                                           preencheRastro((NewLinO,ColO),(Lin,Col),TabAtt,NewSalto,NewTab),
                                                           NovaTab = NewTab.

preencheRastro((LinO,ColO),(Lin,Col),Tab,Salto,NovaTab) :- (ColO > Col, NewColO is ColO - 1; ColO < Col, NewColO is ColO + 1),
                                                           atualiza((LinO,NewColO),Salto,Tab,TabAtt,1), !,
                                                           NewSalto is Salto + 1,
                                                           preencheRastro((LinO,NewColO),(Lin,Col),TabAtt,NewSalto,NewTab),
                                                           NovaTab = NewTab.

preencheRastro((X,Y),(X,Y),Tab,_,NovaTab) :- Tab = NovaTab.

atualiza((Lin,Col), N, [L|R], TabAtual,Ras) :-
   Lin =:= 0,
   atualizaCol(L,Col,N,NovaLin,Ras),
   TabAtual = [NovaLin|R].

atualiza((Lin,Col), N, [L|R], TabAtual,Ras) :-
   LinAux is Lin-1,
   atualiza((LinAux,Col), N, R, TabResto,Ras),
   TabAtual = [L|TabResto].

atualizaCol([X|R],Col,N,NovaLin,Ras):-
   Col =:= 0,
   (
      Ras =:= 1, NovaLin = [N|R], !;
      X =:= 0, NovaLin = [N|R], !
   ).


atualizaCol([X|R],Col,N,NovaLin,Ras):-
   NewCol is Col-1,
   (
      Ras =:= 1,atualizaCol(R,NewCol,N,Nova,Ras), NovaLin = [X|Nova];
      X =:= 0,atualizaCol(R,NewCol,N,Nova,Ras), NovaLin = [X|Nova]
   ).
