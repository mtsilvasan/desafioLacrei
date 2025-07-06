#autor: MTSilva
#data: 6/7/25
#language: pt

Feature: Edição de perfil: inserir e atualizar informações

  @edperfil @happy_path @unittest
  Cenário: Atualização bem-sucedida de informações básicas
    Dado que o usuário está logado no aplicativo
    E acessa a seção "Meu Perfil"
    Quando seleciona "Editar Perfil"
    E atualiza os campos:
      | Campo               | Valor               |
      | Nome completo       | "Ana Paula Souza"   |
      | Telefone            | "(11) 98765-4321"   |
      | Cidade              | "Rio de Janeiro"    |
    E salva as alterações
    Então o sistema:
      - Atualiza os dados no banco de dados
      - Exibe a mensagem "Perfil atualizado com sucesso"
      - Reflete as mudanças na tela de perfil

  @perfil @validacao
  Cenário: Atualização com telefone inválido
    Dado que o usuário está na tela de edição
    Quando preenche:
      | Campo    | Valor          |
      | Telefone | "1198765"      | # Formato incompleto
    E tenta salvar
    Então o sistema:
      - Exibe "Telefone inválido"
      - Mantém o botão "Salvar" desabilitado
      - Não atualiza os dados
