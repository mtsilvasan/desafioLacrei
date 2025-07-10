@CT-001 @cadastrobemsucedido @automated
#autor: MTSilva
#data: 9/7/25
#language: pt
Feature: Cadastro de Pessoa Usuária

  Cenário: Cadastro bem-sucedido com dados válidos
    Dado que acesso a página "/cadastro" em "mobile"
    Quando preencho os campos:
      | Campo               | Valor             |
      | Nome                | Maria             |
      | Sobrenome           | Silva             |
      | Email               | maria@gmail.com   |
      | Confirme seu email  | maria@gmail.com   |
      | Senha               | Senha123!         |
      | Confirme sua senha  | Senha123!         |
    E marco o checkbox "Termos de Uso"
    E marco o checkbox "Maior de 18 anos"
    Então o botão "Cadastrar" deve estar habilitado
    
    Quando clico no botão "Cadastrar"
    Então sou redirecionado para "/login"
    E vejo a mensagem "Cadastro realizado com sucesso!"