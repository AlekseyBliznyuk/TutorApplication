const cds = require('@sap/cds');
module.exports = cds.service.impl(async function () {
  // auto-bind handlers in handlers.js
  this.on('*', require('./handlers'));
});
