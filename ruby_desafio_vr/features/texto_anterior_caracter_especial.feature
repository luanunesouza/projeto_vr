#language: pt
#utf-8

Funcionalidade: Retorno do valor anterior ao caracter especial em uma frase
  Eu como QA
  Quero realizar uma consulta que remova qualquer valor à partir do caracter especial selecionado
  Para retornar o valor anterior ao caracter especial selecionado

Esquema do Cenário: Regras e resultados
    Dado a string de entrada "<frase>"
    E os marcadores "<marcador_1>" e "<marcador_2>"
    Então a saída esperada é: "<retorno>"

    Exemplos:
    | frase                                             | marcador_1 | marcador_2 | retorno                         |
    | bananas, tomates # e ventiladores                 | #          | !          | bananas, tomates                |
    | o rato roeu a roupa $ do rei % de roma            | %          | !          | o rato roeu a roupa $ do rei    |
    | the quick brown fox & jumped over * the lazy dog  | &          | *          | the quick brown fox             |
