#autor: MTSilva
#data: 8/7/25
#language: pt

@performance @load_test  
Feature: Testes de desempenho - Operações críticas  

  Cenário: Tempo de resposta no cadastro sob carga  
    Dado que simulo 30 usuários acessando simultaneamente  
    Quando executam o fluxo de cadastro completo  
    Então o tempo médio de resposta deve ser ≤ 2 segundos  
    E a taxa de erro deve ser ≤ 1%  

  Cenário: Estabilidade na busca de profissionais  
    Dado que simulo 50 requisições em 1 minuto  
    Quando buscam profissionais por especialidade  
    Então o sistema deve manter latência ≤ 1.5 segundos  