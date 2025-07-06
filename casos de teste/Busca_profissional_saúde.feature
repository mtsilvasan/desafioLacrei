#autor: MTSilva
#data: 6/7/25
#language: pt

Feature: Busca de profissional de saúde: buscar profissional → contatar profissional

 @fluxocompleto @smoketest  
 Cenário: Buscar e contatar profissional com sucesso
 # Buscar profissional  
    Dado que o usuário acessa a tela de buscar profissional no celular
    Quando preenche o campo de búsqueda com a especialidade 
    E toca no botão Buscar
    Então o sistema lista profissionais disponíveis  
     
  #contatar profissional
    Quando o usuário seleciona o profissional da lista de profissionais disponíveis
    E E toca no botão "Agendar"
    Então o sistema abre o fromulario com os campos para fazer o agendamento
    Quando o usuário preenche os campos para agendar
    E E toca no botão "Agendar"
    Então o sistema cria o agendamento e envia mail com os dados de agendamento
    
    

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
    E posso seleccionar na lista de profissionais disponíveis seguindo as regras:
      | Campo         | Valor               |
      | Nome          | "Dra. Ana Silva"  |
      | Especialidade | "Psicologia clínica" |
      | Cidade        | "São Paulo" |
    E permite agendar uma consulta  
  #contatar profissional
    Quando seleciono o profissional "Dra. Ana Silva"
    E E toca no botão "Agendar"
    Então o sistema abre o fromulario seguindo as regras:
      | Opção          | Disponibilidade |
      | Mensagem       | Disponível      |
      | Vídeo-chamada  | Disponível      |
      | Agendamento    | Disponível      |
    Quando seleciono "Mensagem"
    Então o sistema redireciona para o chat
    E exibe a mensagem padrão: "Olá, gostaria de marcar uma consulta"

