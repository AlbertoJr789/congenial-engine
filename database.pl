% Problemas comuns vivenciados em uma assistencia técnica
problema('computador_nao_liga').
problema('computador_apitando').
problema('monitor_nao_da_video').
problema('teclado_nao_conecta').
problema('teclado_funcionando_mal').
problema('mouse_nao_conecta').
problema('mouse_nao_clica').
problema('impressora_nao_imprime').
problema('hora_do_computador_desregulada').
problema('computador_sem_internet').

/* ----------------------------------------------------------------------- */




motivoProblema('computador_nao_liga',Prob,Sol) :- problema_bios(Prob), solucao_problema(Prob,Sol).
motivoProblema('computador_nao_liga',Prob,Sol) :- problema_ram(Prob), solucao_problema(Prob,Sol).

motivoProblema('computador_nao_liga',Prob,Sol) :- problema_bateria_mobo(Prob), solucao_problema(Prob,Sol).
motivoProblema('computador_nao_liga',Prob,Sol) :- problema_processador(Prob), solucao_problema(Prob,Sol).
motivoProblema('computador_nao_liga',Prob,Sol) :- problema_fonte('computador nao liga', Prob), solucao_problema(Prob,Sol).

motivoProblema('computador_apitando',Prob,Sol) :- problema_ram(Prob), solucao_problema(Prob,Sol).

motivoProblema('computador_apitando',Prob,Sol) :- problema_bios(Prob), solucao_problema(Prob,Sol).
motivoProblema('computador_apitando',Prob,Sol) :- problema_bateria_mobo(Prob), solucao_problema(Prob,Sol).
motivoProblema('computador_apitando',Prob,Sol) :- problema_processador(Prob), solucao_problema(Prob,Sol).

motivoProblema('monitor_nao_da_video',Prob,Sol) :- problema_ram(Prob),solucao_problema(Prob,Sol).
motivoProblema('monitor_nao_da_video',Prob,Sol) :- problema_gpu(Prob),solucao_problema(Prob,Sol).
motivoProblema('monitor_nao_da_video',Prob,Sol) :- problema_monitor(Prob), solucao_problema(Prob,Sol).

motivoProblema('teclado_nao_conecta',Prob,Sol) :- problema_periferico(Prob), solucao_problema(Prob,Sol).
motivoProblema('teclado_nao_conecta',Prob,Sol) :- problema_teclado(Prob), solucao_problema(Prob,Sol).
motivoProblema('teclado_funcionando_mal',Prob,Sol) :- problema_periferico(Prob), solucao_problema(Prob,Sol).
motivoProblema('teclado_funcionando_mal',Prob,Sol) :- problema_teclado(Prob), solucao_problema(Prob,Sol).

motivoProblema('mouse_nao_conecta',Prob,Sol) :- problema_periferico(Prob), solucao_problema(Prob,Sol).
motivoProblema('mouse_nao_conecta',Prob,Sol) :- problema_mouse(Prob), solucao_problema(Prob,Sol).
motivoProblema('mouse_nao_clica',Prob,Sol) :- problema_periferico(Prob), solucao_problema(Prob,Sol).
motivoProblema('mouse_nao_clica',Prob,Sol) :- problema_mouse(Prob), solucao_problema(Prob,Sol).

motivoProblema('impressora_nao_imprime',Prob,Sol) :- problema_impressora(Prob), solucao_problema(Prob,Sol).

motivoProblema('hora_do_computador_desregulada',Prob,Sol) :- problema_computador_hora(Prob), solucao_problema(Prob,Sol).

motivoProblema('computador_sem_internet',Prob,Sol) :- problema_computador_internet(Prob), solucao_problema(Prob,Sol).

/* ----------------------------------------------------------------------- */
% Fatos que descrevem os possiveis problemas para cada componente da maquina
problema_ram('memoria_ram_com_defeito').
problema_ram('memoria_ram_desencaixada').
problema_ram('memoria_ram_suja').
problema_ram('slot_memoria_ram_com_defeito').

