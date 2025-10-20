namespace studentlessons;

using { managed } from '@sap/cds/common';

// --- Aspects ---
@cds.persistence.embed
type Address : {
  street     : String(200);
  city       : String(100);
  postalCode : String(20);
  country    : String(100);
}

// --- Entities ---
entity Students : managed {
  key ID        : UUID;
  FirstName     : String(100);
  LastName      : String(100);
  Email         : String(254);
  Phone         : String(32);
  Address       : Address;
  Status        : String(20);
  toPayments    : Composition of many Payments on toPayments.Student = $self;
}

entity Teachers : managed {
  key ID        : UUID;
  Name          : String(200);
  Email         : String(254);
}

entity Courses : managed {
  key ID        : UUID;
  Title         : String(200);
  Description   : String(1000);
  DurationMin   : Integer;
  PricePerLesson: Decimal(9,2);
}

entity Lessons : managed {
  key ID        : UUID;
  Date          : DateTime;
  Course        : Association to Courses;
  Teacher       : Association to Teachers;
  Topic         : String(500);
  toPayments    : Composition of many Payments on toPayments.Lesson = $self;
}

entity Payments : managed {
  key ID        : UUID;
  Student       : Association to Students;
  Lesson        : Association to Lessons;
  PaidAt        : DateTime;
  Amount        : Decimal(9,2);
  PaymentMethod : String(50);
  Status        : String(20);
}
