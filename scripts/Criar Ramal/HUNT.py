import sys

# Verifique se um argumento de linha de comando foi fornecido
if len(sys.argv) != 2:
    print("Uso: python exemplo.py <palavra_procurada>")
    sys.exit(1)

# O primeiro argumento (sys.argv[1]) é a palavra_procurada
palavra_procurada = sys.argv[1]

# Nome do arquivo fixo
nome_arquivo = "ramais.txt"

# Tente abrir o arquivo especificado
try:
    with open(nome_arquivo, 'r') as arquivo:
        # Leia o conteúdo do arquivo linha por linha
        linhas = arquivo.readlines()
        
        # Itere pelas linhas e procure a palavra
        for linha in linhas:
            if palavra_procurada in linha:
                # Se a palavra for encontrada, imprima "0" e saia com status 0 (sucesso)
                print("0")
                sys.exit(0)
        
        # Se a execução chegar aqui, a palavra não foi encontrada
        # Portanto, imprima "1" e saia com status 1 (erro)
        print("1")
        sys.exit(1)

except FileNotFoundError:
    print(f'O arquivo "{nome_arquivo}" não foi encontrado.')
    sys.exit(1)
except Exception as e:
    print(f'Ocorreu um erro: {str(e)}')
    sys.exit(1)
