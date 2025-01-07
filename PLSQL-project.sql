CREATE TABLE Users (
    User_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100) UNIQUE NOT NULL,
    Phone VARCHAR2(15) UNIQUE NOT NULL,
    Password VARCHAR2(50) NOT NULL,
    User_Type VARCHAR2(10) CHECK (User_Type IN ('Admin', 'Customer')) NOT NULL
);

CREATE TABLE Movies (
    Movie_ID NUMBER PRIMARY KEY,
    Title VARCHAR2(100) NOT NULL,
    Genre VARCHAR2(50),
    Duration NUMBER CHECK (Duration > 0), -- in minutes
    Release_Date DATE
);

CREATE TABLE Theaters (
    Theater_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Location VARCHAR2(200) NOT NULL,
    Total_Seats NUMBER CHECK (Total_Seats > 0) NOT NULL
);

CREATE TABLE Shows (
    Show_ID NUMBER PRIMARY KEY,
    Theater_ID NUMBER NOT NULL,
    Movie_ID NUMBER NOT NULL,
    Show_Time TIMESTAMP NOT NULL,
    Available_Seats NUMBER CHECK (Available_Seats >= 0),
    FOREIGN KEY (Theater_ID) REFERENCES Theaters(Theater_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movies(Movie_ID)
);

CREATE TABLE Bookings (
    Booking_ID NUMBER PRIMARY KEY,
    User_ID NUMBER NOT NULL,
    Show_ID NUMBER NOT NULL,
    Seats_Booked NUMBER CHECK (Seats_Booked > 0) NOT NULL,
    Booking_Date DATE DEFAULT SYSDATE NOT NULL,
    Total_Amount NUMBER(10, 2) CHECK (Total_Amount >= 0) NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Show_ID) REFERENCES Shows(Show_ID)
);

CREATE TABLE Payments (
    Payment_ID NUMBER PRIMARY KEY,
    Booking_ID NUMBER NOT NULL,
    Payment_Date DATE DEFAULT SYSDATE NOT NULL,
    Amount NUMBER(10, 2) CHECK (Amount >= 0) NOT NULL,
    Payment_Mode VARCHAR2(20) CHECK (Payment_Mode IN ('Credit Card', 'Debit Card', 'UPI', 'Net Banking', 'Cash')),
    FOREIGN KEY (Booking_ID) REFERENCES Bookings(Booking_ID)
);

CREATE TABLE Seats (
    Seat_ID NUMBER PRIMARY KEY,
    Show_ID NUMBER NOT NULL,
    Seat_Number VARCHAR2(10) NOT NULL,
    Status VARCHAR2(10) CHECK (Status IN ('Booked', 'Available')) NOT NULL,
    FOREIGN KEY (Show_ID) REFERENCES Shows(Show_ID)
);


INSERT INTO Users (User_ID, Name, Email, Phone, Password, User_Type) 
VALUES (1, 'John Doe', 'john@example.com', '9876543210', 'password123', 'Customer');
INSERT INTO Users (User_ID, Name, Email, Phone, Password, User_Type)
VALUES (2, 'Jane Smith', 'jane.smith@yahoo.com', '9123456789', 'jane2024', 'Customer');

INSERT INTO Users (User_ID, Name, Email, Phone, Password, User_Type)
VALUES (3, 'Alice Johnson', 'alice.j@outlook.com', '9988776655', 'alice@123', 'Admin');

INSERT INTO Users (User_ID, Name, Email, Phone, Password, User_Type)
VALUES (4, 'Bob Brown', 'bob.brown@gmail.com', '8765432109', 'bobsecure', 'Customer');


INSERT INTO Movies (Movie_ID, Title, Genre, Duration, Release_Date) 
VALUES (1, 'Inception', 'Sci-Fi', 148, TO_DATE('2010-07-16', 'YYYY-MM-DD'));

INSERT INTO Movies (Movie_ID, Title, Genre, Duration, Release_Date)
   VALUES (2, 'Avatar', 'Action', 162, TO_DATE('2009-12-18', 'YYYY-MM-DD'));

INSERT INTO Movies (Movie_ID, Title, Genre, Duration, Release_Date)
VALUES (3, 'The Dark Knight', 'Action', 152, TO_DATE('2008-07-18', 'YYYY-MM-DD'));

INSERT INTO Movies (Movie_ID, Title, Genre, Duration, Release_Date)
VALUES (4, 'Frozen', 'Animation', 102, TO_DATE('2013-11-27', 'YYYY-MM-DD'));

INSERT INTO Theaters (Theater_ID, Name, Location, Total_Seats) 
VALUES (1, 'PVR Cinemas', 'City Center', 150);
INSERT INTO Theaters (Theater_ID, Name, Location, Total_Seats)
VALUES (2, 'INOX', 'Mall Road', 200);

INSERT INTO Theaters (Theater_ID, Name, Location, Total_Seats)
VALUES (3, 'Carnival Cinemas', 'Downtown', 120);

