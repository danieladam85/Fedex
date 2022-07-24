import { Given, When, Then } from "cypress-cucumber-preprocessor/steps";

const url = 'http://localhost:4200'
Given('I open the Star Wars search application', () => {
  cy.visit(url)
})

When('I click on the {string} radio button', (buttonName) => {
  if (buttonName == 'people') {
  cy.get('#people').click()
  }
  if (buttonName == 'planets') {
    cy.get('#planets').click()
  }
})

When('I type {string} in the searchfield', (searchTerm) => {
  cy.get('#query').type(searchTerm)
})

When('I click on the search button', () => {
  cy.get('.search-button').click()
})

When('I type enter in the searchfield', () => {
  cy.get('#query').type('{enter}')
})

When('I clear the searchfield', () => {
  cy.get('#query').clear()
})

Then('the results should contain {string}', (name) => {
      cy.get('.card .card-subtitle').should('contain', name)
})

Then('the results column names should be:', (dataTable) => {

  var propValue;
  dataTable.hashes().forEach(elem =>{
    for(var propName in elem) {
      propValue = elem[propName]
    } })
  dataTable.hashes().forEach(elem => {

    cy.get('app-character,app-planet').each(($el) => {cy.wrap($el).find('.row-name').contains(elem.rowName);})
    });
})

Then('the attributes for {string} should be:', (name, dataTable) => {

  var propValue;
  dataTable.hashes().forEach(elem =>{
    for(var propName in elem) {
      propValue = elem[propName]
    } })
  dataTable.hashes().forEach(elem => {
    cy.get('.card').contains(name).parent().find('.row-name').contains(elem.rowName).parent().find('.row-value').contains(elem.rowValue);
  });
})

Then('the results panel should display {string}', (Text) => {
  cy.get('.not-found').contains(Text)
})

Then('the results should contain more than one result', () => {
  cy.get('app-character,app-planet').its('length').should('be.gte', 1)
})

Then('the results panel should contain no results', () => {
  cy.get('app-character,app-planet').should('not.exist')
})