[Bug] E-mail e confirmação de e-mail são iguais e a mensagem e "Os e-mails não correspondem, digite novamente."

Arquivo de features: 'features/Cadastro_pessoa_usuária.feature'

Escenarios relacionados:
Cenário CT-010: Cadastro com atualização de confirmação de e-mail e atualização de confirmação de senha 

1. Descrição:

Comportamento Esperado: Ao preencher todos os campos corretamente e pressionar "Cadastrar", o sistema deve registrar o usuário e redirecionar para a tela de login.

Comportamento Atual: O botão não realiza nenhuma ação (não há redirecionamento nem mensagens), mas é possivel mudar os dados. Quado mudo a confirmaçao da senha e depois a senha ficando ambas iguais, a mensagem "Os e-mails não correspondem, digite novamente." é exibida

2. Passos para Reprodução
- Acessar ao site https://paciente-staging.lacreisaude.com.br/
- Tocar no botão "Criar Conta"
- Preencher todos os campos com dados válidos
- Marcar os check de "Li e concordo" e "Theno mais de 18 anos"
- Tocar no botão "Cadastrar"
- Mudar a confirmação de senha
- Mudar a senha com o mismo valor da confirmação da senha

3. Impacto e Prioridade
Critério	        Detalhe
Impacto	        Não faz validação consistemte
Prioridade	     Media 
Sugestão	        Corrigir antes do próximo deploy em produção

4. Evidências
   Video : https://drive.google.com/file/d/1w05Ux7n9lRmmFIqFNOt2oxphxjrlTVkg/view?usp=sharing
