--Phase 2 DDL
drop schema if exists projectschema cascade; 
create schema projectschema;
set search_path to projectschema;

--Countries table
--A tuple represents a country’s Population, PopulationDensity, and how it
--measures testing, TestsUnit.
create table countries(
	country TEXT primary key,
	population INT NOT NULL,
	population_density FLOAT DEFAULT 0.0,
	tests_units TEXT DEFAULT 'Tests performed'
);

--Cases and Deaths table
-- A tuple represents information on a country’s number of TotalCases, NewCases,
--TotalDeaths, and NewDeaths on a specific date
create table CasesAndDeaths(
	country TEXT REFERENCES countries (country),
	date DATE,--Not null from primary key
	totalcases INT DEFAULT 0,
	newCases INT DEFAULT 0,
	totalDeaths INT DEFAULT 0,
	newDeaths INT DEFAULT 0,
	PRIMARY KEY (country,date)
);

--TestsAndPositivity Table
-- A tuple represents information on a country’s StringencyIndex, number of
--TotalTests and NewTests, PositiveRate, and TestsPerCase on a specific date
create table TestsAndPositivity(
	country TEXT REFERENCES countries (country),
	date DATE,
	stringencyindex FLOAT DEFAULT 0,
	totaltests INT DEFAULT 0,
	newtests INT DEFAULT 0,
	positiverate FLOAT DEFAULT 0.0,
	testspercase FLOAT DEFAULT 0.0,
	PRIMARY KEY(country,date)
);

--Hospitalization table
-- A tuple in this relation would represent the number of ICUPatients and the
--number of HospitalPatients on a given date in the given country
create table hospitalization(
	country TEXT REFERENCES countries (country),
	date DATE,
	icupatients INT,
	hospitalpatients INT,
	PRIMARY KEY(country,date)
);


--Vaccinations table
-- A tuple in this relation represents the TotalVaccination doses administered, the
--number of PeopleVaccinated, the number of PeopleFullyVaccinated, and the
--number of NewVaccinations on a given date in a given country
create table vaccinations(
	country TEXT REFERENCES countries (country),
	date DATE,
	totalvaccinations BIGINT DEFAULT 0,
	peoplevaccinated INT DEFAULT 0,
	peoplefullyvaccinated INT DEFAULT 0, 
	newvaccinations INT DEFAULT 0,
	PRIMARY KEY(country,date)
);


--VaccineManufacturers table
-- A tuple in this relation represents the number of vaccine doses administered,
--TotalVaccinations, for a given vaccine Manufacturer on a given date in a given
--country
create table vaccinemanufacturer(
	country TEXT REFERENCES countries (country),
	date DATE,
	manufacturer TEXT NOT NULL,
	totalvaccinations INT NOT NULL,
	PRIMARY KEY(country,date,manufacturer)
);
