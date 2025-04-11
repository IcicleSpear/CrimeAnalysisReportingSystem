CREATE DATABASE CARS_DB;
USE CARS_DB;

CREATE TABLE LawEnforcementAgencies (
    AgencyID INT PRIMARY KEY AUTO_INCREMENT,
    AgencyName VARCHAR(100) NOT NULL,
    Jurisdiction VARCHAR(100),
    ContactInfo VARCHAR(150)
);

CREATE TABLE Officers (
    OfficerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BadgeNumber VARCHAR(30),
    `Rank` VARCHAR(50),
    ContactInfo VARCHAR(150),
    AgencyID INT,
    FOREIGN KEY (AgencyID) REFERENCES LawEnforcementAgencies(AgencyID)
);

CREATE TABLE Victims (
    VictimID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactInfo VARCHAR(150)
);

CREATE TABLE Suspects (
    SuspectID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactInfo VARCHAR(150)
);
CREATE TABLE Officers (
    OfficerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BadgeNumber VARCHAR(30),
    `Rank` VARCHAR(50), -- or rename to OfficerRank
    ContactInfo VARCHAR(150),
    AgencyID INT,
    FOREIGN KEY (AgencyID) REFERENCES LawEnforcementAgencies(AgencyID)
);

CREATE TABLE Incidents (
    IncidentID INT PRIMARY KEY AUTO_INCREMENT,
    IncidentType VARCHAR(50),
    IncidentDate DATE,
    Location VARCHAR(150), -- We'll store Lat/Long as a string like "12.9716,77.5946"
    Description TEXT,
    Status VARCHAR(30),
    VictimID INT,
    SuspectID INT,
    OfficerID INT,
    FOREIGN KEY (VictimID) REFERENCES Victims(VictimID),
    FOREIGN KEY (SuspectID) REFERENCES Suspects(SuspectID),
    FOREIGN KEY (OfficerID) REFERENCES Officers(OfficerID)
);

CREATE TABLE Evidence (
    EvidenceID INT PRIMARY KEY AUTO_INCREMENT,
    Description TEXT,
    LocationFound VARCHAR(100),
    IncidentID INT,
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID)
);

CREATE TABLE Reports (
    ReportID INT PRIMARY KEY AUTO_INCREMENT,
    IncidentID INT,
    ReportingOfficer INT,
    ReportDate DATE,
    ReportDetails TEXT,
    Status VARCHAR(30),
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID),
    FOREIGN KEY (ReportingOfficer) REFERENCES Officers(OfficerID)
);

INSERT INTO LawEnforcementAgencies (AgencyName, Jurisdiction, ContactInfo) VALUES
('Chennai City Police', 'Chennai', '044-1000001'),
('Cyber Crime Unit', 'Kanchipuram', '044-1000002'),
('Tamil Nadu State Police', 'Tamil Nadu', '044-1000003'),
('Economic Offences Wing', 'Madurai', '044-1000004');

INSERT INTO Officers (FirstName, LastName, BadgeNumber, `Rank`, ContactInfo, AgencyID) VALUES
('Arun', 'Nair', 'TN1001', 'Inspector', 'arun.nair@police.in', 1),
('Deepa', 'Menon', 'TN1002', 'Sub-Inspector', 'deepa.menon@cybercrime.in', 2),
('Karthik', 'Rao', 'TN1003', 'DSP', 'karthik.rao@tnpolice.in', 3),
('Meena', 'Iyer', 'TN1004', 'Inspector', 'meena.iyer@eow.in', 4);

INSERT INTO Incidents (IncidentType, IncidentDate, Location, Description, Status, VictimID, SuspectID, OfficerID) VALUES
('Robbery', '2025-03-10', '13.0601,80.2502', 'Phone and wallet stolen near beach', 'Under Investigation', 3, 3, 1),
('Theft', '2025-04-01', '13.0800,80.2700', 'Laptop stolen from car', 'Open', 4, 4, 2),
('Assault', '2025-04-03', '13.0700,80.2500', 'Fight during traffic altercation', 'Under Investigation', 5, 5, 1),
('Cybercrime', '2025-04-05', '13.0650,80.2700', 'Instagram account hacked', 'Open', 6, 6, 2),
('Fraud', '2025-04-07', '13.0720,80.2400', 'Credit card fraud reported by victim', 'Closed', 7, 7, 1);

SELECT IncidentID, Description FROM Incidents;
select * from incidents;


INSERT INTO Evidence (Description, LocationFound, IncidentID) VALUES
('Footprint near the scene', 'Marina Beach', 1),
('Broken car window glass', 'Parking lot', 1),
('Blood stains on shirt', 'Roadside', 2),
('Login logs from ISP', 'ISP Records', 2),
('Bank transaction logs', 'Axis Bank Server', 4);


SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE Reports;
TRUNCATE TABLE Evidence;
TRUNCATE TABLE Incidents;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO Reports (IncidentID, ReportingOfficer, ReportDate, ReportDetails, Status) VALUES
(1, 1, '2025-03-11', 'Robbery reported by victim. Suspect fled the scene.', 'Draft'),
(2, 2, '2025-04-02', 'Laptop theft reported. CCTV footage being reviewed.', 'Draft'),
(3, 1, '2025-04-04', 'Assault incident investigated. Medical report pending.', 'Draft'),
(4, 2, '2025-04-06', 'Cybercrime complaint filed. IP traced.', 'Draft'),
(5, 1, '2025-04-08', 'Fraud confirmed. Case closed after bank verification.', 'Finalized');

select * from victims;
select * from reports;
select * from evidence;
select * from incidents;

UPDATE Incidents
SET location = '13.0827,80.2707'
WHERE incidentId = 6;



ALTER TABLE Incidents
MODIFY status VARCHAR(50)
CHECK (status IN ('Open', 'Closed', 'Under Investigation'));








