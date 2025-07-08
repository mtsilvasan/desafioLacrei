[Bug] Botão "Cadastrar" não responde após preenchimento válido

Arquivo de features: 'features/Cadastro_pessoa_usuária.feature'

Escenarios relacionados:
CT-001 Cenário: Fluxo integrado cadastro, login e busca de profissional  
CT-002 (Detalle de cadastro):   Cenário: Cadastro bem-sucedido com dados válidos

1. Descrição:

Comportamento Esperado: Ao preencher todos os campos corretamente e pressionar "Cadastrar", o sistema deve registrar o usuário e redirecionar para a tela de login.

Comportamento Atual: O botão não realiza nenhuma ação (não há redirecionamento nem mensagens)


2. Passos para Reprodução
Acessar a tela de cadastro (/cadastro).

Preencher todos os campos com dados válidos:

text
Nome: "Maria Silva"  
E-mail: "maria@exemplo.com"  
Senha: "Senha@123"  
Clicar no botão "Cadastrar".

Resultado Observado: Nenhuma ação é executada 

3. Impacto e Prioridade
Critério	        Detalhe
Impacto	          Bloqueia completamente o fluxo de cadastro de novos usuários
Prioridade	      Alta (P1) - Impede funcionalidade crítica
Sugestão	        Corrigir antes do próximo deploy em produção

4. Evidências
   Video : https://drive.google.com/file/d/1Gu7994sWqTpY46OEaK_-eREXkODXa-Oh/view?usp=sharing
   




