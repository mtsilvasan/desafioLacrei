#autor: MTSilva
#data: 6/7/25
#language: pt

Feature: Cadastro da pessoa usuária: cadastro → pós-cadastro → buscar profissional

 @fluxocompleto   
  Cenário: Fluxo integrado cadastro, login e busca de profissional  
    # Cadastro  
    Dado que o usuário acessa a tela de cadastro no celular 
    Quando preenche o formulário de cadastro com dados válidos  
    E aceita os termos e políticas 
    E aceita os termos de uso e política de privacidade
    E marca o check Tenho 18 anos ou mais
    Então o sistema cria a conta e redireciona para a pós-cadastro (login) 

    # Pós-cadastro  
    Quando o usuário preenche as informações de login
    E toca no botão "Entrar"  
    Então o sistema exibe a tela inicial do app  

    # Buscar profissional  
    Quando o usuário navega para "Buscar Profissional"  
    E filtra seguindo as regras:
      | Campo                 | Valor               |
      | Especialidade         | "Psicologo"         |  
    Então o sistema lista profissionais disponíveis  
     E clico em "Buscar"
    Então o sistema exibe uma lista de profissionais disponíveis
    E posso ver informações como:
      | Nome          | "Dra. Ana Silva"  |
      | Especialidade | "Psicologia clínica" |
      | Cidade        | "São Paulo" |
    E permite agendar uma consulta  

  @cadastropessoausuária
  Cenário: Cadastro bem-sucedido com dados válidos, login e buscar profissional  
    Dado que o usuário acessa a tela de cadastro no celular 
    Quando Quando preenche os campos obrigatórios seguindo as regras:
      | Campo                 | Valor               |
      | Nome civil ou social  | "Maria"             |
      | Sobrenome             | "Silva"             |
      | E-mail                | "maria@gmail.com"   |
      | Confirme seu e-mail   | "maria@gmail.com    |
      | Senha                 | "Senha123!"         |
      | Confirme sua Senha    | "Senha123!"         |
    E toca no botão "Cadastrar"
    E aceita os termos de uso e política de privacidade
    E marca o check Tenho 18 anos ou mais
    E toca no botão "Cadastrar"
    Então o sistema envia o mail de cadastro bem-sucedido 
    E exibe a mensagem "Cadastro realizado com sucesso!" 
    E redireciona para a home logada 

     @loginbemsucedido
  Cenário: Cadastro bem-sucedido com dados válidos
    Dado que o usuário acessa a tela de cadastro no celular 
    Quando Quando preenche os campos obrigatórios seguindo as regras:
      | Campo                 | Valor               |
      | Nome civil ou social  | "Maria"             |
      | Sobrenome             | "Silva"             |
      | E-mail                | "maria@gmail.com"   |
      | Confirme seu e-mail   | "maria@gmail.com    |
      | Senha                 | "Senha123!"         |
      | Confirme sua Senha    | "Senha123!"         |
    E toca no botão "Cadastrar"
    E aceita os termos de uso e política de privacidade
    E marca o check Tenho 18 anos ou mais
    E toca no botão "Cadastrar"
    Então o sistema envia o mail de cadastro bem-sucedido 
    E exibe a mensagem "Cadastro realizado com sucesso!" 
    E redireciona para a home logada 

@logimsemdados
  Cenário: Cadastro com campos obrigatórios em branco
    Dado que o usuário acessa a tela de cadastro no celular 
    Quando deixa todos os campos vazios  
    E toca no botão "Cadastrar" 
    Então o sistema exibe mensagens de erro (vermelho) embaixo de cada campo: 
    | Campo               | Mensagem de erro               |  
    | Nome civil ou social | "O nome é obrigatório"      |  
    | Sobrenome            | "O sobrenome é obrigatório"      |  
    | E-mail               | "O e-mail é obrigatório"      |  
    | Confirme seu e-mail  | "O e-mail é obrigatório"      |  
    | Senha                | "A senha é obrigatório"      |  
    | Confirme sua senha   | "A senha é obrigatório"      |  
    E mantém o botão "Cadastrar" desativado   

@logimsemchecksmarcados
  Cenário: Cadastro com check sem marcar
    Dado que o usuário acessa a tela de cadastro no celular 
    Quando deixa todos os check sem marcar  
    E toca no botão "Cadastrar" 
    Então o sistema exibe mensagens de erro (vermelho) embaixo de cada campo: 
    | Campo               | Mensagem de erro               |  
    | Li e concordo com os termos de uso e política de privacidade  | "Você deve aceitar os termos"      |  
    | Tenho 18 anos ou mais  | "Você deve ter 18 anos ou mais"      |  
    E mantém o botão "Cadastrar" desativado       

@emailinvalido
  Cenário: Cadastro com e-mail inválido  
    Dado que o usuário acessa a tela de cadastro no celular
    Quando preenche:  
      | Campo               | Valor                |  
      | E-mail              | "email_invalido"      |  
    E toca no botão "Cadastrar"  
    Então o sistema exibe a mensagen (vermelho) embaixo:  
      - "Insira um e-mail válido"     
     E mantém o botão "Cadastrar" desativado     

  @emailnãocorresponde
  Cenário: Cadastro com confirmação de e-mail incorreta  
    Dado que o usuário acessa a tela de cadastro no celular
    Quando preenche:  
      | Campo               | Valor                |  
      | Confirme seu e-mail | "outro_email@gmail.com" |  
    E toca no botão "Cadastrar"  
    Então o sistema exibe as mensagens (vermelho) embaixo:  
      - "Os e-mails não correspondem, digite novamente"  
     E mantém o botão "Cadastrar" desativado     
 
 @senhafraca
  Cenário: Cadastro com senha fraca
    Dado que o usuário insere uma senha
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
      
@senhanãocorresponde
  Cenário: Cadastro com confirmação de e-mail incorreta  
    Dado que o usuário acessa a tela de cadastro no celular
    Quando preenche:  
      | Campo               | Valor                |  
      | Confirme seu e-mail | "outro_email@gmail.com" |  
    E toca no botão "Cadastrar"  
    Então o sistema exibe as mensagens (vermelho) embaixo:  
       "As sebhas não correspondem, digite novamente"   
     E mantém o botão "Cadastrar" desativado     
