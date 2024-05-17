describe('Projeto VR - Luan', () => {
  beforeEach(() => {
    // Configuração para lidar com exceções não capturadas
    Cypress.on('uncaught:exception', (err, runnable) => {
      return false
    })
  })

  it('Incluir produtos no carrinho', () => {
//    cy.visit('www.vr.com.br')
//    cy.contains('Compre online').click()
    cy.visit('https://loja.vr.com.br/')

    //fechar os popups
    cy.get('.close-button').click()

    //selecionar cartões vr
    cy.get('#btn-selecionar-modalidade-avulso').click()

    //Gerar um numero randomico para adicionar itens
    const qtde_produtos = numero_aleatorio(0, 20);
    
    for (let i = 0; i < qtde_produtos; i++) {
        cy.get(':nth-child(4) > :nth-child(2) > .input-styled__input-holder > .plus-button').click()
    }

    //Adicionar valor randomico para os produtos selecionados
    const valor_produtos = numero_aleatorio(0, 90000);
    
    cy.get('#produto-auto-valor').type(valor_produtos)

    //Adicionar no carrinho
    cy.get('#btn-adicionar-carrinho-auto').click()

    //Acessar carrinho
    cy.get('#btn-meu-carrinho > .fa-light').click()
    
    //Validar o valor dos produtos do carrinho

    //Incluindo a virgula no valor aleatorio que incluimos no produto:
    const valor_produto_decimal = (parseFloat(valor_produtos) / 100).toFixed(2)
    //Substituindo o ponto por virgula no numero decimal
    const valor_produto_formatado = valor_produto_decimal.replace('.', ',');

    cy.get('.product-information__value > :nth-child(2)').invoke('text').then((texto_valor_produtos) => {
    // Verifique se o texto do elemento contém o texto desejado usando expect()
      expect(texto_valor_produtos).to.include(valor_produto_formatado);
    });

    //Validar a quantidade de itens adicionado ao carrinho
    cy.get('.product-information__amount').invoke('text').then((texto_qtde_produto) => {
      // Verifique se o texto do elemento contém o texto desejado usando expect()
        expect(texto_qtde_produto).to.include(qtde_produtos);
      });
  })
})

function numero_aleatorio(vlr_min, vlr_max) {
  return Math.floor(Math.random() * (vlr_max - vlr_min)) + vlr_min;
}
