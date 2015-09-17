-- Football Competition Coordination SQL to create and populate tables

/* Drop Table statements are included for each table to ensure that 
when you create the tables no tables with the same name exist. */
DROP TABLE Team CASCADE CONSTRAINTS PURGE;
DROP TABLE Club CASCADE CONSTRAINTS PURGE;
DROP TABLE Competition CASCADE CONSTRAINTS PURGE;
DROP TABLE Referee CASCADE CONSTRAINTS PURGE;
DROP TABLE Manager CASCADE CONSTRAINTS PURGE;
DROP TABLE Matchs CASCADE CONSTRAINTS PURGE;
DROP TABLE Player CASCADE CONSTRAINTS PURGE;
DROP TABLE Sponsor CASCADE CONSTRAINTS PURGE;

/* Create table statements
Tables are created in 2 layers following a given order:
1st: Those with no foreign keys are created first
2nd: Tables depending only on these tables i.e. have foreign key relationships to 1st layer
3rd: Tables depending on 2nd layer or combination of 1st and 2nd layer
*/
-- Create table team - holds details of all teams in each club
CREATE TABLE Team
(
	TeamID               NUMBER(6) NOT NULL ,
	TeamName             VARCHAR2(30) NULL ,
	MName         	     VARCHAR2(20) NULL ,
	Mphone               VARCHAR2(20) NULL ,
	MAddress			 VARCHAR2(40) NULL ,
	Prize				 NUMBER(5,2) NULL,
CONSTRAINT Team_PK PRIMARY KEY (TeamID)
CONSTRAINT _Team_FK FOREIGN KEY (speciesCode) REFERENCES Species (speciesCode) ON DELETE SET NULL
);

-- Create table Club - holds details of all Clubs involved in the competitions
CREATE TABLE Club
(
	ClubID               NUMBER(6) NOT NULL ,
	speciesName          VARCHAR2(30) NULL ,
	speciesPrice         NUMBER(5,2) NULL , 
CONSTRAINT Club_PK PRIMARY KEY (ClubID),
CONSTRAINT _Club_FK FOREIGN KEY (speciesCode) REFERENCES Species (speciesCode) ON DELETE SET NULL
);

-- Create table Competition - holds details of all Competitions taking place
CREATE TABLE Competition
(
	CompetitionID        NUMBER(6) NOT NULL ,
	animalName           VARCHAR2(30) NULL ,
	dateShopPurchased    DATE NULL ,
	speciesCode          NUMBER(6) NULL ,
CONSTRAINT Comp_PK PRIMARY KEY (CompetitionID),
CONSTRAINT _Comp_FK FOREIGN KEY (speciesCode) REFERENCES Species (speciesCode) ON DELETE SET NULL
);

-- Create table Referee - holds data on all referees available
CREATE TABLE Referee
(
	RefereeID            NUMBER(6) NOT NULL ,
	animalID             NUMBER(6) NOT NULL ,
	saleDate             DATE NULL ,
CONSTRAINT Referee PK PRIMARY KEY (RefereeID),
CONSTRAINT _Referee_FK FOREIGN KEY (custID) REFERENCES Customer (custID)
);

-- Create table Manager - holds data on the Managers for each team
CREATE TABLE Manager
(
	ManagerID            NUMBER(6) NOT NULL ,
	animalID             NUMBER(6) NOT NULL ,
	saleDate             DATE NULL ,
CONSTRAINT Manager_PK PRIMARY KEY (ManagerID),
CONSTRAINT _Manager_FK FOREIGN KEY (custID) REFERENCES Customer (custID)
);

-- Create table Matchs - holds data on each Match for each competition
CREATE TABLE Matchs
(
	MatchID              NUMBER(6) NOT NULL ,
	animalID             NUMBER(6) NOT NULL ,
	saleDate             DATE NULL ,
CONSTRAINT Matchs_PK PRIMARY KEY (MatchID),
CONSTRAINT _Matchs_FK FOREIGN KEY (custID) REFERENCES Customer (custID)
);

-- Create table Player - holds data on the Players in each team
CREATE TABLE Player
(
	PlayerID             NUMBER(6) NOT NULL ,
	animalID             NUMBER(6) NOT NULL ,
	saleDate             DATE NULL ,
CONSTRAINT Player_PK PRIMARY KEY (PlayerID),
CONSTRAINT _Player_FK FOREIGN KEY (custID) REFERENCES Customer (custID)
);

-- Create table Sponsor - holds data on the Sponsors for each competition
CREATE TABLE Sponsor
(
	SponsorID            NUMBER(6) NOT NULL ,
	animalID             NUMBER(6) NOT NULL ,
	saleDate             DATE NULL ,
CONSTRAINT Sponsor_PK PRIMARY KEY (SponsorID),
CONSTRAINT _Sponsor_FK FOREIGN KEY (custID) REFERENCES Customer (custID)
);

-- Insert statements to populate the tables

-- Team inserted first
insert into team values(1, 'Dog', 9.99);
insert into team values(2, 'Cat', 10.20);
insert into team values(3, 'Mouse', 5.00);
-- Club inserted next
insert into customer values(1, 'D. Smith', '01 237230', 'dsmith@yahoo.co.uk	');
insert into customer values(2, 'B. Byrne', '071 237820', 'bb@gmail.com');
insert into customer values(3, 'X. Dobbs', '093 2020202', 'xdobbs@mail.com');
-- Competition inserted next
insert into animal values(1, 'Tiny', '01 JUN 2010',1);
insert into animal values(2, 'Prince', '01 JUN 2010',1);
insert into animal values(3, 'Bonnie', '01 MAR 2014',1);
-- Referee inserted next
insert into team values(1, 'Dog', 9.99);
insert into team values(2, 'Cat', 10.20);
insert into team values(3, 'Mouse', 5.00);
-- Manager inserted next
insert into team values(1, 'Dog', 9.99);
insert into team values(2, 'Cat', 10.20);
insert into team values(3, 'Mouse', 5.00);
-- Matchs inserted next
insert into team values(1, 'Dog', 9.99);
insert into team values(2, 'Cat', 10.20);
insert into team values(3, 'Mouse', 5.00);
-- Player inserted next
insert into team values(1, 'Dog', 9.99);
insert into team values(2, 'Cat', 10.20);
insert into team values(3, 'Mouse', 5.00);
-- Sponsor inserted finally
insert into animalsale values(2,2,'11 Jun 2012');
insert into animalsale values(2,4,'12 MAR 2014');

-- Commit included to persist the data
commit;