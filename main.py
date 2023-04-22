from pyswip import Prolog
from time import sleep
# Criando uma nova instância do Prolog
prolog = Prolog()
# Carregando uma base de conhecimento do Prolog
prolog.consult("database.pl")

i = 0
problemas = dict()
for item in prolog.query('problema(X)'):
    problemas[i] = item["X"]
    i+=1

def mostrarProblemasDisponiveis(problemas):
    i = 0
    for item in problemas.values():
        print(f'{i} - {item}')
        i+=1

while True:
    print('\n' * 100) #imprime 100 \n pra limpar a saida do terminal a cada consulta
    print('Trabalho 1 de Paradigmas de Linguagens')
    print('Alunos: Alberto Gusmão e Gabriel Fernandes')
    print('Lista de problemas')
    mostrarProblemasDisponiveis(problemas)
    i = int(input('Qual problema gostaria de consultar ? Digite seu respectivo número: '))
    try:
        if problemas[i] is not None:
            p = problemas[i]
            for consulta in prolog.query(f'motivoProblema(\'{p}\',Prob,Sol)'):
                print(f'Possível problema: {consulta["Prob"]}')
                print(f'Possível solução: {consulta["Sol"]}')
                if input('Gostaria de ver mais ? (S/N)') not in ['S','s']:
                    break
            print('--- Fim ---')
            sleep(2)
    except Exception as e:
        print(e)

