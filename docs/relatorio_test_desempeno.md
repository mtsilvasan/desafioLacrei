1. Contexto
O objetivo inicial era avaliar o desempenho da funcionalidade de cadastro de usuários, utilizando JMeter para simular 30 usuários simultâneos e medir:

Tempo de resposta da operação de cadastro.

Estabilidade do sistema sob carga.

No entanto, durante os testes manuais, identificamos que o botão "Cadastrar" não está funcionando corretamente, impedindo a conclusão do fluxo. Além disso, foram realizados testes com o Lighthouse para avaliar a qualidade geral da página.

2. Resultados do Lighthouse
Os seguintes dados foram obtidos na análise do Lighthouse:

Métrica	                        Valor	Classificação
Performance	                    79	    Bom
Accessibility	                100	    Excelente
Best Practices	                92	    Excelente
SEO	                            90	    Excelente
First Contentful Paint (FCP)	0.8 s	Rápido
Largest Contentful Paint (LCP)	5.1 s	Aceitável*
Speed Index	                    4.0 s	Moderado
O LCP está dentro de limites aceitáveis, mas pode ser melhorado.

Interpretação dos Dados
Performance (79/100): A página tem um bom desempenho geral, mas há espaço para otimizações (ex.: reduzir LCP).
Acessibilidade e Boas Práticas (100 e 92): A aplicação segue padrões recomendados.

Tempos de Carregamento:

FCP (0.8s): O conteúdo inicial aparece rapidamente.
LCP (5.1s): O elemento principal (provavelmente o formulário) demora um pouco para carregar completamente.
Speed Index (4.0s): A página se torna interativa em um tempo razoável, mas não ideal.


Teste de carga com JMeter não faz sentido neste momento porque ao momento de fazer os testes manuais, o botão Cadastrar no está funcionando (ver docs/issues.issue1.md). Se o frontend não envia a requisição, o teste não vai avaliar o fluxo real.

