# desafioQALacrei
Repositorio creado para el desafio de QA de LAcrei
------------------------------------------
### **Testes Funcionais (Versão Mobile)**
------------------------------------------
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

