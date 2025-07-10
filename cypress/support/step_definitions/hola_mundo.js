const { Given, When, Then } = require('@badeball/cypress-cucumber-preprocessor');

const BASE_URL = 'https://paciente-staging.lacreisaude.com.br';
const REGISTER_URL = BASE_URL + '/cadastro/';

// Implementación del nuevo step
Given('abro la página de registro', () => {
  cy.visit(REGISTER_URL);
  
  // Verificaciones adicionales para asegurar que la página cargó
  cy.url().should('include', '/cadastro');
  cy.get('form', { timeout: 10000 }).should('be.visible');
  
  // Debug: Verifica atributos del campo "Nome"
  cy.get('#first_name').then((input) => {
    console.log('Atributos del campo Nome:', {
      id: input.attr('id'),
      name: input.attr('name'),
      type: input.attr('type'),
      class: input.attr('class')
    });
  });
}); // <-- Se cerró correctamente el Given

When('preencho os campos:', (dataTable) => {
  // Mapeo específico usando el ID conocido
  const fieldSelectors = {
    "Nome": "#first_name", // Selector directo por ID
    "Sobrenome": "#last_name", // Usar solo un selector para evitar múltiples elementos
    "Email": "#email",
    "Confirme seu email": "#email2",
    "Senha": "#password1",
    "Confirme sua senha": "#password2"
  };

  dataTable.hashes().forEach((row) => {
    const campo = row.Campo;
    const valor = row.Valor;
    const selector = fieldSelectors[campo] || `input[name="${campo.toLowerCase().replace(/\s+/g, '_')}"]`;

    // Versión robusta con espera inteligente
    cy.get(selector, { timeout: 10000 })
      .should('be.visible')
      .clear({ force: true })
      .type(valor, { delay: 50, force: true })
      .should('have.value', valor); // Validación adicional
  });
});

const { When } = require('@badeball/cypress-cucumber-preprocessor');

When('marco o checkbox {string}', (checkboxName) => {
    // 1. Mapeo de selectores confirmados
    const CHECKBOX_SELECTORS = {
      "Termos de Uso": [
        'input[name="accepted_privacy_document"][data-gtm-form-interact-field-id="0"]',
        'input[name="accepted_privacy_document"]',
        '[data-gtm-form-interact-field-id="0"]'
      ],
      "Maior de 18 anos": [
        'input[name="is_18_years_old_or_more"][data-gtm-form-interact-field-id="1"]',
        'input[name="is_18_years_old_or_more"]',
        '[data-gtm-form-interact-field-id="1"]'
      ]
    };
  
    // 2. Eliminamos completamente la búsqueda por texto
    const selectors = CHECKBOX_SELECTORS[checkboxName];
    
    // 3. Función para intentar cada selector
    const trySelector = (selector) => {
      return cy.get('body').then(($body) => {
        const $el = $body.find(selector);
        if ($el.length) {
          cy.wrap($el).click({ force: true });
          return true;
        }
        return false;
      });
    };
  
    // 4. Intentamos cada selector secuencialmente
    cy.wrap(selectors).each((selector) => {
      cy.then(() => trySelector(selector)).then((success) => {
        if (success) {
          cy.log(`Checkbox encontrado con selector: ${selector}`);
          return false; // Detiene el each
        }
        return true; // Continúa al siguiente selector
      });
    });
  
    // 5. Validación final
    cy.get(selectors[0]).should('be.checked');
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

Then('veo el texto {string}', (texto) => {
  cy.contains(texto, { 
    timeout: 15000,
    matchCase: false
  }).should('be.visible');
});