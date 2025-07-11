Cypress.on('uncaught:exception', (err, runnable) => {
    // Lista de errores conocidos que no deben fallar las pruebas
    const expectedErrors = [
      "Cannot read properties of undefined (reading 'data')",
      "Cannot read property 'data' of undefined",
      "data is undefined"
    ];
    
    if (expectedErrors.some(msg => err.message.includes(msg))) {
      console.log('Error de aplicación manejado:', err.message);
      // Evita que Cypress falle la prueba
      return false;
    }
    // Para otros errores, permite que Cypress falle la prueba
    return true;
  });