from pyswip import Prolog
# Criando uma nova instância do Prolog
prolog = Prolog()
# Carregando uma base de conhecimento do Prolog
prolog.consult("database.pl")

print('Trabalho 1 de Paradigmas de Linguagens')
print('Alunos: Alberto Gusmão e Gabriel Fernandes')
try:
    for result in prolog.query("consultarProblema"):
        if result == {}:
            exit()
        print(result)
except Exception as e:
    print(e)

