#autor: MTSilva
#data: 6/7/25
#language: pt

Feature: Busca de profissional de saúde: buscar profissional → contatar profissional

 @fluxocompleto   
 Cenário: Buscar e contrar profissional com sucesso
 # Buscar profissional  
    Quando o usuário navega para "Buscar Profissional"  
    E filtra seguindo as regras:
      | Campo                 | Valor               |
      | Especialidade         | "Psicologo"         |  
    Então o sistema lista profissionais disponíveis  
     E E toca no botão "Buscar"
    Então o sistema exibe uma lista de profissionais disponíveis
    E posso seguindo as regras:
      | Campo         | Valor               |
      | Nome          | "Dra. Ana Silva"  |
      | Especialidade | "Psicologia clínica" |
      | Cidade        | "São Paulo" |
    E permite agendar uma consulta  
  #contatar profissional
    Quando seleciono o profissional "Dra. Ana Silva"
    E E toca no botão "Agendar"
    Então o sistema abre as opções de contato:
      | Opção          | Disponibilidade |
      | Mensagem       | Disponível      |
      | Vídeo-chamada  | Disponível      |
      | Agendamento    | Disponível      |
    Quando seleciono "Mensagem"
    Então o sistema redireciona para o chat
    E exibe a mensagem padrão: "Olá, gostaria de marcar uma consulta"

