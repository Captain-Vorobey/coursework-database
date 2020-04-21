USE master;
GO

drop database if exists Phones;
GO

create database Phones;
GO

use Phones;
GO

DROP TABLE IF EXISTS Countries;
DROP TABLE IF EXISTS Cities;
DROP TABLE IF EXISTS Streets;
DROP TABLE IF EXISTS Buildings;
DROP TABLE IF EXISTS Flats;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS PhonesCategories;
DROP TABLE IF EXISTS Phones;
GO

CREATE TABLE Countries(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	[name] NVARCHAR(MAX) NOT NULL
);

CREATE TABLE Cities(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	[name] NVARCHAR(MAX) NOT NULL,
	country_id INT NOT NULL,
	FOREIGN KEY (country_id) REFERENCES Countries(id)
);

CREATE TABLE Streets(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	[name] NVARCHAR(MAX) NOT NULL,
	city_id INT NOT NULL,
	FOREIGN KEY (city_id) REFERENCES Cities(id)
);

CREATE TABLE Buildings(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	street_id INT NOT NULL,
	FOREIGN KEY (street_id) REFERENCES Streets(id)
);

CREATE TABLE Flats(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	building_id INT NOT NULL,
	FOREIGN KEY (building_id) REFERENCES Buildings(id)
);

CREATE TABLE Clients(
	[hash] NVARCHAR(32) PRIMARY KEY,
	nickname NVARCHAR(255) NOT NULL,
	flat_id INT NOT NULL,
	FOREIGN KEY (flat_id) REFERENCES Flats(id)
);

CREATE TABLE PhonesCategories(
	[name] NVARCHAR(255) PRIMARY KEY
);

CREATE TABLE Phones(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	[name] NVARCHAR(MAX) NOT NULL,
	p_category NVARCHAR(255) NOT NULL,
	p_description NVARCHAR(255) NOT NULL,
	p_price DECIMAL(19, 4) NOT NULL,
	p_image NVARCHAR(255) NOT NULL,
	p_cpu NVARCHAR(255) NOT NULL,
	p_camera NVARCHAR(255) NOT NULL,
	p_size NVARCHAR(255) NOT NULL,
	p_weight INT NOT NULL,
	p_displey NVARCHAR(255) NOT NULL,
	p_barrety NVARCHAR(255) NOT NULL,
	p_memory NVARCHAR(255) NOT NULL,
	FOREIGN KEY (p_category) REFERENCES PhonesCategories([name])
);