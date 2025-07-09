#autor: MTSilva
#data: 7/7/25
#language: pt

Feature: Formulários Desktop (resolução 1440x900)

  @CT-001 @desktop @hover
  Cenário: Estados hover
    Quando o usuario passa o mouse sobre os botões 
    Então a cor de fundo deve mudar 
    E o cursor deve virar "pointer"

  @CT-002 @desktop @validação
  Cenário: Validação de campos obrigatórios
    Quando o usuario deixa vazio o campo obrigatorio
    E clica no botao para finalizar a ação 
    Então deve aparecer a mensagem indicando "Campo obrigatório" abaixo do campo
    E a mensagem deve ter contraste ≥4.5:1 (WCAG)

   @CT-003 @desktop @foco
   Cenário: Foco em campos de formulário
    Quando o usuario toca nos campos do formulário
    Então o campo deve ganhar borda de cor com contraste de 2px

   @CT-004 @desktop @autofoco
   Cenário: Autofoco no primeiro campo do formulário
    Quando o usuario accesa ao formulario
    Então pode enxergar o primeiro campo que tem borda de cor com contraste de 2px

   @CT-005 @desktop @dropdowsperformance
   Cenário: Carregamento de dropdowns
    Quando o usuario clica no campos com dropdowns
    Então a lista deve carregar em ≤1 segundo
    E deve mostrar no máximo 5 itens visíveis simultaneamente

  