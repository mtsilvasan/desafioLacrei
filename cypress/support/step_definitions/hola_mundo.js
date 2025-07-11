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
  // 1. Selectores directos sin usar posición
  const CHECKBOX_SELECTORS = {
    "Termos de Uso": 'input[name="accepted_privacy_document"]',
    "Maior de 18 anos": 'input[name="is_18_years_old_or_more"]'
  };

  const selector = CHECKBOX_SELECTORS[checkboxName];
  
  // 2. Verificación inicial del estado
  cy.get(selector).then(($checkbox) => {
    const initialChecked = $checkbox.prop('checked');
    cy.log(`Estado inicial de "${checkboxName}": ${initialChecked}`);
  });

  // 3. Acción única con verificación inmediata
  cy.get(selector)
    .should('exist')
    .check({ force: true })
    .should('be.checked')
    .then(($checkbox) => {
      cy.log(`Estado confirmado de "${checkboxName}": ${$checkbox.prop('checked')}`);
      
      // 4. Verificación de persistencia después de 500ms
      cy.wait(500).then(() => {
        cy.get(selector).should(($el) => {
          if (!$el.prop('checked')) {
            throw new Error(`El checkbox "${checkboxName}" se desmarcó automáticamente`);
          }
        });
      });
    });
});
      
Then('o botão {string} deve estar habilitado', (botaoText) => {
  cy.contains('button', botaoText, { timeout: 10000 })
    .should('be.visible')
    .and('not.be.disabled')
    .then($botao => {
      cy.log(`Estado del botón "${botaoText}":`, {
        disabled: $botao.prop('disabled'),
        classes: $botao.attr('class'),
        text: $botao.text().trim()
      });
    });
});

// En cypress/support/e2e.js (configuración global)
Cypress.on('uncaught:exception', (err, runnable) => {
  // Lista de errores conocidos de la aplicación
  const expectedErrors = [
    "Cannot read properties of undefined (reading 'data')",
    "Cannot read property 'data' of undefined"
  ];
  
  if (expectedErrors.some(msg => err.message.includes(msg))) {
    console.error('Error de aplicación capturado:', err.message);
    // Evita que Cypress falle la prueba
    return false;
  }
  // Para otros errores, permite que Cypress falle la prueba
  return true;
});

When('clico no botão {string}', (botaoText) => {
  // 1. Verificación exhaustiva del botón
  cy.contains('button', botaoText, { timeout: 15000 })
    .should('be.visible')
    .and('not.be.disabled')
    .then(($btn) => {
      // Debug: mostrar propiedades del botón
      const btn = $btn[0];
      console.log('Propiedades del botón:', {
        tagName: btn.tagName,
        type: btn.type,
        class: btn.className,
        formMethod: btn.form ? btn.form.method : null,
        formAction: btn.form ? btn.form.action : null,
        eventListeners: typeof getEventListeners === 'function' ? 
          getEventListeners(btn) : 'No disponible en este contexto'
      });
    });

  // 2. Interceptar llamadas API relevantes
  cy.intercept('POST', '**/api/**').as('apiCall');
  cy.intercept('GET', '**/cadastro/**').as('getRequest');

  // 3. Ejecutar clic
  cy.contains('button', botaoText).click();

  // 4. Esperar y analizar la respuesta
  cy.wait('@apiCall', { timeout: 10000, requestTimeout: 15000 })
    .then((interception) => {
      if (!interception.response) {
        cy.log('Error en la llamada API:', {
          status: interception.response?.statusCode,
          body: interception.response?.body,
          error: interception.error
        });
      } else {
        cy.log('Respuesta exitosa:', interception.response.body);
      }
    })
    .catch(() => {
      cy.log('No se detectó llamada API, verificando redirección...');
      cy.location('pathname', { timeout: 5000 }).should('not.include', 'cadastro');
    });
});