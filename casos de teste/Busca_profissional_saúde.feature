#autor: MTSilva
#data: 6/7/25
#language: pt

Feature: Busca de profissional de saúde: buscar profissional → contatar profissional

 @fluxocompleto   
 Scenario: Buscar e contactar profissional com sucesso
    Dado que estou logado no aplicativo mobile
    E que acesso a seção "Buscar Profissional"
    Quando preencho os filtros com:
      | Especialidade | "Psicólogo"       |
      | Localização   | "São Paulo"       |
      | Tipo de Atendimento | "Online"    |
    E clico em "Buscar"
    Então o sistema exibe uma lista de profissionais disponíveis
    E posso ver informações como:
      | Nome          | "Dra. Ana Silva"  |
      | Especialidade | "Psicologia clínica" |
      | Avaliação     | "4.9 ★"          |
    Quando seleciono o profissional "Dra. Ana Silva"
    E clico em "Contatar"
    Então o sistema abre as opções de contato:
      | Opção          | Disponibilidade |
      | Mensagem       | Disponível      |
      | Vídeo-chamada  | Disponível      |
      | Agendamento    | Disponível      |
    Quando seleciono "Mensagem"
    Então o sistema redireciona para o chat
    E exibe a mensagem padrão: "Olá, gostaria de marcar uma consulta"

