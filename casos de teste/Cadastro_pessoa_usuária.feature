etados#autor: MTSilva
#data: 6/7/25
#language: pt

Feature: Cadastro da pessoa usuária: cadastro → pós-cadastro → buscar profissional

 @fluxocompleto   @smoketest
  Cenário: Fluxo integrado cadastro, login e busca de profissional  
    # Cadastro  
    Dado que o usuário acessa a tela de cadastro no celular 
    Quando preenche o formulário de cadastro com dados válidos  
    E marca todos os check
    Então o sistema cria a conta e redireciona para a pós-cadastro (login) 

    # Pós-cadastro  
    Quando o usuário preenche as informações de login
    E toca no botão "Entrar"  
    Então o sistema exibe a tela inicial do app com as funcionalidades do sistema 

   # Buscar profissional  
    Quando o usuário acessa a tela de buscar profissional no celular
    E preenche o campo de búsqueda com a especialidade 
    E toca no botão Buscar
    Então o sistema lista profissionais disponíveis 

  @cadastrobemsucedido @unittest @happy_path
  Cenário: Cadastro bem-sucedido com dados válidos
    Dado que o usuário acessa a tela de cadastro no celular tocando no botão "Criar Conta"
    Quando Quando preenche os campos obrigatórios seguindo as regras:
      | Campo                 | Valor               |
      | Nome civil ou social  | "Maria"             |
      | Sobrenome             | "Silva"             |
      | E-mail                | "maria@gmail.com"   |
      | Confirme seu e-mail   | "maria@gmail.com    |
      | Senha                 | "Senha123!"         |
      | Confirme sua Senha    | "Senha123!"         |
    E aceita os termos de uso e política de privacidade
    E marca o check Tenho 18 anos ou mais
    Então o sistema valida os dados e habilita o botão "Cadastrar"
  
    Quando o usuário toca no botão "Cadastrar" habilitado
    Então o sistema:
    - Registra o usuário na base de dados
    - Envia o mail de cadastro bem-sucedido 
    - Exibe a mensagem "Cadastro realizado com sucesso!"
    - Redireciona para a tela de login

  @cadastrosemdados @unittest
  Cenário: Cadastro com campos obrigatórios em branco
    Dado que o usuário acessa a tela de cadastro no celular tocando no botão "Criar Conta"
    Quando deixa todos ou algum campo editável vazio  
    Então o sistema mantém o botão "Cadastrar" desativado   

  @cadastroemchecksmarcados @unittest
  Cenário: Cadastro com check sem marcar
    Dado que o usuário acessa a tela de cadastro no celular tocando no botão "Criar Conta"
    Quando deixa todos ou algum check sem marcar  
    Então o sistema mantém o botão "Cadastrar" desativado  
    
  @mudançadedados @unittest
  Cenário: Cadastro com campos obrigatórios eliminados
    Dado que o usuário acessa a tela de cadastro no celular tocando no botão "Criar Conta"
    Quando preenche os dados corretamente 
    Então o sistema valida os dados e habilita o botão "Cadastrar"

    Quando o usuario elimina o valor do campo editavel
    Então o sistema exibe mensagens de erro (vermelho) embaixo de cada campo eliminado: 
    | Campo               | Mensagem de erro               |  
    | Nome civil ou social | "O nome é obrigatório"      |  
    | Sobrenome            | "O sobrenome é obrigatório"      |  
    | E-mail               | "O e-mail é obrigatório"      |  
    | Confirme seu e-mail  | "O e-mail é obrigatório"      |  
    | Senha                | "A senha é obrigatório"      |  
    | Confirme sua senha   | "A senha é obrigatório"      |  
    E desativa o botão "Cadastrar"    

  @mudançacheck @unittest
  Cenário: Cadastro com check desmarcados
    Dado que o usuário acessa a tela de cadastro no celular tocando no botão "Criar Conta"
    Quando preenche os dados corretamente 
    Então o sistema valida os dados e habilita o botão "Cadastrar"
    
    Quando desmarca os check 
    Então o sistema exibe mensagens de erro (vermelho) embaixo de cada campo desmarcado: 
    | Campo               | Mensagem de erro               |  
    | Li e concordo com os termos de uso e política de privacidade  | "Você deve aceitar os termos"      |  
    | Tenho 18 anos ou mais  | "Você deve ter 18 anos ou mais"      |  
    E desativa o botão "Cadastrar"      

  @emailinvalido @unittest
  Cenário: Cadastro com e-mail inválido  
    Dado que o usuário acessa a tela de cadastro no celular tocando no botão "Criar Conta"
    Quando preenche:  
      | Campo               | Valor                |  
      | E-mail              | "email_invalido"      |  
    Então o sistema mantém o botão "Cadastrar" desativado 
    
   @emailinvalido @unittest
   Cenário: Cadastro com e-mail inválido depois de atualizar e-mail
    Dado que o usuário acessa a tela de cadastro no celular tocando no botão "Criar Conta"
    Quando preenche os dados corretamente 
    Então o sistema valida os dados e habilita o botão "Cadastrar"
    
    Dado que o usuário atualiza o valor do e-mail
    Quando preenche:  
      | Campo               | Valor                |  
      | E-mail              | "email_invalido"      |  
      | Confirme seu E-mail | "email_valido"      |  
    E toca no botão "Cadastrar"  
    Então o sistema exibe a mensagen (vermelho) embaixo:  
      - "Insira um e-mail válido"     
     E mantém o botão "Cadastrar" desativado 

  @emailnãocorresponde @unittest
  Cenário: Cadastro com confirmação de e-mail incorreta  
    Dado que o usuário acessa a tela de cadastro no celular tocando no botão "Criar Conta"
    Quando preenche:  
      | Campo               | Valor                |  
      | Confirme seu e-mail | "outro_email@gmail.com" |  
    Então o sistema mantém o botão "Cadastrar" desativado

   @emailnãocorresponde @unittest
   Cenário: Cadastro com atualização de confirmação de e-mail incorreta  
   Dado que o usuário acessa a tela de cadastro no celular tocando no botão "Criar Conta"
    Quando preenche os dados corretamente 
    Então o sistema valida os dados e habilita o botão "Cadastrar"
    
    Dado que o usuário atualiza o valor de "Confirme seu e-mail"
    Quando preenche:  
      | Campo               | Valor                |  
      | E-mail              | "email_valido"      |  
      | Confirme seu e-mail | "email_atualizado@gmail.com" |  
    E toca no botão "Cadastrar"  
    Então o sistema exibe as mensagens (vermelho) embaixo:  
      - "Os e-mails não correspondem, digite novamente"  
     E mantém o botão "Cadastrar" desativado     

  @emailnãocorresponde @unittest
  Cenário: Cadastro com atualização de confirmação de e-mail e atualização de confirmação de senha  
   Dado que o usuário acessa a tela de cadastro no celular tocando no botão "Criar Conta"
    Quando preenche os dados corretamente 
    Então o sistema valida os dados e habilita o botão "Cadastrar"
    
    Dado que o usuário atualiza o valor de "Confirme seu e-mail" e depois atualiza o valor do "E-mail"
    Quando preenche:  
      | Campo               | Valor                |  
      | E-mail              | "email_atualizado@gmail.com"      |  
      | Confirme seu e-mail | "email_atualizado@gmail.com" |  
    Então o sistema mantém o botão "Cadastrar" ativado     

  @senhafraca @unittest
  Cenário: Cadastro com senha fraca
    Dado que o usuário acessa a tela de cadastro no celular tocando no botão "Criar Conta"
    Quando preenche:
      | Campo              | Valor                |  
      | Senha              | "senha"               |  
    Quando o sistema valida a senha
    Então exibe o status de cada requisito:
      """
      ✖ 8 caracteres (inseridos: 5)
      ✖ Letra maiúscula (A-Z)
      ✔ Letra minúscula (a-z)
      ✖ Número (0-9)
      ✖ Caractere especial (!@#...)
      """
    E mantém o botão "Cadastrar" desativado   

  @visualização de senha
  Cenário: visulaização de senha inserida
  Quando preenche:
      | Campo              | Valor                |  
      | Senha              | "senha"   
  E toca no botão de "olho"
  Então o sistema exibe o valor da senha

  @visualização de confirmação de senha
  Cenário: visulaização de senha inserida
  Quando preenche:
      | Campo                          | Valor                |  
      | Confirme sua enha              | "senha"   
  E toca no botão de "olho"
  Então o sistema exibe o valor do campo Corfirme sua senha
  
  @senhanãocorresponde @unittest
  Cenário: Cadastro com confirmação senha incorreta  
    Dado que o usuário acessa a tela de cadastro no celular tocando no botão "Criar Conta"
    Quando preenche:  
      | Campo               | Valor                |  
      | Confirme sua senha | "outra_senha" |  
    E toca no botão "Cadastrar"  
    Então o sistema exibe as mensagens (vermelho) embaixo:  
       "As senhas não correspondem, digite novamente"   
     E mantém o botão "Cadastrar" desativado     

  @buscarprofissional  @unittest
  Cenário: Busca e seleção de profissional
  Dado que o usuário está logado no aplicativo no celular tocando no botão "Criar Conta"
  E acessa os campos de búsqueda
  Quando aplica os filtros:
    | Campo          | Valor           |
    | Especialidade  | "Psicólogo"     |
    | Localização    | "São Paulo"     |
  E toca no botão "Buscar"
  Então o sistema exibe uma lista de profissionais
    | Campo          | Valor           |
    | Nome          | "Dra. Ana Silva"       |
