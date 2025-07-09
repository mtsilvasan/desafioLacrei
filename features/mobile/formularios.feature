#autor: MTSilva
#data: 7/7/25
#language: pt

Feature: Formulários Mobile (≤600px)

  @CT-001 @mobile @validação
  Cenário: Validação de campos obrigatórios
    Quando o usuario deixa vazio o campo obrigatorio
    E toca no botao para finalizar a ação 
    Então deve aparecer a mensagem indicando "Campo obrigatório" abaixo do campo
    E a mensagem deve ter contraste ≥4.5:1 (WCAG)

  @CT-002 @mobile @tecladovirtual
  Cenário: Teclado virtual nos campos editáveis do formulário
    Quando o usuario toca nos campos editáveis
    Então o teclado virtual deve abrir automaticamente
    E ficar embaixo do campo
   
   @CT-003 @mobile @usabilidade
   Cenário: Foco em campos de formulário
    Quando o usuario toca nos campos do formulário
    Então o campo deve ganhar borda de cor com contraste de 2px

   @CT-004 @mobile @autofoco
   Cenário: Autofoco no primeiro campo do formulário
    Quando o usuario accesa ao formulario
    Então pode enxergar o primeiro campo que tem borda de cor com contraste de 2px

  