#autor: MTSilva
#data: 6/7/25
#language: pt

Feature: Busca de profissional de saúde: buscar profissional → contatar profissional

 @fluxocompleto @smoketest  
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
 
 @buscarprofissional  @unittest
 Cenário: Busca e seleção de profissional
  Dado que o usuário está logado no aplicativo no celular
  E acessa os campos de búsqueda
  Quando aplica os filtros:
    | Campo          | Valor           |
    | Especialidade  | "Psicólogo"     |
    | Localização    | "São Paulo"     |
  E toca no botão "Buscar"
  Então o sistema exibe uma lista de profissionais
    | Campo          | Valor           |
    | Nome          | "Dra. Ana Silva"       |
    
  Quando seleciona o profissional "Dra. Ana Silva"
  Então o sistema:
    - Habilita o botão "Contatar Profissional"
    - Exibe o perfil completo do profissional seguindo as regras:
     | Campo          | Valor           |
     | Dados do profissional    | " é graduada em Psicologia e mestre pela Universidade de São Paulo. Formação em psicanálise pelo Instituto Vox e Centro ..."               |
     | Palavras Clave| "Ansiedade, Depressão ,Traumas"|
     | Tipo de atendimento | "Atendimento presencial, Atendimento on line"|
  
  
  @contatarprofissional  @unittest
  Cenário: Fazer contato com profissional
    Quando seleciono o profissional "Dra. Ana Silva"
    E E toca no botão "Contatar Profissional"
    Então o sistema abre o fromulario seguindo as regras:
      | Opção          | Disponibilidade |
      | Mensagem       | Disponível      |
      | Vídeo-chamada  | Disponível      |
      | Agendamento    | Disponível      |
    Quando o usuario seleciona "Agendamento"
    Então o sistema redireciona para o chat
    E exibe a mensagem : "Olá, gostaria de marcar uma consulta"

