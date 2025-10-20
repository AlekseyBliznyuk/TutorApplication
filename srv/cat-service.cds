using studentlessons from '../db/schema';

service CatalogService @(title: 'Student Lessons Service') {
    entity Students as projection on studentlessons.Students;
    entity Teachers as projection on studentlessons.Teachers;
    entity Courses as projection on studentlessons.Courses;
    entity Lessons as projection on studentlessons.Lessons;
    entity Payments as projection on studentlessons.Payments;

    function getStudentBalance(studentID : UUID) returns Decimal(9,2);
    action refundPayment(paymentID : UUID) returns Boolean;
}