problema_bios('bios_pode_estar_desconfigurada').
problema_bios('bios_pode_estar_corrompida').

problema_bateria_mobo('bateria_descarregada').

problema_processador('processador_com_defeito').
problema_processador('processador_desencaixado_do_socket').
problema_processador('ventoinha_desencaixada_do_processador').

problema_fonte('fonte_de_alimentação_em_curto').
problema_fonte('computador_nao_liga', 'fonte_nao_fornece_energia_suficiente_aos_componentes').

problema_mobo('problema_no_socket_do_processador').
problema_mobo('pino_do_socket_torto').
problema_mobo('problema_no(s)_chipset(s)').

problema_gpu('gpu_nao_esta_encaixada_corretamente').
problema_gpu('gpu_esta_suja').
problema_gpu('gpu_com_defeito_eletronico').

problema_monitor('cabo_de_video_com_defeito').
problema_monitor('monitor_com_defeito_eletronico').

problema_periferico('dispositivo_em_curto').
problema_periferico('usb_ou_p2_da_placa-mae_com_problema').
problema_periferico('usb_ou_p2_do_dispositivo_com_problema').
problema_periferico('driver_com_problemas').
problema_periferico('dispositivo_com_defeito_eletronico').
problema_periferico('algum_outro_periferico_na_maquina_em_curto_esta_impedindo_o_funcionamento_correto').

problema_teclado('teclas_oxidadas_ou_sujas').
problema_teclado('teclado_mecanico_switch_com_mau_contato_ou_queimado').
problema_teclado('teclado_membrana_trilha_da_membrana_pode_estar_rompida').

problema_mouse('botoes_oxidados_ou_sujos').
problema_mouse('botoes_queimados').

problema_impressora('papel_agarrado_ou_obstruído').
problema_impressora('cartucho_entupido_ou_vazio').
problema_impressora('cartucho_queimado').
problema_impressora('spooler_de_impressão_com_problemas').

problema_computador_hora('bateria_da_placa_mae_descarregada').

problema_computador_internet('cabo_com_problema_ou_sem_sinal_wi_fi').
problema_computador_internet('provedor_sem_internet').
problema_computador_internet(X) :- problema_roteador(X).

problema_roteador('roteador_com_as_configurações_de_rede_incorretas').
problema_roteador('roteador_com_defeito_na antena').
problema_roteador('roteador_com_defeito_eletronico').

/* -------------------------------------------------------------------- */
% Soluções para os problemas

