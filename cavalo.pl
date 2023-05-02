criaTabuleiro(N,Tab) :- N > 0, criaTabuleiro(N,N,[],Tab).
criaTabuleiro(0,_,Acc,Tab) :- Tab = Acc.
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
            write('Defina a linha inicial: '),
            read(Lin),
            write('Defina a coluna inicial: '),
            read(Col),
            nl,
            write('Saltando...'),
            saltosCavalo(Tab,Lin,Col).

%andar pra esquerda, subir ou descer
movimento((0,-1),(0,-2),(-1,-2)).
movimento((0,-1),(0,-2),(1,-2)).
%subir pra esquerda ou direta
movimento((-1,0),(-2,0),(-2,-1)).
movimento((-1,0),(-2,0),(-2,1)).
%andar pra direita, subir ou descer
movimento((0,1),(0,2),(-1,2)).
movimento((0,1),(0,2),(1,2)).
%descer pra esquerda ou direita
movimento((1,0),(2,0),(2,-1)).
movimento((1,0),(2,0),(2,1)).

%movimentos que nao tenho certeza se sao validos no xadrez
%andar pra esquerda, subir ou descer
movimento((-1,0),(-1,-1),(-1,-2)).
movimento((1,0),(1,-1),(1,-2)).
%subir pra esquerda ou direta
movimento((0,-1),(-1,-1),(-2,-1)).
movimento((0,1),(-1,1),(-2,1)).
%andar pra direita, subir ou descer
movimento((-1,0),(-1,1),(-1,2)).
movimento((1,0),(1,1),(1,2)).
%descer pra esquerda ou direita
movimento((0,-1),(1,-1),(2,-1)).
movimento((0,1),(1,1),(2,1)).

saltosCavalo(Tab,Lin,Col) :- length(Tab,N),
                             atualiza((Lin,Col),1,Tab,NewTab),
                             Visitados = [(Lin,Col)],
                             prepararSalto(N,NewTab,Lin,Col,4,Visitados).

prepararSalto(N,Tab,Lin,Col,Saltos,Visitados) :- faz_o_L(N,Lin,Col,Tab,Saltos,NewTab,NewLin,NewCol,Visitados,NV),
                                                 NewSaltos is Saltos + 3,
                                                 prepararSalto(N,NewTab,NewLin,NewCol,NewSaltos,NV);
                                                 write('Resultado apos os saltos: '),nl,imprimeTab(Tab).

faz_o_L(Tam,Lin,Col,Tab,Salto,NewTab,NewLin,NewCol,Visitados,NV) :- movimento((M1,M2),(M3,M4),(M5,M6)),
                                                   NewLin is Lin + M5, NewLin >= 0, NewLin < Tam,
                                                   NewCol is Col + M6, NewCol >= 0, NewCol < Tam,
                                                   M1N is  Lin + M1, M2N is Col + M2, M3N is Lin + M3, M4N is Col + M4,
                                                   verificaRastro([(M1N,M2N),(M3N,M4N),(NewLin,NewCol)],Visitados),
                                                   SaltoRastro is Salto - 2,
                                                   preencheRastro((M1N,M2N),(M3N,M4N),(NewLin,NewCol),Tab,SaltoRastro,NewTab,Visitados,NV).
                                       
verificaRastro([],_).
verificaRastro([L|R],Visitados) :- \+ member(L,Visitados),
                                   verificaRastro(R,Visitados).

preencheRastro((M1,M2),(M3,M4),(M5,M6),Tab,S,NewTab,Visitados,VisitadosRastro) :-
                                                                               atualiza((M1,M2),S,Tab,NT),
                                                                               S2 is S + 1,
                                                                               atualiza((M3,M4),S2,NT,NT2),
                                                                               S3 is S + 2,
                                                                               atualiza((M5,M6),S3,NT2,NT3),
                                                                               NewTab = NT3,
                                                                               append(Visitados,[(M1,M2),(M3,M4),(M5,M6)],VisitadosRastro).


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






