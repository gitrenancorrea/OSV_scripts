import sys
import re

def procurar_valor(conteudo, padrao):
    resultado = re.search(padrao, conteudo)
    if resultado:
        return resultado.group(1)
    else:
        return "Não encontrado"

if len(sys.argv) > 1:
    valor_enviado = sys.argv[1]
    padrao = rf'IPSEC_UNAME="{valor_enviado}" ,IPSEC_PW="([^"]*)"'

    with open('base_limpa.txt', 'r', encoding='utf-8') as arquivo:
        conteudo = arquivo.read()

    ipsec_pw = procurar_valor(conteudo, padrao)
    print(ipsec_pw)

