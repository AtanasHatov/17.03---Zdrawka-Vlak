CREATE DATABASE RailwayStationDB

CREATE TABLE Trains(
[train_id] INT PRIMARY KEY IDENTITY(1,1),
[train_number] NVARCHAR(10) UNIQUE,
[capacity] INT
);

CREATE TABLE [Routes](
[routes_id] INT PRIMARY KEY IDENTITY(1,1),
[train_id] INT FOREIGN KEY REFERENCES Trains([train_id]),
[departure_station] VARCHAR(100),
[arrival_station] VARCHAR(100),
[departure_time] DATETIME,
[arrival_time] DATETIME
);

CREATE TABLE Tracks(
[tracks_id] INT PRIMARY KEY IDENTITY(1,1),
[station_name] VARCHAR(100),
[track_number] INT UNIQUE,
[train_id] INT FOREIGN KEY REFERENCES Trains([train_id])
);

CREATE TABLE Tickets(
[ticket_id]  INT PRIMARY KEY IDENTITY(1,1),
[passenger_name] VARCHAR(100),
[train_id] INT FOREIGN KEY REFERENCES Trains([train_id]),
[route_id]  INT FOREIGN KEY REFERENCES Routes([routes_id]),
[seat_number] VARCHAR(10),
[price] DECIMAL(10,2)
);

CREATE TABLE Employees(
[employees_ID] INT PRIMARY KEY IDENTITY(1,1),
[name] VARCHAR(100),
[position] VARCHAR(50),
[train_id] INT FOREIGN KEY REFERENCES Trains([train_id])
);

INSERT INTO Trains (train_number, capacity) VALUES 
('EXP100', 300), 
('REG200', 150), 
('FRT300', 500); 

INSERT INTO Routes (train_id, departure_station, arrival_station, departure_time, arrival_time) VALUES 
(1, 'Sofia', 'Varna', '2025-03-16 08:00:00', '2025-03-16 14:30:00'), 
(2, 'Sofia', 'Plovdiv', '2025-03-16 09:30:00', '2025-03-16 11:00:00'), 
(3, 'Burgas', 'Ruse', '2025-03-16 10:00:00', '2025-03-16 18:00:00'); 

INSERT INTO Tracks (station_name, track_number, train_id) VALUES 
('Central Station Sofia', 1, 1), 
('Central Station Sofia', 2, 2), 
('Plovdiv Station', 3, NULL), 
('Varna Station', 4, 3); 

INSERT INTO Tickets (passenger_name, train_id, route_id, seat_number, price) VALUES 
('John Smith', 1, 1, '12A', 45.50), 
('Emma Johnson', 2, 2, '8B', 15.00), 
('George Brown', 3, 3, '5C', 60.00), 
('Sophia Wilson', 1, 1, '7D', 45.50); 

INSERT INTO Employees (name, position, train_id) VALUES 
('Michael Davis', 'Train Driver', 1), 
('James Miller', 'Conductor', 2), 
('Robert Taylor', 'Operator', NULL), 
('William Anderson', 'Train Driver', 3); 