const cds = require('@sap/cds');

module.exports = function () {
  const { Students, Payments } = cds.entities('com.company.studentlessons');

  // Function implementation
  this.on('getStudentBalance', async (req) => {
    const { studentID } = req.data;
    if (!studentID) return 0.00;
    const tx = cds.tx(req);
    const res = await tx.run(SELECT.from(Payments).columns('sum(Amount) as total').where({ Student_ID: studentID, Status: 'Paid' }));
    const total = (res && res[0] && res[0].TOTAL) ? res[0].TOTAL : 0.00;
    return total;
  });

  // Action: refund payment
  this.on('refundPayment', async (req) => {
    const { paymentID } = req.data;
    if (!paymentID) return false;
    const tx = cds.tx(req);
    // mark as Refunded
    await tx.update(Payments).set({ Status: 'Refunded' }).where({ ID: paymentID });
    return true;
  });

  // Example: before CREATE Payments -> enforce business rule and set PaidAt
  this.before('CREATE', 'Payments', async (req) => {
    const data = req.data;
    if (!data.PaidAt) data.PaidAt = new Date().toISOString();
    if (!data.Status) data.Status = 'Paid';
    // verify amount > 0
    if (!(data.Amount > 0)) req.error(400, 'Amount must be positive');
  });

  // Example: draft handling & custom filter can be implemented in UI/service in annotations; CAP draft requires cds-dk draft feature if used.
};