INSERT INTO Theaters (Theater_ID, Name, Location, Total_Seats)
VALUES (4, 'Cinepolis', 'High Street', 180);

INSERT INTO Shows (Show_ID, Theater_ID, Movie_ID, Show_Time, Available_Seats)
VALUES (2, 2, 2, TO_TIMESTAMP('2025-01-05 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 200);

INSERT INTO Shows (Show_ID, Theater_ID, Movie_ID, Show_Time, Available_Seats)
VALUES (3, 3, 3, TO_TIMESTAMP('2025-01-05 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 120);

INSERT INTO Shows (Show_ID, Theater_ID, Movie_ID, Show_Time, Available_Seats)
VALUES (4, 4, 4, TO_TIMESTAMP('2025-01-06 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 180)

INSERT INTO Shows (Show_ID, Theater_ID, Movie_ID, Show_Time, Available_Seats) 
VALUES (1, 1, 1, TO_TIMESTAMP('2025-01-04 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 150);


   INSERT INTO Bookings (Booking_ID, User_ID, Show_ID, Seats_Booked, Total_Amount)
   VALUES (1, 1, 1, 2, 400);

   INSERT INTO Bookings (Booking_ID, User_ID, Show_ID, Seats_Booked, Total_Amount)
   VALUES (2, 2, 2, 4, 800);

   INSERT INTO Bookings (Booking_ID, User_ID, Show_ID, Seats_Booked, Total_Amount)
   VALUES (3, 3, 3, 3, 600);

   INSERT INTO Bookings (Booking_ID, User_ID, Show_ID, Seats_Booked, Total_Amount)
   VALUES (4, 4, 4, 1, 200);


   INSERT INTO Payments (Payment_ID, Booking_ID, Payment_Date, Amount, Payment_Method)
   VALUES (1, 1, SYSDATE, 400, 'Credit Card');

   INSERT INTO Payments (Payment_ID, Booking_ID, Payment_Date, Amount, Payment_Method)
   VALUES (2, 2, SYSDATE, 800, 'UPI');

   INSERT INTO Payments (Payment_ID, Booking_ID, Payment_Date, Amount, Payment_Method)
   VALUES (3, 3, SYSDATE, 600, 'Debit Card');

   INSERT INTO Payments (Payment_ID, Booking_ID, Payment_Date, Amount, Payment_Method)
   VALUES (4, 4, SYSDATE, 200, 'Cash');
   


SELECT s.Show_ID, m.Title, t.Name AS Theater, s.Show_Time, s.Available_Seats
FROM Shows s
JOIN Movies m ON s.Movie_ID = m.Movie_ID
JOIN Theaters t ON s.Theater_ID = t.Theater_ID
WHERE s.Available_Seats > 0
ORDER BY s.Show_Time;

-- -Procedure to Calculate Total Ticket Cost
CREATE OR REPLACE PROCEDURE Calculate_Total_Cost (
    p_Booking_ID IN NUMBER,
    p_Ticket_Price IN NUMBER,
    p_Total_Cost OUT NUMBER
) AS
    Seats_Booked NUMBER;
BEGIN
    SELECT Seats_Booked INTO Seats_Booked
    FROM Bookings
    WHERE Booking_ID = p_Booking_ID;

    p_Total_Cost := Seats_Booked * p_Ticket_Price;
END;
/
-- Procedure to Generate Booking Receipt

CREATE OR REPLACE PROCEDURE Generate_Booking_Receipt (
    p_Booking_ID IN NUMBER
) AS
    User_Name VARCHAR2(50);
    Movie_Title VARCHAR2(100);
    Show_Time TIMESTAMP;
    Seats_Booked NUMBER;
    Total_Amount NUMBER;
BEGIN
    SELECT u.Name, m.Title, s.Show_Time, b.Seats_Booked, b.Total_Amount
    INTO User_Name, Movie_Title, Show_Time, Seats_Booked, Total_Amount
    FROM Bookings b
    JOIN Users u ON b.User_ID = u.User_ID
    JOIN Shows s ON b.Show_ID = s.Show_ID
    JOIN Movies m ON s.Movie_ID = m.Movie_ID
    WHERE b.Booking_ID = p_Booking_ID;

    DBMS_OUTPUT.PUT_LINE('Receipt for Booking ID: ' || p_Booking_ID);
    DBMS_OUTPUT.PUT_LINE('Customer: ' || User_Name);
    DBMS_OUTPUT.PUT_LINE('Movie: ' || Movie_Title);
    DBMS_OUTPUT.PUT_LINE('Show Time: ' || Show_Time);
    DBMS_OUTPUT.PUT_LINE('Seats Booked: ' || Seats_Booked);
    DBMS_OUTPUT.PUT_LINE('Total Amount: ' || Total_Amount);
END;
/

-- Trigger to Update Seat Availability After Booking

CREATE OR REPLACE TRIGGER Update_Seat_Availability
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Shows
    SET Available_Seats = Available_Seats - :NEW.Seats_Booked
    WHERE Show_ID = :NEW.Show_ID;
END;
/