solucao_problema('memoria_ram_com_defeito',Sol) :- Sol ='troque a memoria ram'.
solucao_problema('memoria_ram_com_defeito',Sol) :- Sol ='limpe a memória ram'.
solucao_problema('memoria_ram_desencaixada',Sol) :- Sol ='retira e encaixe novamente a memoria'.
solucao_problema('memoria_ram_suja',Sol) :- Sol ='limpe as memorias com limpa contato'.
solucao_problema('slot_memoria_ram_com_defeito',Sol) :- Sol ='Troque o slot da placa-mae ou troque de placa-mae'.
solucao_problema('bios_pode_estar_desconfigurada',Sol) :- Sol ='Troque a bateria da placa mae e reconfigure a BIOS'.
solucao_problema('bios_pode_estar_corrompida',Sol) :- Sol ='Resete a BIOS'.
solucao_problema('bateria_descarregada',Sol) :- Sol ='Troque a bateria'.
solucao_problema('processador_com_defeito',Sol) :- Sol ='Troque o processador'.
solucao_problema('processador_desencaixado_do_socket',Sol) :- Sol ='Retire e encaixe o processador no socket corretamente.'.
solucao_problema('ventoinha_desencaixada_do_processador',Sol) :- Sol ='Retire e encaixe a ventoinha corretamente'.
solucao_problema('fonte_de_alimentação_em_curto',Sol) :- Sol ='Troque a fonte de alimentacao'.
solucao_problema('problema_no_socket_do_processador',Sol) :- Sol ='Realize a troca do socket da placa-mae ou troque de placa-mae'.
solucao_problema('pino_do_socket_torto',Sol) :- Sol ='Desentorte os pinos cuidadosamente'.
solucao_problema('problema_no(s)_chipset(s)',Sol) :- Sol ='Troque de placa-mae'.
solucao_problema('gpu_nao_esta_encaixada_corretamente',Sol) :- Sol ='Retire e encaixe novamente a gpu'.
solucao_problema('gpu_esta_suja',Sol) :- Sol ='Limpe a GPU com limpa-contato e/ou alcool isopropilico'.
solucao_problema('gpu_com_defeito_eletronico',Sol) :- Sol ='Troque de GPU'.
solucao_problema('cabo_de_video_com_defeito',Sol) :- Sol ='Troque de cabo'.
solucao_problema('monitor_com_defeito_eletronico',Sol) :- Sol ='Troque de monitor'.
solucao_problema('dispositivo_em_curto',Sol) :- Sol ='Troque o dispositivo'.
solucao_problema('algum_periferico_na_maquina_em_curto_esta_impedindo_o_funcionamento_correto',Sol) :- Sol ='Verifique cada periferico, testando-os individualmente na maquina'.
solucao_problema('driver_com_problemas',Sol) :- Sol ='Reinstale o driver correto'.
solucao_problema('usb_ou_p2_da_placa-mae_com_problema',Sol) :- Sol ='Teste o dispositivo em outras portas'.
solucao_problema('teclas_oxidadas_ou_sujas',Sol) :- Sol ='Desmonte o teclado e limpe as teclas com alcool isopropilico'.
solucao_problema('teclado_mecanico_switch_com_mau_contato_ou_queimado',Sol) :- Sol ='Limpe os switches com limpa contato'.
solucao_problema('teclado_membrana_trilha_da_membrana_pode_estar_rompida',Sol) :- Sol ='Faca a reconstrucao da trilha ou troque a membrana'.
solucao_problema('botoes_oxidados_ou_sujos',Sol) :- Sol ='Desmonte o mouse e limpe os botoes com alcool isopropilico'.
solucao_problema('botoes_queimados',Sol) :- Sol ='Troque o mouse'.
solucao_problema('dispositivo_com_defeito_eletronico',Sol) :- Sol ='Troque o dispositivo'.
solucao_problema('papel_agarrado_ou_obstruído',Sol) :- Sol ='Abra a tampa da impressora e retire o papel'.
solucao_problema('cartucho_entupido_ou_vazio',Sol) :- Sol ='Recarregue ou desentupa o cartucho'.
solucao_problema('cartucho_queimado',Sol) :- Sol ='Troque o cartucho'.
solucao_problema('spooler_de_impressão_com_problemas',Sol) :- Sol ='Reinicie o spooler de impressao do sistema operacional'.
solucao_problema('spooler_de_impressão_com_problemas',Sol) :- Sol ='Reinicie o spooler de impressao do sistema operacional'.
solucao_problema('bateria_da_placa-mae_descarregada',Sol) :- Sol ='Troque a bateria'.
solucao_problema('cabo_com_problema_ou_sem_sinal_wi_fi',Sol) :- Sol ='Verifique a integridade do cabo ou sinal do wi-fi com outro dispositivo'.
solucao_problema('provedor_sem_internet',Sol) :- Sol ='Contate o seu provedor'.
solucao_problema('roteador_com_as_configurações_de_rede_incorretas',Sol) :- Sol ='Realize as configuracoes do roteador baseado nas utilizadas pelo provedor'.
solucao_problema('roteador_com_defeito_na_antena',Sol) :- Sol ='Troque a antena ou o roteador'.
solucao_problema('roteador_com_defeito_eletronico',Sol) :- Sol = 'Troque o roteador'.
solucao_problema('fonte_nao_fornece_energia_suficiente_aos_componentes',Sol) :- Sol = 'Troque a fonte de alimentacao'.

/* -------------------------------------------------------------------- */

