#autor: MTSilva
#data: 6/7/25
#language: pt

Feature: Busca de profissional de saúde: buscar profissional → contatar profissional

 @CT-001 @fluxocompleto @smoketest  
 Cenário: Buscar e contatar profissional com sucesso
 # Buscar profissional  
    Dado que o usuário acessa a tela de buscar profissional no celular
    Quando preenche os campos de búsqueda com a especialidade e a cidade
    E toca no botão "Buscar"
    Então o sistema lista profissionais disponíveis  
     
  #contatar profissional
    Quando o usuário seleciona o profissional da lista de profissionais disponíveis
    E E toca no botão "Contatar"
    Então o sistema habilita a opcão de contato
 
 @CT-002 @buscarprofissional  @unittest 
 Cenário: Busca e seleção de profissional
  Dado que o usuário acessa a tela de buscar profissional no celular
  E acessa os campos de búsqueda
  Quando aplica os filtros:
    | Campo          | Valor           |
    | Especialidade  | "Psicólogo"     |
    | Localização    | "São Paulo"     |
  E toca no botão "Buscar"
  Então o sistema exibe uma lista de profissionais
    | Campo          | Valor           |
    | Nome          | "Dra. Ana Silva"       |

  @CT-003 @selecionarprofissional   @unittest
  Dado que o usuário acessa a tela de buscar profissional no celular
  Quando seleciona o profissional "Dra. Ana Silva"
  Então o sistema:
    - Exibe o perfil completo do profissional seguindo as regras:
     | Campo          | Valor           |
     | Dados do profissional    | " é graduada em Psicologia e mestre pela Universidade de São Paulo. Formação em psicanálise pelo Instituto Vox e Centro ..."               |
     | Palavras Clave| "Ansiedade, Depressão ,Traumas"|
     | Tipo de atendimento | "Atendimento presencial, Atendimento on line"|
  - Habilita o botão "Contatar Profissional"
  
  @CT-004 @contatarprofissionalbemsucedido @unittest @happy_path
  Cenário: Fazer contato com profissional bem sucedido con dados válidos
  Dado que o usuário acessa a tela de buscar profissional no celular
  Quando  toca no botão "Contatar Profissional" do profissional selecionado
  Então o sistema abre o formulario seguindo as regras:
      | Campo                 | Valor           |
      | Como você gostaria de fazer a consulta       | "Videochamada ou Presencial"      |
      | Nome e sobrenome  | "Maria Silva"      |
      | E-mail            | "maria@gmail.com"  |
      | Telefone          | "554891194127"     |
      | Mensagem         | " Olá, gostaria de agendar uma consulta" |
   E sistema valida os dados e habilita o botão "Enviar"
   Quando o usuário toca no botão "Enviar" habilitado
   Então o sistema:
    - Envia a mensagem para o profissional 
    - Exibe a mensagem "Contato realizado com sucesso!"
    - Redireciona para a tela de Proffisionais

   @CT-005 @contatosemdados @unittest
   Cenário: Cadastro com campos obrigatórios em branco
   Dado que o usuário acessa ao formulario de contato
   Quando deixa todos ou algum campo editável vazio  
   Então o sistema mantém o botão "Enviar" desativado   

   @checkdesmarcados @unittest
   Cenário: Cadastro com check de consulta (Videochamada ou Presencial) sem marcar
   Dado que o usuário acessa ao formulario de contato
   Quando deixa o check  "Como você gostaria de fazer a consulta"
   Então o sistema mantém o botão "Enviar" desativado  

   @CT-006 @emailinvalido
   Cenário: Cadastro com e-mail inválido  
   Dado que o usuário acessa acessa ao formulario de contato
   Quando preenche:  
      | Campo               | Valor                |  
      | Telefone            | "11111"      |  
   E toca no botão "Enviar"  
   Então o sistema exibe a mensagen (vermelho) embaixo:  
      - "Insira um telefone válido"     
   E destaiva o botão "Enviar"   

   




