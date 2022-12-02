CREATE TABLE Country
(
  CountryCode INT NOT NULL,
  CountryName INT NOT NULL,
  CountryFlag INT NOT NULL,
  PRIMARY KEY (CountryCode),
  UNIQUE (CountryName),
  UNIQUE (CountryFlag)
);

CREATE TABLE RegistrationStatus
(
  RegistrationStatusId INT NOT NULL,
  RegistrationStatus INT NOT NULL,
  PRIMARY KEY (RegistrationStatusId)
);

CREATE TABLE Role
(
  RoleId INT NOT NULL,
  RoleName INT NOT NULL,
  PRIMARY KEY (RoleId)
);

CREATE TABLE Registration
(
  RegistrationId INT NOT NULL,
  RunnerId INT NOT NULL,
  RegistrationDateTime INT NOT NULL,
  RaceKitOptionId INT NOT NULL,
  RegistrationStatusId INT NOT NULL,
  Cost INT NOT NULL,
  CharityId INT NOT NULL,
  SponsorshipTarget INT NOT NULL,
  RegistrationStatusId INT NOT NULL,
  PRIMARY KEY (RegistrationId),
  FOREIGN KEY (RegistrationStatusId) REFERENCES RegistrationStatus(RegistrationStatusId)
);

CREATE TABLE Gender
(
  Gender INT NOT NULL,
  PRIMARY KEY (Gender)
);

CREATE TABLE Charity
(
  CharityId INT NOT NULL,
  CharityName INT NOT NULL,
  CharityDescription INT NOT NULL,
  CharityLogo INT NOT NULL,
  RegistrationId INT NOT NULL,
  PRIMARY KEY (CharityId),
  FOREIGN KEY (RegistrationId) REFERENCES Registration(RegistrationId)
);

CREATE TABLE RaceKitOption
(
  RaceKitOptionId INT NOT NULL,
  RaceKitOption INT NOT NULL,
  Cost INT NOT NULL,
  RegistrationId INT NOT NULL,
  PRIMARY KEY (RaceKitOptionId),
  FOREIGN KEY (RegistrationId) REFERENCES Registration(RegistrationId)
);

CREATE TABLE EventType
(
  EventTypeId INT NOT NULL,
  EventTypeName INT NOT NULL,
  PRIMARY KEY (EventTypeId)
);

CREATE TABLE User
(
  Email INT NOT NULL,
  Password INT NOT NULL,
  FirstName INT NOT NULL,
  LastName INT NOT NULL,
  RoleId INT NOT NULL,
  RoleId INT NOT NULL,
  PRIMARY KEY (Email),
  FOREIGN KEY (RoleId) REFERENCES Role(RoleId)
);

CREATE TABLE Sponsorship
(
  SponsorshipId INT NOT NULL,
  SponsorName INT NOT NULL,
  RegistrationId INT NOT NULL,
  Amount INT NOT NULL,
  RegistrationId INT NOT NULL,
  PRIMARY KEY (SponsorshipId),
  FOREIGN KEY (RegistrationId) REFERENCES Registration(RegistrationId)
);

CREATE TABLE RegistrationEvent
(
  RegistrationEventId INT NOT NULL,
  RegistrationId INT NOT NULL,
  EventId INT NOT NULL,
  BibNumber INT NOT NULL,
  RaceTime INT NOT NULL,
  RegistrationId INT NOT NULL,
  PRIMARY KEY (RegistrationEventId),
  FOREIGN KEY (RegistrationId) REFERENCES Registration(RegistrationId)
);

CREATE TABLE Volunteer
(
  VolunteerId INT NOT NULL,
  FirstName INT NOT NULL,
  LastName INT NOT NULL,
  CountryCode INT NOT NULL,
  Gender INT NOT NULL,
  CountryCode INT NOT NULL,
  Gender INT NOT NULL,
  PRIMARY KEY (VolunteerId),
  FOREIGN KEY (CountryCode) REFERENCES Country(CountryCode),
  FOREIGN KEY (Gender) REFERENCES Gender(Gender)
);

CREATE TABLE Runner
(
  RunnerId INT NOT NULL,
  Email INT NOT NULL,
  Gender INT NOT NULL,
  DateOfBirth INT NOT NULL,
  CountryCode INT NOT NULL,
  Email INT NOT NULL,
  Gender INT NOT NULL,
  CountryCode INT NOT NULL,
  RegistrationId INT NOT NULL,
  PRIMARY KEY (RunnerId),
  FOREIGN KEY (Email) REFERENCES User(Email),
  FOREIGN KEY (Gender) REFERENCES Gender(Gender),
  FOREIGN KEY (CountryCode) REFERENCES Country(CountryCode),
  FOREIGN KEY (RegistrationId) REFERENCES Registration(RegistrationId)
);

CREATE TABLE Event_
(
  EventId INT NOT NULL,
  EventName INT NOT NULL,
  MarathonId INT NOT NULL,
  EventTypeId INT NOT NULL,
  RegistrationEventId INT NOT NULL,
  PRIMARY KEY (EventId),
  FOREIGN KEY (EventTypeId) REFERENCES EventType(EventTypeId),
  FOREIGN KEY (RegistrationEventId) REFERENCES RegistrationEvent(RegistrationEventId)
);

CREATE TABLE Marathon
(
  MarathonId INT NOT NULL,
  MarathonName INT NOT NULL,
  CityName INT NOT NULL,
  CountryCode INT NOT NULL,
  YearHeld INT NOT NULL,
  CountryCode INT NOT NULL,
  EventId INT NOT NULL,
  PRIMARY KEY (MarathonId),
  FOREIGN KEY (CountryCode) REFERENCES Country(CountryCode),
  FOREIGN KEY (EventId) REFERENCES Event_(EventId)
);