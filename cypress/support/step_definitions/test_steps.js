import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor';

Given('que acesso a página {string} em {string}', (path, device) => {
  const viewports = {
    mobile: [375, 667],
    desktop: [1440, 900]
  };
  cy.viewport(...viewports[device]);
  cy.visit(path);
});

When('preencho os campos:', (dataTable) => {
  const selectors = {
    "Nome": "input[name='first_name']",
    "Sobrenome": "input[name='last_name']",
    "Email": "input[name='email']",
    "Confirme seu email": "input[name='email2']",
    "Senha": "input[name='password1']",
    "Confirme sua senha": "input[name='password2']"
  };
  dataTable.hashes().forEach((row) => {
    cy.get(selectors[row.Campo]).type(row.Valor);
  });
});

When('marco o checkbox {string}', (checkboxName) => {
  const checkboxes = {
    "Termos de Uso": "input[name='accepted_privacy_document']",
    "Maior de 18 anos": "input[name='is_18_years_old_or_more']"
  };
  cy.get(checkboxes[checkboxName]).check();
});

Then('o botão {string} deve estar habilitado', (botaoText) => {
  cy.contains('button', botaoText).should('be.enabled');
});

When('clico no botão {string}', (botaoText) => {
  cy.contains('button', botaoText).click();
});

Then('sou redirecionado para {string}', (path) => {
  cy.location('pathname').should('eq', path); // Mejor práctica para rutas
});

Then('vejo a mensagem {string}', (mensagem) => {
  cy.contains(mensagem, { timeout: 10000 })
    .should('be.visible');
});