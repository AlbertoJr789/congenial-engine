% Problemas comuns vivenciados em uma assistencia técnica
problema('computador nao liga').
problema('computador apitando').
problema('monitor nao da video').
problema('teclado nao conecta').
problema('teclado funcionando mal').
problema('mouse nao conecta').
problema('mouse nao clica').
problema('impressora nao imprime').
problema('hora do computador desregulada').
problema('computador sem internet').

/* ----------------------------------------------------------------------- */
motivoProblema('computador nao liga',Prob,Sol) :- problema_bios(Prob), solucao_problema(Prob,Sol).
motivoProblema('computador nao liga',Prob,Sol) :- problema_ram(Prob, solucao_problema(Prob,Sol).
motivoProblema('computador nao liga',Prob,Sol) :- problema_bateria_mobo(Prob), solucao_problema(Prob,Sol).
motivoProblema('computador nao liga',Prob,Sol) :- problema_processador(Prob), solucao_problema(Prob,Sol).

motivoProblema('computador apitando',Prob,Sol) :- problema_ram(Prob), solucao_problema(Prob,Sol).
motivoProblema('computador apitando',Prob,Sol) :- problema_bios(Prob), solucao_problema(Prob,Sol).
motivoProblema('computador apitando',Prob,Sol) :- problema_bateria_mobo(Prob), solucao_problema(Prob,Sol).
motivoProblema('computador apitando',Prob,Sol) :- problema_processador(Prob), solucao_problema(Prob,Sol).

motivoProblema('monitor nao da video',Prob,Sol) :- problema_ram(Prob),solucao_problema(Prob,Sol).
motivoProblema('monitor nao da video',Prob,Sol) :- problema_gpu(Prob),solucao_problema(Prob,Sol).
motivoProblema('monitor nao da video',Prob,Sol) :- problema_monitor(Prob), solucao_problema(Prob,Sol).

motivoProblema('teclado nao conecta',Prob,Sol) :- problema_periferico(Prob), solucao_problema(Prob,Sol).
motivoProblema('teclado nao conecta',Prob,Sol) :- problema_teclado(Prob), solucao_problema(Prob,Sol).
motivoProblema('teclado funcionando mal',Prob,Sol) :- problema_periferico(Prob), solucao_problema(Prob,Sol).
motivoProblema('teclado funcionando mal',Prob,Sol) :- problema_teclado(Prob), solucao_problema(Prob,Sol).

motivoProblema('mouse nao conecta',Prob,Sol) :- problema_periferico(Prob), solucao_problema(Prob,Sol).
motivoProblema('mouse nao conecta',Prob,Sol) :- problema_mouse(Prob), solucao_problema(Prob,Sol).
motivoProblema('mouse nao clica',Prob,Sol) :- problema_periferico(Prob), solucao_problema(Prob,Sol).
motivoProblema('mouse nao clica',Prob,Sol) :- problema_mouse(Prob), solucao_problema(Prob,Sol).

motivoProblema('impressora nao imprime',Prob,Sol) :- problema_impressora(Prob), solucao_problema(Prob,Sol).

motivoProblema('hora do computador desregulada',Prob,Sol) :- problema_computador_hora(Prob), solucao_problema(Prob,Sol).

motivoProblema('computador sem internet',Prob,Sol) :- problema_computador_internet(Prob), solucao_problema(Prob,Sol).

/* ----------------------------------------------------------------------- */
% Fatos que descrevem os possiveis problemas para cada componente da maquina
problema_ram('memoria ram com defeito').
problema_ram('memoria ram desencaixada').
problema_ram('memoria ram suja').
problema_ram('slot memoria ram com defeito').

problema_bios('bios pode estar desconfigurada').
problema_bios('bios pode estar corrompida').

problema_bateria_mobo('bateria descarregada').

problema_processador('processador com defeito').
problema_processador('processador desencaixado do socket').
problema_processador('ventoinha desencaixada do processador').

problema_fonte('fonte de alimentação em curto').

problema_mobo('problema no socket do processador').
problema_mobo('pino do socket torto').
problema_mobo('problema no(s) chipset(s)').

problema_gpu('gpu nao esta encaixada corretamente').
problema_gpu('gpu esta suja').
problema_gpu('gpu com defeito eletronico').

problema_monitor('cabo de video com defeito').
problema_monitor('monitor com defeito eletronico').

problema_periferico('dispositivo em curto').
problema_periferico('usb ou p2 da placa-mae com problema').
problema_periferico('usb ou p2 do dispositivo com problema').
problema_periferico('driver com problemas').
problema_periferico('dispositivo com defeito eletronico').
problema_periferico('algum outro periferico na maquina em curto esta impedindo o funcionamento correto').

problema_teclado('teclas oxidadas ou sujas').
problema_teclado('teclado mecanico: switch com mau contato ou queimado').
problema_teclado('teclado membrana: trilha da membrana pode estar rompida').

problema_mouse('botoes oxidados ou sujos').
problema_mouse('botoes queimados').

problema_impressora('papel agarrado ou obstruído').
problema_impressora('cartucho entupido ou vazio').
problema_impressora('cartucho queimado').
problema_impressora('spooler de impressão com problemas').

problema_computador_hora('bateria da placa-mae descarregada').

problema_computador_internet('cabo com problema ou sem sinal wi-fi').
problema_computador_internet('provedor sem internet').
problema_computador_internet(X) :- problema_roteador(X).

problema_roteador('roteador com as configurações de rede incorretas').
problema_roteador('roteador com defeito na antena').
problema_roteador('roteador com defeito eletronico').

/* -------------------------------------------------------------------- */
% Soluções para os problemas 

solucao_problema('memoria ram com defeito',Sol) :- Sol ='troque a memoria ram'.
solucao_problema('memoria ram desencaixada',Sol) :- Sol ='retira e encaixe novamente a memoria'.
solucao_problema('memoria ram suja',Sol) :- Sol ='limpe as memorias com limpa contato'.
solucao_problema('slot memoria ram com defeito',Sol) :- Sol ='Troque o slot da placa-mae ou troque de placa-mae'.
solucao_problema('bios pode estar desconfigurada',Sol) :- Sol ='Troque a bateria da placa mae e reconfigure a BIOS'.
solucao_problema('bios pode estar corrompida',Sol) :- Sol ='Resete a BIOS'.
solucao_problema('bateria descarregada',Sol) :- Sol ='Troque a bateria'.
solucao_problema('processador com defeito',Sol) :- Sol ='Troque o processador'.
solucao_problema('processador desencaixado do socket',Sol) :- Sol ='Retire e encaixe o processador no socket corretamente.'.
solucao_problema('ventoinha desencaixada do processador',Sol) :- Sol ='Retire e encaixe a ventoinha corretamente'.
solucao_problema('fonte de alimentação em curto',Sol) :- Sol ='Troque a fonte de alimentacao'.
solucao_problema('problema no socket do processador',Sol) :- Sol ='Realize a troca do socket da placa-mae ou troque de placa-mae'.
solucao_problema('pino do socket torto',Sol) :- Sol ='Desentorte os pinos cuidadosamente'.
solucao_problema('problema no(s) chipset(s)',Sol) :- Sol ='Troque de placa-mae'.
solucao_problema('gpu nao esta encaixada corretamente',Sol) :- Sol ='Retire e encaixe novamente a gpu'.
solucao_problema('gpu esta suja',Sol) :- Sol ='Limpe a GPU com limpa-contato e/ou alcool isopropilico'.
solucao_problema('gpu com defeito eletronico',Sol) :- Sol ='Troque de GPU'.
solucao_problema('cabo de video com defeito',Sol) :- Sol ='Troque de cabo'.
solucao_problema('monitor com defeito eletronico',Sol) :- Sol ='Troque de monitor'.
solucao_problema('dispositivo em curto',Sol) :- Sol ='Troque o dispositivo'.
solucao_problema('algum periferico na maquina em curto esta impedindo o funcionamento correto',Sol) :- Sol ='Verifique cada periferico, testando-os individualmente na maquina'.
solucao_problema('driver com problemas',Sol) :- Sol ='Reinstale o driver correto'.
solucao_problema('usb ou p2 da placa-mae com problema',Sol) :- Sol ='Teste o dispositivo em outras portas'.
solucao_problema('teclas oxidadas ou sujas',Sol) :- Sol ='Desmonte o teclado e limpe as teclas com alcool isopropilico'.
solucao_problema('teclado mecanico: switch com mau contato ou queimado',Sol) :- Sol ='Limpe os switches com limpa contato'.
solucao_problema('teclado membrana: trilha da membrana pode estar rompida',Sol) :- Sol ='Faca a reconstrucao da trilha ou troque a membrana'.
solucao_problema('botoes oxidados ou sujos',Sol) :- Sol ='Desmonte o mouse e limpe os botoes com alcool isopropilico'.
solucao_problema('botoes queimados',Sol) :- Sol ='Troque o mouse'.
solucao_problema('dispositivo com defeito eletronico',Sol) :- Sol ='Troque o dispositivo'.
solucao_problema('papel agarrado ou obstruído',Sol) :- Sol ='Abra a tampa da impressora e retire o papel'.
solucao_problema('cartucho entupido ou vazio',Sol) :- Sol ='Recarregue ou desentupa o cartucho'.
solucao_problema('cartucho queimado',Sol) :- Sol ='Troque o cartucho'.
solucao_problema('spooler de impressão com problemas',Sol) :- Sol ='Reinicie o spooler de impressao do sistema operacional'.
solucao_problema('spooler de impressão com problemas',Sol) :- Sol ='Reinicie o spooler de impressao do sistema operacional'.
solucao_problema('bateria da placa-mae descarregada',Sol) :- Sol ='Troque a bateria'.
solucao_problema('cabo com problema ou sem sinal wi-fi',Sol) :- Sol ='Verifique a integridade do cabo ou sinal do wi-fi com outro dispositivo'.
solucao_problema('provedor sem internet',Sol) :- Sol ='Contate o seu provedor'.
solucao_problema('roteador com as configurações de rede incorretas',Sol) :- Sol ='Realize as configuracoes do roteador baseado nas utilizadas pelo provedor'.
solucao_problema('roteador com defeito na antena',Sol) :- Sol ='Troque a antena ou o roteador'.
solucao_problema('roteador com defeito eletronico',Sol) :- Sol = 'Troque o roteador'.