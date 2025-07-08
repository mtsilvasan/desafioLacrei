# desafioQALacrei
Repositorio creado para el desafio de QA de LAcrei
------------------------------------------
### 1️⃣ Testes Funcionais (Versão Mobile)**
------------------------------------------
Path: mtsilvasan/desafioLacrei/
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

### **Execução manual dos testes**
** Dispositivo:**  
Celular iPhone 13 de Apple OS iOS 18.5  
App Version: XXXXXX
Rede: VIVO
Operadora: VIVO 64.0
Idioma: Português 
Data: 7/7/2025  
Tester: @mtsilva

**Resumo dos Resultados**  
| CT-ID | Status | Tempo de Execução | Observações          |  
|-------|--------|-------------------|----------------------|  
| CT-01 | ✅     | 2m 15s            | -                    |  
| CT-02 | ❌     | 1m 40s            | [Bug #123](#)        |  

------------------------------------------
### **2️⃣ Documentação Completa no GitHub**
------------------------------------------


## Teste de Performance - Cadastro de Usuários

### Problema Identificado
O botão "Cadastrar" não dispara a ação esperada, invalidando testes de carga no estado atual.

### Decisão
**Testes com JMeter foram suspensos** até a correção do bug funcional, pois os resultados não seriam representativos.

### Próximos Passos
1. Correção do bug (ver [relatório técnico](./docs/RELATORIO_TECNICO.md)).
2. Execução dos testes de carga pós-correção.