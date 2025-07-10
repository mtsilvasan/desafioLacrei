Feature: Registro de Paciente
  Scenario: Registro con datos válidos
    Given abro la página de registro
    When preencho os campos:
      | Campo               | Valor             |
      | Nome                | Maria             |
      | Sobrenome           | Silva             |
      | Email               | maria@gmail.com   |
      | Confirme seu email  | maria@gmail.com   |
      | Senha               | Senha123!         |
      | Confirme sua senha  | Senha123!         |
    When marco o checkbox "Termos de Uso"
    When marco o checkbox "Maior de 18 anos"
    Then o botão "Cadastrar" deve estar habilitado
    When clico no botão "Cadastrar"
    Then vejo a mensagem "Cadastro realizado com sucesso"