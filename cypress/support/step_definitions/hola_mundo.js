const { Given, Then } = require('@badeball/cypress-cucumber-preprocessor');

Given('abro la página de prueba', () => {
  cy.visit('https://example.cypress.io');
});

Then('veo {string}', (texto) => {
  cy.contains(texto).should('be.visible');
});