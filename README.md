
# desafioQALacrei
Repositorio creado para el desafio de QA de LAcrei
/docs -> Issues e melhorias
/features -> Casos de teste manuais e teste de performance
/features/desktop -> Testes de responsividade p/ desktop
/features/mobile -> Testes de responsividade p/ mobile

/cypress
   /e2e/features -> Casos de teste em Gherkin (.feature)
/support
   /step_definitions -> Steps do Cucumber
cypress.config.js # Configuração do Cypress

README.md # Este documento

### Ambientes Suportados

## Testes Manuais

**Navegadores Desktop:**
- Google Chrome (versão estável mais recente)
- Mozilla Firefox (versão estável mais recente)
- Microsoft Edge (versão estável mais recente)

**Sistemas Operacionais:**
- Windows 10 ou superior
- macOS Monterey ou superior
- Linux Ubuntu LTS

## Testes Automatizados

**Executados em:**
- **Navegadores suportados:**  
  - Chromium (headless/headed)
  - Chrome
  - Edge
  - Firefox (experimental)
- **Execução:**  
  - Local (UI interativa)
  - Headless (CI/CD)

### Checklist de Segurança

- Autenticação de usuários
- Validação de entradas
- Permissões de acesso
- Revisão de dependências  (npm audit)
- Logs sem dados sensíveis

### Processo de Rollback
- Scripts before e after nos steps do Cucumber para criar/limpar dados de teste
- Reset de banco/local storage se aplicável
- Contêineres descartáveis (Docker) podem ser utilizados

### Executar os Testes

##Testes Manuais
- Acesse a pasta features
- Siga o roteiro dos passo a passo 
- Execute os testes nos navegadores e sistemas operacionais especificados
- Registre resultados no template fornecido 
- Registre issies e melhorias se corresponde

##Testes Automatizados (Cypress + Cucumber)
Abrir Cypress em modo interativo:
   npx cypress open

Rodar todos os testes em modo headless:
   npx cypress run

Executar cenários com tag específica:
   npx cypress run --env TAGS='@login'

---------------------------------------------------
# ** Execução de testes manuais (Versão Mobile)**
---------------------------------------------------
Casos de teste:
- Criação de casos de teste em linguagem **Gherkin** para os seguintes fluxos:
    - Cadastro da pessoa usuária: cadastro → pós-cadastro → buscar profissional -> A parte de busca de professional está feita de manera generica pois não consegui cadastrar usuario
    - Busca de profissional de saúde: buscar profissional → contatar profissional -> A parte de busca de professional está feita de manera generica pois não consegui cadastrar usuario, então não tennho acesso à parte dos profissionais
    - Edição de perfil: inserir e atualizar informações ->  A parte de edição de perfil está feita de manera generica pois não consegui cadastrar usuario
    - Recuperação de senha: fluxo completo de esqueci minha senha -> A parte de recuperação de senha está feita de manera generica pois não consegui cadastrar usuario

### **Tags**
Tag	        Propósito	
@happy_path	Testes do fluxo ideal sem erros. Validam o caminho principal de cada funcionalidade.	
@unittest	Testes unitários/isolados de componentes específicos. Não requerem fluxo completo.	
@smoketest	Testes rápidos que verificam se as funcionalidades críticas estão operacionais.	

### **Ambiente de execução **
** Dispositivo:**  
Celular iPhone 13 de Apple OS iOS 18.5  
App Version: XXXXXX
Rede: VIVO
Operadora: VIVO 64.0
Idioma: Português 
Data: 7/7/2025  
Tester: @mtsilva

**Resumo dos Resultados**  
| .feature                       | Cant escenarios | Pass    | Fail   |  Não foi testado     |  
|--------------------------------|-----------------|------------------|----------------------|  
| Busca_profissional_saúde       | 6               | 0       | 0      | 6                    |  
| Cadastro-pessoa_usuária        | 16              | 12      | 3      | 1                    |  
| Edição_perfil                  | 2               | 0       | 0      | 2                    |
| Recuperação_senha              | 6               | 2       | 0      | 2                    |

**Issues e Melhorias** 
Issues econtradas: docs/issues
Melhorias propostas: docs/melhorias

----------------------------------------------------------
# **  Execução teste de Performance - Cadastro de Usuários
-----------------------------------------------------------

# Problema Identificado
O botão "Cadastrar" não dispara a ação esperada, invalidando testes de carga no estado atual.

# Decisão
Testes com JMeter foram suspensos até a correção do bug funcional, pois os resultados não seriam representativos.
resultados em /docs/performance (cadastro-report.html)
              /docs/relatorio_teste_desempeno.md 
--------------------------------------------
# ** Execução de Testes de Acessibilidade**
--------------------------------------------
resultados em /docs/relatorio_teste_accesibilidade.md
--------------------------------------------
# ** Execução de Testes de Responsividade**
--------------------------------------------
/features/desktop -> Testes de responsividade p/ desktop
/features/mobile -> Testes de responsividade p/ mobile
/docs/issues/issue3.md
             issue4.md
--------------------------------------------
# ** Execução de Testes de Automatizados **
--------------------------------------------
Ainda não foi finalizado, consegui fazer o teste basico de "Hola mundo", vou continuar trabalhando nele
update 11/7 consegui fazer o fluxo completo de cadasto! (hola_mundo.js e hola_mundo.feature)