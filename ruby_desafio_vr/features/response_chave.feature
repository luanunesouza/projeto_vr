#language:pt
#utf-8

Funcionalidade: Retorno Json com chave typeOfEstablishment
  Eu como cliente
  Quero realizar uma consulta dos produtos VR com chave typeOfEstablishment
  Para printar aleatoriamente um estabelecimento

  @desafio_1
  Cenário: Printar estabelecimento aleatório com chave typeOfEstablishment
    Dado que esteja acessando o endpoint de produto VR
    Então valido que a chave é typeOfEstablishment
