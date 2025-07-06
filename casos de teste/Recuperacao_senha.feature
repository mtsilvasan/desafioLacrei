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
