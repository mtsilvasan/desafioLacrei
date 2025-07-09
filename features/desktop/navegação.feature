#autor: MTSilva
#data: 7/7/25
#language: pt

Feature: Navegação Desktop (resolução 1440x900)

  @CT-001 @desktop @layout
  Cenário: Alinhamento do grid
    Quando a página é carregada
    Então o container principal deve:
      | propriedade    | valor              |
      | max-width      | 1200px             |
      | margin         | 0 auto             |
   
  @CT-002 @desktop @performance
  Cenário: Carregamento de imagens
    Quando o usuario vai até as imágens
    Então as imagens devem redimensionar proporcionalmente
    E não devem exceder 100% da largura do container 