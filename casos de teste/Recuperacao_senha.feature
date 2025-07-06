#autor: MTSilva
#data: 6/7/25
#language: pt

Feature: Recuperação de senha: fluxo completo de esqueci minha senha

    @recuperacao @unittest @happy_path
    Cenário: Fluxo completo de recuperação de senha com e-mail válido
    Dado que o usuário acessa a tela "Esqueci minha senha"
    Quando preenche o campo "Email" com "maria@gmail.com"
    Então o sistema valida o email e habilita o botão "Enviar Link"

    Quando o usuario toca no botão "Enviar link"
    Então o sistema envia um e-mail com link de redefinição
    E exibe a mensagem "Verifique seu e-mail"

    Quando o usuário acessa o link no e-mail recebido
    E preenche os campos:
      | Campo               | Valor         |
      | Nova senha          | "NovaSenha123!" |
      | Confirmar nova senha| "NovaSenha123!" |
    E clica em "Redefinir senha"
    Então o sistema:
      - Atualiza a senha no banco de dados
      - Exibe "Senha redefinida com sucesso"
      - Redireciona para a tela de login

    @formatoemailinvalido @unittest
    Cenário: Recuperação de senha com e-mail inválido  
    Dado que o usuário acessa a tela "Esqueci minha senha"
    Quando preenche:  
      | Campo               | Valor                |  
      | E-mail              | "email_invalido"      |  
    Então Então o sistema mantém o botão "Cadastrar" desativado   

    @emailnaocadastrado @unittest
    Cenário: Recuperação de senha com e-mail inválido  
    Dado que o usuário acessa a tela "Esqueci minha senha"
    Quando preenche:  
      | Campo               | Valor                |  
      | E-mail              | "email_valido_não cadastrado"      |  
    E toca no botão "Enviar Link"  
    Então o sistema exibe a mensagen (vermelho) embaixo:  
      - "Algo deu errado, por favor, confira os dados inseridos e tente novamente."     
     E desativa o botão "Redefinir senha" 

    @senhafraca  @unittest
    Cenário: Redefinição com senha fraca
    Dado que o usuário acessa o link no e-mail recebido
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
    E desativa botão "Redefinir senha" 
      
  @senhanãocorresponde @unittest
  Cenário: Cadastro com confirmação de e-mail incorreta  
  Dado que o usuário acessa o link no e-mail recebido
  Quando preenche:  
      | Campo               | Valor                |  
      | Confirme seu e-mail | "outro_email@gmail.com" |  
  E toca no botão "Redefinir senha"  
  Então o sistema exibe as mensagens (vermelho) embaixo:  
       "As senhas não correspondem, digite novamente"   
  E destaiva o botão "Redefinir senha" 

 @linkexpirado @unittest
  Cenário: Link de recuperação expirado
    Dado que o usuário recebeu um link 
    Quando tenta redefinir a senha via link expirado
    Então o sistema bloqueia a ação
    E exibe "Link expirado. Solicite um novo"
    