consultarProblema :-
                  write(''),
                  write('Digite o problema que o seu computador possui.'), nl,
                  write('Exemplo: computador nao liga. '), nl,
                  write('O problema deve ter "." no final'), nl,
                  write('Para finalizar a entrada de dados, entre com: "f."'), nl,
                  write('Para sair do programa: "sair."'), nl,
                  write('Problemas: '), nl,
                  listarProblemas,
                  lerProblemas([]).

listarProblemas :-
    problema(X),
    write(X), nl,
    fail.
listarProblemas.

lerProblemas(Problemas):-
read(Problema), identificarProblemas(Problema,Problemas).

identificarProblemas(sair,_).

identificarProblemas(f,Problemas):-
  (validaTamanhoLista(Problemas),buscarProblemas(Problemas) ; write('Deve ter ao menos um problema na lista. '), nl, lerProblemas(Problemas)).

identificarProblemas(Problema,Problemas):-
  problema(Problema), (not(pertence(Problema,Problemas)), write('Problema já foi adicionado. '), nl, lerProblemas(Problemas) ; lerProblemas([Problema|Problemas])).

identificarProblemas(Problema,Problemas):-
  validaFatoComParametro(problema(Problema)),
  write('O problema desconhecido na base de dados. '),
  lerProblemas(Problemas).

validaFatoComParametro(Predicado) :-
    Predicado, !, fail.
validaFatoComParametro(_).

validaTamanhoLista(Lista):-
  length(Lista,Tam), Tam > 0.

buscarProblemas(Entrada):-
  preencheLista(Entrada,Lista),
  write('Problemas:'), nl,
  listaProblemasSecundarios(Lista),
  write('Digite os problemas de acordo com os listados com "." no final.'), nl,
  write('Digite "f." para finalizar a entrada.'), nl,
  write('Digite "sair." para finalizar o programa.'), nl,
  lerProblemasSecundarios([],Lista).

preencheLista([], []).
preencheLista([X|T], ListaResultado) :-
    preencheLista(T, ListaTemp),
    findall(Prob, motivoProblema(X, Prob, _), ListaProblemas),
    append(ListaProblemas, ListaTemp, ListaResultado).

listaProblemasSecundarios([X|T]):- length([X|T],Tamanho),
                                    Tamanho > 0, write(X),
                                    nl, listaProblemasSecundarios(T) ;  !.

lerProblemasSecundarios(ListaEntrada,ListaProblemas):-
   read(Problema), verificaSeEProblema(Problema, ListaEntrada,ListaProblemas).

verificaSeEProblema(sair,_,_).
verificaSeEProblema(f,ListaEntrada,ListaProblemas):-
   (validaTamanhoLista(ListaEntrada), buscarSolucoes(ListaEntrada) ; write('Deve ter ao menos um problema na lista. '), nl, lerProblemasSecundarios(ListaEntrada,ListaProblemas)).

verificaSeEProblema(Problema,ListaEntrada,ListaProblemas):-
   member(Problema, ListaProblemas),
   (not(pertence(Problema,ListaEntrada)), write('Problema já foi adicionado. '), nl, lerProblemasSecundarios(ListaEntrada,ListaProblemas) ; lerProblemasSecundarios([Problema|ListaEntrada],ListaProblemas)).

verificaSeEProblema(Problema,ListaEntrada,ListaProblemas):-
   member(Problema, ListaProblemas),
   member(Problema, ListaEntrada),
   write('O problema desconhecido na base de dados. '), nl,
   lerProblemasSecundarios(ListaEntrada,ListaProblemas).

buscarSolucoes(ListaProblemas) :-
    member(Problema, ListaProblemas),
    solucao_problema(Problema, Solucao),
    write('Problema: '), write(Problema), write(' Solucao: '), write(Solucao), nl,
    fail.
buscarSolucoes(_):- consultarProblema.

pertence(_, []) :- !.
pertence(X, [X|_]) :- !, fail.
pertence(X, [_|T]) :- pertence(X, T).
